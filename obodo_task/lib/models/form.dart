import 'package:obodo_task/models/information_item.dart';

class FormData {
  String id;
  List<InformationItem> informationItems;
  String lastTimeStamp;

  FormData({this.id, this.informationItems, this.lastTimeStamp});

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
        informationItems: List<InformationItem>.from(
            json["fields"].map((x) => InformationItem.fromJson(x))),
        lastTimeStamp:
            json["lastTimeStamp"] == null ? null : json["lastTimeStamp"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fields": List<dynamic>.from(informationItems.map((x) => x.toJson())),
        "lastTimeStamp": lastTimeStamp == null ? null : lastTimeStamp,
        "id": id == null ? null : id,
      };
}

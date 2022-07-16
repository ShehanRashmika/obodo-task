import 'dart:convert';

import 'package:flutter/material.dart';

List<InformationItem> informationItemFromJson(String str) =>
    List<InformationItem>.from(
        json.decode(str).map((x) => InformationItem.fromJson(x)));

List<dynamic> informationItemToJson(List<InformationItem> data) =>
    List<dynamic>.from(data.map((x) => x.toJson()));

class InformationItem {
  String id;
  String label;
  String data;
  TextEditingController controller;

  InformationItem({this.id, this.label, this.controller, this.data});

  factory InformationItem.fromJson(Map<String, dynamic> json) =>
      InformationItem(
        id: json["id"] == null ? null : json["id"],
        label: json["label"] == null ? null : json["label"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "label": label == null ? null : label,
        "data": data == null ? null : data,
      };
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:obodo_task/models/form.dart';
import 'package:obodo_task/models/information_item.dart';
import 'package:nanoid/nanoid.dart';

class InformationProvider with ChangeNotifier {
  List<InformationItem> informationItems = [];
  List<FormData> forms = [];

  void addInformationItem(InformationItem informationItem) {
    informationItems.add(informationItem);
    notifyListeners();
  }

  Future<void> submit() async {
    informationItems.forEach((element) {
      element.data = element.controller.text.trim();
    });

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('forms');

    var formID = nanoid();
    String lastTimeStamp = DateTime.now().millisecondsSinceEpoch.toString();

    FormData form = FormData(
        id: formID,
        lastTimeStamp: lastTimeStamp,
        informationItems: informationItems);

    await collectionReference.doc(formID).set(form.toJson()).then((value) {
      clearList();
    });
  }

  clearList() {
    informationItems = [];
    notifyListeners();
  }

  fetchForms() async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('forms');

      await collectionReference
          .orderBy("lastTimeStamp", descending: true)
          .get()
          .then((snapshot) {
        if (snapshot.docs != null) {
          forms = [];
          snapshot.docs.forEach((form_) {
            FormData poem = FormData.fromJson(form_.data());
            forms.add(poem);
          });
          notifyListeners();
        }
      });
    } catch (err) {
      print(err);
    }
  }
}

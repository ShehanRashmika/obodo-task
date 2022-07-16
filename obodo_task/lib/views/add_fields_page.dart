import 'package:flutter/material.dart';
import 'package:obodo_task/components/main_button.dart';
import 'package:obodo_task/components/snackbar_dialog.dart';
import 'package:obodo_task/models/information_item.dart';
import 'package:obodo_task/providers/information_provider.dart';
import 'package:provider/provider.dart';
import 'package:nanoid/nanoid.dart';

import '../components/main_textfield.dart';

class AddFieldsPage extends StatefulWidget {
  static const routeName = "/add-fields-page";

  @override
  _AddFieldsPageState createState() => _AddFieldsPageState();
}

class _AddFieldsPageState extends State<AddFieldsPage> {
  TextEditingController controller = TextEditingController();

  addField() {
    if (controller.text.trim().isEmpty) {
      SnackBarDialog.showSnackBar(context, "Please add a label name",
          isNormal: false);
      return;
    }
    var id = nanoid();
    var informationItem = InformationItem(
        id: id,
        label: controller.text.trim(),
        controller: TextEditingController());

    Provider.of<InformationProvider>(context, listen: false)
        .addInformationItem(informationItem);

    controller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Fields"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainTextField(
              controller: controller,
              hint: "Add field label",
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: MainButton(
                label: "Add",
                onClick: addField,
              ),
            )
          ],
        ),
      ),
    );
  }
}

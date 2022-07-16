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
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<InformationProvider>(context, listen: false)
                    .clearList();
              },
              child: Text(
                "clear all",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
              ),
              const SizedBox(height: 20),
              Divider(),
              Consumer<InformationProvider>(builder: (ctx, provider, child) {
                if (provider.informationItems.isEmpty) return SizedBox();

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                      itemCount: provider.informationItems.length,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                              title: Text(
                                "${provider.informationItems[index].label}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("text field added"),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  Provider.of<InformationProvider>(context,
                                          listen: false)
                                      .removeItem(
                                          provider.informationItems[index]);
                                },
                              )),
                        );
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:obodo_task/components/main_button.dart';
import 'package:obodo_task/components/main_textfield.dart';
import 'package:obodo_task/components/snackbar_dialog.dart';
import 'package:obodo_task/providers/information_provider.dart';
import 'package:provider/provider.dart';

class AddInfomrationPage extends StatefulWidget {
  static const routeName = "/add-info-page";

  @override
  _AddInfomrationPageState createState() => _AddInfomrationPageState();
}

class _AddInfomrationPageState extends State<AddInfomrationPage> {
  void submit() async {
    Provider.of<InformationProvider>(context, listen: false).submit();

    SnackBarDialog.showSnackBar(context, "Form added successfully!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Information"),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: MainButton(label: "Submit", icon: Icons.send, onClick: submit),
      ),
      body: SingleChildScrollView(
          child: Consumer<InformationProvider>(builder: (ctx, provider, child) {
        if (provider.informationItems.isEmpty)
          return Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(child: const Text("No fields found")),
          );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
              itemCount: provider.informationItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MainTextField(
                    controller: provider.informationItems[index].controller,
                    hint: provider.informationItems[index].label,
                  ),
                );
              }),
        );
      })),
    );
  }
}

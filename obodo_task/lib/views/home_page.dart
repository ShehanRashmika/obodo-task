import 'package:flutter/material.dart';
import 'package:obodo_task/views/add_fields_page.dart';
import 'package:obodo_task/views/add_info_page.dart';
import 'package:obodo_task/views/all_forms_page.dart';

import '../components/main_button.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Obodo-Task"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AllFormsPage.routeName);
              },
              icon: Icon(Icons.format_align_center)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: MainButton(
                label: "Add Fields",
                icon: Icons.add,
                onClick: () {
                  Navigator.pushNamed(context, AddFieldsPage.routeName);
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: MainButton(
                label: "Add Infomration",
                icon: Icons.add,
                onClick: () {
                  Navigator.pushNamed(context, AddInfomrationPage.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

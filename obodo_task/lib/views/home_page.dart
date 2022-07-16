import 'package:flutter/material.dart';
import 'package:obodo_task/views/add_fields_page.dart';
import 'package:obodo_task/views/add_info_page.dart';
import 'package:obodo_task/views/all_forms_page.dart';
import 'package:provider/provider.dart';

import '../components/main_button.dart';
import '../providers/information_provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<InformationProvider>(context, listen: false).getFromLocal();
    super.initState();
  }

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
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: MainButton(
                label: "View Forms",
                icon: Icons.format_align_center,
                onClick: () {
                  Navigator.pushNamed(context, AllFormsPage.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

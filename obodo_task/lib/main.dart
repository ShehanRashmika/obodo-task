import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:obodo_task/providers/information_provider.dart';
import 'package:obodo_task/views/add_fields_page.dart';
import 'package:obodo_task/views/add_info_page.dart';
import 'package:obodo_task/views/all_forms_page.dart';
import 'package:obodo_task/views/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => InformationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Obodo Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
        routes: {
          AddFieldsPage.routeName: (ctx) => AddFieldsPage(),
          AddInfomrationPage.routeName: (ctx) => AddInfomrationPage(),
          AllFormsPage.routeName: (ctx) => AllFormsPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FormItemCard extends StatelessWidget {
  String label;
  String data;

  FormItemCard({this.label, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label : ",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(data, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

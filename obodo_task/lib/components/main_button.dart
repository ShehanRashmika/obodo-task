import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  Function onClick;
  String label = "";
  IconData icon;

  MainButton({this.onClick, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(icon),
            ),
        ],
      ),
    );
  }
}

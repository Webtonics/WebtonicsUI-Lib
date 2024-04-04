import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key, required this.action, required this.title, this.bgColor= Colors.red, this.width = 200, this.height = 60});

  final VoidCallback action;
  final String title;
  final Color? bgColor;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(onPressed: action, style: ElevatedButton.styleFrom(
      backgroundColor: bgColor, minimumSize: Size(width!, height!)
    ),child: Text(title));
  }
}


import 'package:flutter/material.dart';

class MyClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  MyClickableText({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
    );
  }
}


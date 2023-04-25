import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  TitleBar({required this.title,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(onPressed: onTap, icon: const Icon(Icons.close)),
        Padding(padding: EdgeInsets.only(left: 10.0,top:0,right:0,bottom: 0)),
        Text(title,style: TextStyle(fontSize: 18,color: Colors.white),)
      ],
    );
  }
}

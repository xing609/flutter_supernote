import 'dart:ui';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  void _onImageClicked() {
    // 在这里处理图片点击事件的逻辑
    print('Image clicked!');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onImageClicked, // 设置图片点击事件的回调函数
      child: Container(
        child: Image(
          image: AssetImage('assets/images/image.jpg'),
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}

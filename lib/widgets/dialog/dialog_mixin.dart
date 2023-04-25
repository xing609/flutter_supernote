import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
///展示加载DialogLoading
mixin DialogMixin {
  void showLoadingDialog() {
    Get.dialog(Center(
      child: Image.asset(
        "assets/images/loading/common_loading.png",
        height: 100,
        width: 100,
      ),
    ));
  }

  void showMsgLoadingDialog(String message) {
    Get.dialog(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16.0),
            Text(
              message,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
      barrierDismissible: false, // 禁止点击背景关闭对话框
    );
  }

  Future<void> hideLoadingDialog() async {
    Get.back();
  }
}

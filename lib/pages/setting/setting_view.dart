import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SettingLogic>();
    return Material(
        child: CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          previousPageTitle: '返回',
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        middle: const Text('设置'),
      ),
      child: Center(
        child: Text("UI"),
      ),
    ));
  }
}

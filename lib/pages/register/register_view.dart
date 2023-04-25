import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_logic.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final logic = Get.find<RegisterLogic>();
  String? title = Get.parameters["title"];
  @override
  Widget build(BuildContext context) {
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
            middle: const Text('注册'),
          ),
          child: Center(
            child: Text("UI"),
          ),
        ));
  }
}

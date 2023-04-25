import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/routes.dart';
import '../../utils/log_utils.dart';
import '../../widgets/MyClickText.dart';
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
    return Column(
      children: <Widget>[
      Container(
      height: 60,
      margin: EdgeInsets.only(left: 20, top: 20, right: 0, bottom: 10),
        child: Align(
        child: GestureDetector(
            child: Image.asset(
              "assets/images/icon_close.png",
              height: 32,
              width: 32,
            ),
            onTap: () {
             Get.back();
             LogD("GET BACK");
            },
          ),
          alignment: Alignment.topLeft,
        )),
        Container(
          height: 70,
          child: MyClickableText(
            text: '$title',
            onTap: () {
             Get.toNamed(AppRoutes.settingPage);
              // 在这里处理点击事件
            },
          ),
        )
      ],
    );
  }
}

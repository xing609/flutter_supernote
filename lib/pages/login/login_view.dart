import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_supernote/widgets/dialog/dialog_mixin.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/log_utils.dart';
import '../../widgets/toast/toast_mixin.dart';
import 'login_logic.dart';
class LoginPage extends StatelessWidget with DialogMixin, ToastMixin {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<LoginLogic>();
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
        middle: const Text('登录'),
      ),
      child: Column(children: <Widget>[
        Container(
            height: 60,
            margin: EdgeInsets.only(left: 50, top: 120, right: 50, bottom: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "+86",
                        style: TextStyle(fontSize: 20),
                      )),
                  Padding(padding: EdgeInsets.only(right: 20)),
                  Expanded(
                      flex: 1,
                      child: TextField(
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(
                            hintText: "请输入登录帐号",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                          ),
                          onChanged: (value) {},
                          controller:
                              TextEditingController.fromValue(TextEditingValue(
                            text: '13641809635',
                          )))),
                ])),
        Container(
            height: 60,
            margin: EdgeInsets.only(left: 50, top: 0, right: 50, bottom: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        // 设置水平方向的内间距
                        child: TextField(
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20),
                            obscureText: true,
                            maxLines: 1,
                            decoration: InputDecoration(hintText: "请输入密码")),
                      ))
                ])),
        Container(
            height: 60,
            margin: EdgeInsets.only(left: 90, top: 0, right: 90, bottom: 20),
            child: Expanded(
                flex: 1,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角边界
                  ),
                  minWidth: double.infinity,
                  onPressed: () {
                    LogD("login pressed");
                    // var map1 = <String, String>{};
                    // map1["title"] = "注册" ?? "";
                    // Get.toNamed(AppRoutes.registerPage, parameters: map1);
                    // showToast("登录成功");
                    logic.login();
                  },
                  color: Colors.black,
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                )))
      ]),
    ));
  }
}

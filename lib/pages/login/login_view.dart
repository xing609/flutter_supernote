import 'package:flutter/material.dart';
import 'package:flutter_supernote/widgets/dialog/dialog_mixin.dart';
import '../../models/user.dart';
import '../../http/loginservice.dart';
import '../../http/requestListener.dart';
import '../../models/base_error.dart';
import '../../utils/log_utils.dart';
import '../../widgets/toast/toast_mixin.dart';

class LoginPage extends StatelessWidget with DialogMixin, ToastMixin {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<LoginLogic>();
    return Material(
      child: Column(
        children: <Widget>[
          Container(
              height: 60,
              margin:
                  EdgeInsets.only(left: 50, top: 120, right: 50, bottom: 20),
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
                          decoration: InputDecoration(hintText: "请输入登录帐号"),
                        )),
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

                      showLoadingDialog();

                      ///创建Map 封装参数
                      Map<String, dynamic> map = Map();
                      map['account'] = "13641809635";
                      map['equipment'] = 2;
                      map['countryCode'] = "86";
                      map['password'] = "gui000000";
                      map['equipmentNo'] = "1123344";
                      map['loginMethod'] = "1";
                      map['timestamp'] = new DateTime.now().millisecondsSinceEpoch;

                      LoginService()
                          .login(
                              map,
                              RequestListener<User>(
                                  onSuccessListener: (User user) {
                                LogD('请求成功，结果为: $user');
                                showToast("登录成功");
                                hideLoadingDialog();
                              }, onErrorListener: (BaseError error) {
                                showToast("登录失败");
                                hideLoadingDialog();
                                LogE('请求失败，错误信息为: ${error.msg}');
                              }));
                    },
                    color: Colors.black,
                    child: Text(
                      '登录',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )))
        ],
      ),
    );
  }
}

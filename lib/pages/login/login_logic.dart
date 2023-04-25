import 'package:get/get.dart';

import '../../http/loginservice.dart';
import '../../http/requestListener.dart';
import '../../models/base_error.dart';
import '../../models/user.dart';
import '../../utils/log_utils.dart';
import '../../widgets/dialog/dialog_mixin.dart';
import '../../widgets/toast/toast_mixin.dart';

class LoginLogic extends GetxController with DialogMixin, ToastMixin{
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///登录
  void login(){
    showLoadingDialog();
    ///创建Map 封装参数
    Map<String, dynamic> map = Map();
    map['account'] = "13641809635";
    map['equipment'] = 2;
    map['countryCode'] = "86";
    map['password'] = "gui000000";
    map['equipmentNo'] = "1123344";
    map['loginMethod'] = "1";
    map['timestamp'] =
        new DateTime.now().millisecondsSinceEpoch;

    LoginService().login(
        map,
        RequestListener<User>(onSuccessListener: (User user) {
          LogD('请求成功，结果为: $user');
          showToast("登录成功");
          hideLoadingDialog();
        }, onErrorListener: (BaseError error) {
          showToast("登录失败");
          hideLoadingDialog();
          LogE('请求失败，错误信息为: ${error.msg}');
        }));
  }



}

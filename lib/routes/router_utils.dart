import 'package:flutter_supernote/routes/routes.dart';
import 'package:get/get.dart';
class RouterUtils {

  ///登录
  static void toLoginPage() {
    Get.toNamed(AppRoutes.loginPage);
  }

  ///注册
  static void toRegisterPage() {
    Get.toNamed(AppRoutes.registerPage);
  }

  ///设置
  static void toSettingPage(int? id) {
    Get.toNamed(
        AppRoutes.settingPage,
        arguments: id);
  }



}

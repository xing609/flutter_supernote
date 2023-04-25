import 'package:flutter_supernote/pages/home/home_binding.dart';
import 'package:flutter_supernote/pages/home/home_view.dart';
import 'package:flutter_supernote/pages/login/login_view.dart';
import 'package:flutter_supernote/pages/register/register_binding.dart';
import 'package:get/get.dart';
import '../pages/login/login_binding.dart';
import '../pages/register/register_view.dart';
import '../pages/setting/setting_binding.dart';
import '../pages/setting/setting_view.dart';

abstract class AppRoutes {
  static const homePage = "/HomePage"; //首页
  static const loginPage = "/LoginPage"; //登录
  static const settingPage = "/SettingPage"; //设置
  static const registerPage = "/RegisterPage"; //注册
  static final routerPages = [
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
      name: registerPage,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
        name: AppRoutes.settingPage,
        page: () => SettingPage(),
        binding: SettingBinding())
  ];
}

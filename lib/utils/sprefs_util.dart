import 'package:flutter_supernote/utils/sprefs_value.dart';

/// 本地存储工具
class SPrefsUtil {
  static final SPrefsUtil _instance = SPrefsUtil._();
  SPrefsUtil._();
  /// 工厂方法
  factory SPrefsUtil() {
    return _instance;
  }
  // 申明一个默认值为false的是否登录isLogin
  var isLogin = false.spValue('isLogin');
  // 申明一个默认值为空字符串的authToken
  var authToken = ''.spValue('Auth-Token', hasCache: true);
}



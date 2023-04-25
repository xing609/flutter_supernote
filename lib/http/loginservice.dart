import 'package:flutter_supernote/http/requestListener.dart';
import '../models/user.dart';
import 'dio_request.dart';

class LoginService {
  /// 单例模式
  static LoginService? _instance;

  factory LoginService() => _instance ?? LoginService._internal();

  static LoginService? get instance => _instance ?? LoginService._internal();

  /// 初始化
  LoginService._internal() {
    // 初始化基本选项
  }

  login(Map<String, dynamic>? params,RequestListener? requestListener) async {
    await DioUtil().request<User>('/official/user/account/login/equipment',
        method: DioMethod.post,
        params: params,
        requestListener: requestListener);
  }
}

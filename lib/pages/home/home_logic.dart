import 'package:get/get.dart';
import '../../models/setting_menu.dart';

class HomeLogic extends GetxController {
  List<SettingMenu> menuList = [];

  @override
  void onReady() {
    initData();
    super.onReady();
  }

  Future<void> initData() async {
    var menu_account = SettingMenu(0, "登录接口请求", "assets/images/icon_topic.png");
    var menu_sync_setting =
        SettingMenu(1, "Sqlite 数据库", "assets/images/icon_topic.png");
    var menu_wifi_setting =
        SettingMenu(2, "获取Sp数据", "assets/images/icon_topic.png");
    var menu_my_device = SettingMenu(3, "读Sdcrad", "assets/images/icon_topic.png");
    var menu_input = SettingMenu(4, "显示和输入", "assets/images/icon_topic.png");
    var menu_safelty = SettingMenu(5, "安全和隐私", "assets/images/icon_topic.png");
    var menu_dian = SettingMenu(6, "电池", "assets/images/icon_topic.png");
    var menu_system = SettingMenu(7, "系统", "assets/images/icon_topic.png");
    menuList.add(menu_account);
    menuList.add(menu_sync_setting);
    menuList.add(menu_wifi_setting);
    menuList.add(menu_my_device);
    menuList.add(menu_input);
    menuList.add(menu_safelty);
    menuList.add(menu_dian);
    menuList.add(menu_system);
  }

  @override
  void onClose() {
    super.onClose();
  }

}

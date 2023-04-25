import 'package:flutter/material.dart';
import 'package:flutter_supernote/utils/log_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../models/setting_menu.dart';
import '../../widgets/dialog/dialog_mixin.dart';
import '../../widgets/toast/toast_mixin.dart';
import 'menuItem.dart';

class HomePage extends StatelessWidget with DialogMixin, ToastMixin {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final homeData = Get.find<HomeLogic>();
    List<SettingMenu> menuList = [];
    var menu_account = SettingMenu(0, "登录接口请求", "assets/images/icon_topic.png");
    var menu_sync_setting =
        SettingMenu(1, "Sqlite 数据库", "assets/images/icon_topic.png");
    var menu_wifi_setting =
        SettingMenu(2, "获取Sp数据", "assets/images/icon_topic.png");
    var menu_my_device =
        SettingMenu(3, "读Sdcrad", "assets/images/icon_topic.png");
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
    LogD("homeData :${menuList.length}");
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Get.snackbar('title', 'message');
            },
          ),
          title: Text('超级笔记'.tr),
          backgroundColor: Colors.white10,
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Material(
            child: MediaQuery.removePadding(
              context: context,
              child: ListView.separated(
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return MenuItemWidget(menuList[index]);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.black26,
                  );
                },
              ),
            ),
          ),
        ));
  }
}

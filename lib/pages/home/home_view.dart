import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/dialog/dialog_mixin.dart';
import '../../widgets/toast/toast_mixin.dart';
import 'home_logic.dart';
import 'menuItem.dart';
class HomePage extends StatelessWidget with DialogMixin,ToastMixin{
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeData = Get.find<HomeLogic>();
    return Material(
      child: MediaQuery.removePadding(
        context: context,
        child: ListView.separated(
          itemCount: homeData.menuList.length,
          itemBuilder: (context, index) {
            return MenuItemWidget(homeData.menuList[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.black26,
            );
          },
        ),
      ),
    );
  }
}

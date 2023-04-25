import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tabbar_logic.dart';

class TabbarPage extends StatelessWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<TabbarLogic>();
    final state = Get.find<TabbarLogic>().state;

    return Container();
  }
}

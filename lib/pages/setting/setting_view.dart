import 'package:flutter/material.dart';
import 'package:flutter_supernote/res/colors.dart';
import 'package:get/get.dart';

import '../../res/string.dart';
import '../../routes/router_utils.dart';
import '../../widgets/MyClickText.dart';
import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SettingLogic>();

    final title=Strings.setting;
    return Column(
      children: <Widget>[
        Container(
          height: 70,
          child: MyClickableText(
            text: '$title',
            onTap: () {

            },
          ),
        )
      ],
    );
  }
}

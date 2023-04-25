import 'package:flutter/material.dart';
import 'package:flutter_supernote/models/setting_menu.dart';
import 'package:flutter_supernote/utils/log_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../db/sqlite/db_manager.dart';
import '../../models/student.dart';
import '../../routes/routes.dart';
import '../../utils/file_utils.dart';
import '../../utils/sprefs_util.dart';

class MenuItemWidget extends StatefulWidget {
  SettingMenu settingMenu; //传入item 数据
  MenuItemWidget(this.settingMenu);

  @override
  State<StatefulWidget> createState() {
    return MenuItemWidgetState();
  }
}

class MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    saveSpValue();
    return GestureDetector(
        onTap: () {
          switch (widget.settingMenu.index) {
            case 0:
              Get.toNamed(AppRoutes.loginPage);
              // testSqflite();
              break;
            case 1:
              var map = <String, String>{};
              map["title"] = "注册" ?? "";
              Get.toNamed(AppRoutes.registerPage, parameters: map);
              break;
            case 2:
              Get.toNamed(AppRoutes.settingPage);
              getSpValue();
              break;
            case 3:
              getSdcardFile();
              getWindowsDir();
              break;

          }
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Image.asset(
                widget.settingMenu.images,
                height: 32,
                width: 32,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                widget.settingMenu.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}

void saveSpValue() {
  SPrefsUtil().isLogin.setValue(true);
  SPrefsUtil().authToken.setValue('33444');
}

Future<void> getSpValue() async {
  final isLogin = await SPrefsUtil().isLogin.getValue();
  final authToken = await SPrefsUtil().authToken.getValue();
  LogD("读取Sp 数据：isLgin ${isLogin}  authToken=${authToken}");
}






Future<void> testSqflite() async {
  await addData();
  List<Student>? _studentList = await DBManager().findAll();
  var size = await _studentList?.length;
  LogD("查询所有数据=$size");
  await updateData(Student(id: 1, name: "superstar", age: 20, sex: 0));
  await deleteAllData();
}

updateData(Student student) async {
  var count = await DBManager().update(student);
  if (count > 0) {
    LogD("修改成功");
  } else {
    LogD("修改失败");
  }
}

addData() async {
  for (int i = 0; i < 10; i++) {
    await DBManager()
        .saveDataBySQL(Student(id: i, name: "star $i", age: i, sex: i));
  }
  LogD("添加数据成功");
}

deleteAllData() async {
  var count = await DBManager().deleteAll();
  if (count > 0) {
    LogD("删除全部成功");
  } else {
    LogD("删除全部失败");
  }
}

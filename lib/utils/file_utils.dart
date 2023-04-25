import 'dart:io';

import 'package:flutter/cupertino.dart';

void getSdcardFile() async {
  var list = await getDirectoryPath('sdcard');
  debugPrint('list===$list', wrapWidth: 1024);
}

//读取SDK中图片、视频文件的路径（异步读取）
getDirectoryPath(rootName) async {
  print('读取SD卡');
  //'sdcard/Android/data'没有权限读取 排除它
  var list = [];
  try {
    var systemTempDir = Directory(rootName);
    Stream<FileSystemEntity> dirsFileList =
    systemTempDir.list(recursive: false, followLinks: false);

    //一级目录,排除sdcard/Android
    await for (FileSystemEntity entity in dirsFileList) {
      final path = entity.path;
      debugPrint('path===$path');
      //判断是否有二级路由
      FileSystemEntityType type = FileSystemEntity.typeSync(path);
      if (!path.startsWith('sdcard/Android')) {
        if (type == FileSystemEntityType.directory) {
          //有二级目录
          var newList = await getDirectoryPath(path);
          list = [...list, ...newList];
        } else {
          // if (Global.isImgFormat(path) || Global.isVideoFormat(path)) {
          //   list.add(path);
          // }
        }
      }
    }
  } catch (e) {
    debugPrint('e===$e');
  }
  return list;
}

///获取windows 上存储目录
void getWindowsDir(){
  var path = Directory.current.path;
  debugPrint("windows dir path :$path");
}
import 'package:flutter/material.dart';
import 'package:flutter_supernote/pages/home/home_view.dart';
import 'package:flutter_supernote/res/string.dart';
import 'package:flutter_supernote/routes/routes.dart';
import 'package:get/get.dart';
void main() => runApp(MyApp("Hello World"));
class MyApp extends StatelessWidget {
  final String content;
  MyApp(this.content);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: AppRoutes.routerPages,
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppRoutes.homePage,
        title: Strings.appname,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        );
  }
}


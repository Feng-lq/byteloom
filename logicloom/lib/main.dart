import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs.dart';
import 'package:logicloom/pages/tabs/course/preview_page.dart';
import 'package:logicloom/pages/tabs/login/identity_page.dart';
import 'package:logicloom/pages/tabs/login/login_page01.dart';
import 'package:logicloom/utils/myStyle.dart';

import 'pages/tabs/home/history.dart';
import 'pages/tabs/home/voice_search.dart';
import 'ui/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return  GetMaterialApp(
      title: 'logicLoom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: MyColor.back,
  ),
      home: IdentifyPage(),
    );
  }
}

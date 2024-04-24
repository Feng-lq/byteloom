import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logicloom/pages/tabs/login/login_page01.dart';

import '../../../logic/login.dart';
import '../../../r.dart';
import '../../../utils/myStyle.dart';

class IdentifyPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImgBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '你的身份是?',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: screenHeight * 0.05,
                fontFamily: 'Siyuan'),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '一站式编程学习开拓者',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: MyColor.darkBlue,
                  fontSize: screenHeight * 0.025,
                  fontFamily: 'Siyuan'),
              ),
              SizedBox(
                height: 32,
              ),
              MyImageTextTapArea(
                imagePath: R.assetsImgTeacher,
                text: '我是老师',
                onTap: () {
                  authController.setTeacherStatus(true);
                  Get.to(() => LoginPage01()); // 替换 NextPage 为你想要跳转的页面
                },
              ),
              SizedBox(
                height: 16,
              ),
              MyImageTextTapArea(
                imagePath: R.assetsImgStudent,
                text: '我是学生',
                onTap: () {
                  authController.setTeacherStatus(false);
                  Get.to(() => LoginPage01()); // 替换 NextPage 为你想要跳转的页面
                },
              ),
              SizedBox(
                height: screenHeight / 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyImageTextTapArea extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  MyImageTextTapArea({
    required this.imagePath,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(R.assetsImgChoose),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
                  scale: 1.5, // 调整放大倍数
                  child: Image(
                    image: AssetImage(imagePath),
                    height: 100.0,
                    width: 80.0,
                    fit: BoxFit.contain,
                  ),
                ),
            SizedBox(width: 48.0),
            Text(
              text,
              style: TextStyle(
                color: MyColor.darkBlue,
                fontSize: 32.0,
                fontFamily: 'Siyuan'
              ),
            ),
          ],
        ),
      ),
    );
  }
}

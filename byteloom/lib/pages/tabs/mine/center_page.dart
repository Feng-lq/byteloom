import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logicloom/pages/tabs/mine/center/achievement_page.dart';
import 'package:logicloom/pages/tabs/mine/center/help_page.dart';
import 'package:logicloom/pages/tabs/mine/center/myclass_page.dart';
import 'package:logicloom/pages/tabs/mine/center/notebook_page.dart';
import 'package:logicloom/pages/tabs/mine/center/settings_page.dart';
import 'package:logicloom/pages/tabs/mine/personal_page.dart';
import 'package:logicloom/utils/myStyle.dart';

import '../../../logic/login.dart';
import '../../../r.dart';
import '../../../ui/user.dart';

class MyCenter extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImgPersonalCenter),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32,),
                        const Text(
                          'Hi, 码小跳',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '一起来感受代码的心跳吧~',
                          style: TextStyle(
                            fontSize: 13,
                            color: MyColor.signblue,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            '编辑个人资料',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: screenWidth * (1 / 3),
                      child: const Image(
                        image: AssetImage(R.assetsImgCenterperson),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                margin: EdgeInsets.all(12),
                // height: screenHeight*(1/6),
                decoration: BoxDecoration(
                  color: MyColor.nullcolor,
                  borderRadius: BorderRadius.circular(10), // 添加圆角
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          UsageStatsWidget(
                            timeSpent: 32,
                            accumulatedDays: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: MyColor.nullcolor,
                  borderRadius: BorderRadius.circular(10), // 添加圆角
                ),
                child: Column(
                  children: [
                    CustomListItem(
                      leftIcon: MyIcon.document,
                      text: '个人资料',
                      onTap: () {
                        // 跳转逻辑
                        Get.to(ProfilePage());
                      },
                    ),
                    CustomListItem(
                      leftIcon: MyIcon.classs,
                      text: '我的课程',
                      onTap: () {
                        // 跳转逻辑
                        Get.to(Myclass());
                      },
                    ),
                    CustomListItem(
                      leftIcon: MyIcon.accomplishment,
                      text: '我的成就',
                      onTap: () {
                        // 跳转逻辑
                        Get.to(AchievementPage());
                      },
                    ),
                    CustomListItem(
                      leftIcon: MyIcon.note,
                      text: '笔记本',
                      onTap: () {
                        // 跳转逻辑
                        Get.to(NoteBook());
                      },
                    ),
                    CustomListItem(
                      leftIcon: MyIcon.help,
                      text: '帮助和反馈',
                      onTap: () {
                        // 跳转逻辑
                        Get.to(HelpPage());
                      },
                    ),
                    CustomListItem(
                      leftIcon: MyIcon.settings,
                      text: '设置',
                      onTap: () {
                        // 跳转逻辑
                        Get.to(SettingPage());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UsageStatsWidget extends StatelessWidget {
  final int timeSpent;
  final int accumulatedDays;

  UsageStatsWidget({
    required this.timeSpent,
    required this.accumulatedDays,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text(
                    '今日使用',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$timeSpent',
                          style: const TextStyle(
                            fontSize: 28, // 修改字体大小
                            color: Colors.blue, // 修改颜色
                          ),
                        ),
                        const TextSpan(
                          text: '分钟/30分钟',
                          style: TextStyle(
                            fontSize: 10,
                            // color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    '累计天数',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$accumulatedDays',
                          style: const TextStyle(
                            fontSize: 28, // 修改字体大小
                            color: Colors.blue, // 修改颜色
                          ),
                        ),
                        const TextSpan(
                          text: '天',
                          style: TextStyle(
                            fontSize: 10,
                            // color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.emoji_events, color: MyColor.darkBluesign),
            SizedBox(width: 8),
            Text(
              '已达到今日成就，再接再厉吧！',
              style: TextStyle(fontSize: 8, color: MyColor.darkBluesign),
            ),
          ],
        ),
      ],
    );
  }
}

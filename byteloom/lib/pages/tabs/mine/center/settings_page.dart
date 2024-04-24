import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs/login/identity_page.dart';

import '../../../../ui/user.dart';
import '../../../../utils/myStyle.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.back,
      appBar: AppBar(
        title: const Text(
          '设置',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: MyColor.back,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          _buildSettingItem(
            title: '信息通知',
            onTap: () {},
          ),
          SizedBox(height: 32),
          _buildSettingItem(
            title: '账号安全',
            onTap: () {},
          ),
          SizedBox(height: 32),
          _buildSettingItem(
            title: '清理系统缓存',
            rightText: '30.66MB',
            onTap: () {},
          ),
          SizedBox(height: 32),
          _buildSettingItem(
            title: '版本更新',
            rightText: '当前为最新版本',
            onTap: () {},
          ),
          SizedBox(height: 32),
          _buildSettingItem(
            title: '关于LogicLoom',
            onTap: () {},
          ),
          SizedBox(height: 32), // 调整垂直间距
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    String? rightText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0), // 添加左右间距
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            if (rightText != null) // 右侧文本可选
              Text(
                rightText,
                style: TextStyle(color: Colors.grey), // 不必要的颜色设置
              ),
            SizedBox(width: 8), // 添加水平间距
            MyIcon.arrow, // 使用内置图标
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0), // 调整左右间距
      child: ElevatedButton(
        onPressed: () {
          Get.to(IdentifyPage());
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text('退出登录'),
      ),
    );
  }
}

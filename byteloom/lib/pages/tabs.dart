import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs/class/class_page.dart';
import 'package:logicloom/pages/tabs/community/community.dart';
import 'package:logicloom/pages/tabs/course/course_page.dart';
import 'package:logicloom/pages/tabs/home/home_page.dart';
import 'package:logicloom/pages/tabs/mine/center_page.dart';
import 'package:logicloom/utils/myStyle.dart';

import '../r.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  // 控制底部导航栏索引的变量
  final RxInt selectedIndex = 0.obs;

  // 对应底部导航栏的各个页面
  final List<Widget> pages = [
    CoursePage(),
    Myclass(),
    HomePage(),
    CommunityPage(),
    MyCenter(),
  ];

  // 提取底部导航栏配置为常量
  static const List<BottomNavigationBarItem> navBarItems = [
    BottomNavigationBarItem(
      icon: MyIcon.courseIcon,
      label: '课程',
    ),
    BottomNavigationBarItem(
      icon: MyIcon.classIcon,
      label: '班级',
    ),
    BottomNavigationBarItem(
      icon: MyIcon.searchIcon,
      label: ' ',
    ),
    BottomNavigationBarItem(
      icon: MyIcon.communicateIcon,
      label: '社区',
    ),
    BottomNavigationBarItem(
      icon: MyIcon.mineIcon,
      label: '我的',
    ),
  ];

  BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用Obx来监听状态变化
    return Obx(
      () => Scaffold(
        // 页面的骨架，包含Body和BottomNavigationBar
        body: Stack(
          children: [
            // 使用图片背景并设置弧线
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100, // 设置图片背景高度，根据实际需要调整
                child: Image(
                  image: AssetImage(R.assetsImgNavigationBarBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // 实现页面跳转
            Positioned.fill(
              child: Center(
                child: pages[selectedIndex.value],
              ),
            ),
            // BottomNavigationBar
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationBar(
                fixedColor: MyColor.blue, // 设置底部导航栏选中项的颜色
                type: BottomNavigationBarType.fixed, // 固定显示所有图标
                items: navBarItems,
                currentIndex: selectedIndex.value,
                onTap: (index) => selectedIndex.value = index,
              ),
            ),
          ],
        ),
        // 底部浮动按钮
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            selectedIndex.value = 2;
          },
          child: MyIcon.searchIcon,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

// 自定义裁剪器，用于实现底部导航栏上方的弧线
class CurvedBottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50); // 从左下角开始
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50); // 曲线到右下角
    path.lineTo(size.width, 0); // 到右上角的线
    path.close(); // 关闭路径
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('页面2内容'),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('页面1内容'),
    );
  }
}

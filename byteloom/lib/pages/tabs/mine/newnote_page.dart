import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/text.dart';
import '../../../utils/myStyle.dart';
import '../../tabs.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({Key? key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _contextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '新建笔记',
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
          Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('标题', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '请输入笔记标题',
              ),
            ),
            SizedBox(height: 16), // 添加字段之间的间距
            Text('内容', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              height: screenHeight * 0.3,
              padding:
                  EdgeInsets.symmetric(horizontal: 10.0), // 可选，用于控制文本与边框之间的间距
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black, // 边框颜色
                  width: 1.0, // 边框宽度
                ),
              ),
              child: TextField(
                controller: _contextController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none, // 移除TextField自带的边框
                  hintText: '请输入题目',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_photo_alternate_outlined)),
            SizedBox(
              height: 8,
            ),
            Text('标签'),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.add_circle_sharp,
              color: Colors.blue,
            ),
            SizedBox(
              height: 8,
            ),
            Text('历史标签'),
          ],
        ),
      ),
        ],
      )
    );
  }
}

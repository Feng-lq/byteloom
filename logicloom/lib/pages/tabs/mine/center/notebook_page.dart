import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs/mine/newnote_page.dart';

import '../../../../ui/note.dart';
import '../../../../ui/search.dart';
import '../../../../utils/myStyle.dart';

class NoteBook extends StatelessWidget {
  const NoteBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('笔记本',
              style: TextStyle(
                color: Colors.black,
              )),
          backgroundColor: MyColor.back,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(NewNotePage());
              },
              icon: Icon(
                Icons.add_circle_sharp,
                color: Colors.blue,
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            Search(onSearch: (String ) {  },),
            Expanded(
                child: ListView(
              children: [
                CustomCard(
                  color: Colors.blue,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.red,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.orange,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.pink,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.purple,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.blue,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.blue,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.blue,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
                CustomCard(
                  color: Colors.blue,
                  title: '二叉树基本术语',
                  createTime: '2024年3月18日',
                  tags: ['标签1', '标签2', '标签3'],
                ),
              ],
            )),
            const SizedBox(
              height: 8,
            ),
          ],
        ));
  }
}

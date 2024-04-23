import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../ui/text.dart';
import '../../../utils/myStyle.dart';
import '../../tabs.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16), // 添加下方间隔
                  child: CustomContainer(
                    text:
                        '给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。你可以假设数组是非空的123123121313321312132',
                    buttonText: '收藏',
                    readers: 110,
                    onPressed: () {
                      // 点击按钮时的操作
                    },
                    destinationPage: const Page1(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16), // 添加下方间隔
                  child: CustomContainer(
                    text:
                        '给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。你可以假设数组是非空的123123121313321312132',
                    buttonText: '收藏',
                    readers: 110,
                    onPressed: () {
                      // 点击按钮时的操作
                    },
                    destinationPage: const Page1(),
                  ),
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

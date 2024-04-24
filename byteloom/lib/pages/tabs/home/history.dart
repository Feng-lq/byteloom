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
          title: const Text('历史记录',
              style: TextStyle(
                color: Colors.black,
              )),
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
                    buttonText: '按钮',
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
                    buttonText: '按钮',
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
                    buttonText: '按钮',
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
                    buttonText: '按钮',
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
                    buttonText: '按钮',
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
                    buttonText: '按钮',
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
                    buttonText: '按钮',
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
            Center(
                child: RichText(
                    text: TextSpan(
              text: '清空历史记录',
              style: const TextStyle(
                color: MyColor.blue, // 红色字体
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // 在此处执行清空历史记录的操作
                  // 比如：清空本地存储的历史记录数据
                },
            ))),
            const SizedBox(
              height: 8,
            )
          ],
        ));
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/logic/cenema.dart';
import 'package:logicloom/pages/tabs.dart';
import 'package:logicloom/pages/tabs/home/history.dart';
import 'package:logicloom/pages/tabs/home/searchResult_page.dart';
import 'package:logicloom/pages/tabs/home/voice_search.dart';
import 'package:logicloom/ui/search.dart';
import 'package:logicloom/ui/text.dart';
import 'package:logicloom/utils/myStyle.dart';

import '../../../r.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: MyColor.back,
      appBar: AppBar(
        title: const Text(
          '搜题',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: MyColor.back,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(History());
            },
            icon: const Row(
              children: [
                Icon(
                  Icons.history,
                  color: MyColor.blue,
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Search(
            onSearch: searchNotes,
          ),
          Expanded(
            child: ListView(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // 处理第一个图片的点击事件逻辑
                            GetImg.getCamera().then((image) {
                              if (image != null) {
                                // 处理拍摄后的图片
                                ToastUtil.showToast("拍照成功");
                              }
                            });
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: screenHeight * 0.15,
                                width: screenWidth * 0.20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(R.assetsImgPhotoSearch),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(Voice());
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                height: screenHeight * 0.15,
                                width: screenWidth * 0.20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(R.assetsImgVoiceSearch),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '猜你想搜',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomContainer(
                    text:
                        '给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。你可以假设数组是非空的123123121313321312132',
                    buttonText: '按钮',
                    readers: 110,
                    onPressed: () {
                      // 点击按钮时的操作
                    },
                    destinationPage: Page1(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomContainer(
                    text:
                        '给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。你可以假设数组是非空的123123121313321312132',
                    buttonText: '按钮',
                    readers: 110,
                    onPressed: () {
                      // 点击按钮时的操作
                    },
                    destinationPage: Page1(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomContainer(
                    text:
                        '给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。你可以假设数组是非空的123123121313321312132',
                    buttonText: '按钮',
                    readers: 110,
                    onPressed: () {
                      // 点击按钮时的操作
                    },
                    destinationPage: Page1(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void searchNotes(String searchText) async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTA2NzA2ODgsImlkIjoiMTc2MTM2NzE0ODkzMzg5ODQyJ9.TlpJAv6aL94Jb0y0QVMXRhTcSlk7aYAQYVzwbET98KE';

      var response = await dio.post(
        'http://116.62.102.2:10101/common/query',
        data: {'searchText': searchText},
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data['code'] == 200) {
          // 将搜索结果数据转换为 JSON 字符串
          String searchResultJson = jsonEncode(data);
          // 处理搜索结果
          // 您可以将搜索结果传递给另一个界面
          Get.to(SearchResultPage(searchResultJson: searchResultJson));
        } else {
          print('Error: ${data['message']}');
        }
      } else {
        print('Error: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

// class SearchResultPage extends StatelessWidget {
//   final String searchResultJson;

//   const SearchResultPage({Key? key, required this.searchResultJson})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Results'),
//       ),
//       body: Center(
//         child: Text(searchResultJson),
//       ),
//     );
//   }
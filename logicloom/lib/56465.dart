import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:logicloom/utils/myStyle.dart';

class SearchResultPage extends StatelessWidget {
  final String searchResultJson;

  SearchResultPage({required this.searchResultJson});

  @override
  Widget build(BuildContext context) {
    // 检查 searchResultJson 是否为空
    if (searchResultJson.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
        ),
        body: Center(
          child: Text('No search results available.'),
        ),
      );
    }

    try {
      // 解析 JSON 字符串
      Map<String, dynamic> searchData = jsonDecode(searchResultJson);
      print(searchData); // 打印解析后的数据

      String content = searchData['answer'] ?? '';

      return Scaffold(
          appBar: AppBar(
            title: Text('搜索结果'),
            backgroundColor: MyColor.back,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              // 使用Container包装ListView
              height: MediaQuery.of(context).size.height * 0.8, // 指定固定高度
              child: ListView(
                children: [
                  Markdown(
                    data: content,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
          )));
    } catch (e) {
      // 捕获异常并显示错误信息
      return Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
          backgroundColor: MyColor.back,
        ),
        body: Center(
          child: Text('Error while parsing search results: $e'),
        ),
      );
    }
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController languageController = TextEditingController();
  final TextEditingController topicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜题'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: languageController,
                decoration: InputDecoration(
                  labelText: '编程语言',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: topicController,
                decoration: InputDecoration(
                  labelText: '知识点',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  searchNotes(
                      languageController.text, topicController.text, context);
                },
                child: Text('搜索'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchNotes(
      String language, String content, BuildContext context) async {
    try {
      var dio = Dio();
      dio.options.headers['Authorization'] =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTA2NzA2ODgsImlkIjoiMTc2MTM2NzE0ODkzMzg5ODI0MiJ9.TlpJAv6aL94Jb0y0QVMXRhTcSlk7aYAQYVzwbET98KE';

      var response = await dio.post(
        'http://121.40.72.67:3306/ppt',
        data: {'language': language, 'content': content},
      );

      if (response.statusCode == 200) {
        var data = response.data;
        if (data['answer'] != null) {
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

void main() {
  runApp(GetMaterialApp(
    title: '搜索Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomePage(),
  ));
}

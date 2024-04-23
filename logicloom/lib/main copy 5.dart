import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/AI/result_page.dart';

class AskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController languageController = TextEditingController();
    final TextEditingController topicController = TextEditingController();

    return AlertDialog(
      title: Text(
        '搜题',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: languageController,
              decoration: InputDecoration(
                labelText: '编程语言',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: topicController,
              decoration: InputDecoration(
                labelText: '知识点',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            '取消',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _search(languageController.text, topicController.text);
          },
          child: Text('搜索'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
        ),
      ],
    );
  }

  void _search(String language, String content) async {
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
          String searchResultJson = jsonEncode(data);
          Get.back();
          Get.to(ResultPage(resultJson: searchResultJson));
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AI接口调用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AI接口调用'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.dialog(
                AskDialog(),
                barrierDismissible: false, // Prevent dismissing on tap outside
              );
            },
            child: Text('打开搜索框'),
          ),
        ),
      ),
    );
  }
}

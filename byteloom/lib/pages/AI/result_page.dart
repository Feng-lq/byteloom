import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:logicloom/utils/myStyle.dart';

class ResultPage extends StatelessWidget {
  final String resultJson;

  ResultPage({required this.resultJson});

  @override
  Widget build(BuildContext context) {
    // 检查 searchResultJson 是否为空
    if (resultJson.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('查询结果'),
        ),
        body: Center(
          child: Text('没有获取结果'),
        ),
      );
    }

    try {
      // 解析 JSON 字符串
      Map<String, dynamic> resultData = jsonDecode(resultJson);
      print(resultData); // 打印解析后的数据

      String content = resultData['answer'] ?? '';

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
          title: Text('AI结果'),
          backgroundColor: MyColor.back,
        ),
        body: Center(
          child: Text('出现错误: $e'),
        ),
      );
    }
  }
}
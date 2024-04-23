import 'dart:convert';
import 'package:flutter/material.dart';
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

      String dataString = searchData['data'] ?? '';
      Map<String, dynamic> data = jsonDecode(dataString);

      // 获取 output 字段中的 choices
      List<dynamic> choices = data['output']['choices'] ?? [];

      // 提取内容并放入一个列表中
      List<String> contents = choices
          .map<String>((choice) => choice['message']['content'].toString())
          .toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('搜索结果'),
          backgroundColor: MyColor.back,
        ),
        body: ListView.builder(
          itemCount: contents.length,
          itemBuilder: (context, index) {
            // 获取每个搜索结果项的内容
            String content = contents[index];
            return ListTile(
              title: Text('Search Result ${index + 1}'),
              subtitle: Text(content),
            );
          },
        ),
      );
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

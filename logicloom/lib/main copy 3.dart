import 'dart:convert';

import 'package:flutter/material.dart';

class SearchInputForm extends StatelessWidget {
  final TextEditingController languageController;
  final TextEditingController topicController;
  final VoidCallback onSubmit;

  SearchInputForm({
    required this.languageController,
    required this.topicController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('搜题'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
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
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onSubmit,
          child: Text('搜索'),
        ),
      ],
    );
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
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SearchInputForm(
                  languageController: languageController,
                  topicController: topicController,
                  onSubmit: () {
                    searchNotes(
                      languageController.text,
                      topicController.text,
                      context,
                    );
                  },
                ),
              );
            },
            child: Text('搜索'),
          ),
        ),
      ),
    );
  }

  void searchNotes(
    String language,
    String content,
    BuildContext context,
  ) async {
    // your search function implementation
  }
}


class PPTMakePage extends StatelessWidget {
  final String pptJson;

  PPTMakePage({required this.pptJson});

  @override
  Widget build(BuildContext context) {
    // 解析 JSON 字符串
    Map<String, dynamic> searchData = jsonDecode(pptJson);
    String content = searchData['answer'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('搜索结果'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
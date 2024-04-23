import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anagram Groups',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnagramGroupsScreen(),
    );
  }
}

class AnagramGroupsScreen extends StatefulWidget {
  @override
  _AnagramGroupsScreenState createState() => _AnagramGroupsScreenState();
}

class _AnagramGroupsScreenState extends State<AnagramGroupsScreen> {
  String? questionMarkdown;
  String? resultMarkdown;

  @override
  void initState() {
    super.initState();
    fetchMarkdownData();
  }

  Future<void> fetchMarkdownData() async {
    try {
      Response<String> response = await Dio().get("YOUR_MARKDOWN_API_ENDPOINT");
      setState(() {
        String data = response.data!;
        // Assuming question and result Markdown are separated by a special delimiter like "---"
        List<String> sections = data.split("---");
        questionMarkdown = sections.isNotEmpty ? sections[0] : null;
        resultMarkdown = sections.length > 1 ? sections[1] : null;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anagram Groups'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 题目容器
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: questionMarkdown != null
                  ? Markdown(data: questionMarkdown!)
                  : Center(child: CircularProgressIndicator()),
            ),
            // 搜题结果容器
            Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: resultMarkdown != null
                  ? Markdown(data: resultMarkdown!)
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

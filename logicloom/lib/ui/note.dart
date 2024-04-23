import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final String title;
  final String createTime;
  final List<String> tags;

  CustomCard({
    required this.color,
    required this.title,
    required this.createTime,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.0, // 设置颜色块的固定宽度
            child: Container(
              //width: 50.0, // 左边颜色块的宽度
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '创建时间：$createTime',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Note {
  final String noteId;
  final String title;
  final List<String> tags;
  final String createTime;

  Note({
    required this.noteId,
    required this.title,
    required this.tags,
    required this.createTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      noteId: json['noteId'],
      title: json['title'],
      tags: List<String>.from(json['tags']),
      createTime: json['createTime'],
    );
  }
}
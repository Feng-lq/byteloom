import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/text.dart';
import '../../../../utils/myStyle.dart';
import '../../../tabs.dart';

class Myclass extends StatelessWidget {
  const Myclass({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的课程',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Icon(Icons.cloud_download_sharp)),
                Expanded(
                  flex: 9,
                  child: Text('平台好课'),
                ),
              ],
            ),
            SizedBox(height: 16),
            HorizontalScrollView(
              children: List.generate(
                10,
                (index) => Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[100 * (index % 9)],
                  ),
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(child: Icon(Icons.cloud_download_sharp)),
                Expanded(
                  flex: 9,
                  child: Text('智能学堂'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: VerticalScrollView(
                children: List.generate(
                  10,
                  (index) => Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[100 * (index % 9)],
                    ),
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalScrollView extends StatelessWidget {
  final List<Widget> children;

  HorizontalScrollView({required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children,
      ),
    );
  }
}

class VerticalScrollView extends StatelessWidget {
  final List<Widget> children;

  VerticalScrollView({required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../ui/text.dart';
import '../../../../utils/myStyle.dart';
import '../../../tabs.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('帮助与反馈',
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
          ],
        ));
  }
}

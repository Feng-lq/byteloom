import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/myStyle.dart';

class CirclePage extends StatelessWidget {
  const CirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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

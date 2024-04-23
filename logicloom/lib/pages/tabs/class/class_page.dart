import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../logic/login.dart';
import '../../../r.dart';
import '../../../ui/user.dart';

class Myclass extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImgPersonalCenter),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: '码小跳',
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                            children: <TextSpan>[
                              TextSpan(
                                text: '同学',
                                style: TextStyle(
                                  color: Color(0XFF053F5C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: screenWidth * (1 / 3),
                      child: const Image(
                        image: AssetImage(R.assetsImgCenterperson),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView(
                children: [
                  Column(children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue, width: 1),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(R.assetsImgAvatar),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('Java从入门到精通1班'),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '学习活跃度',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '77',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '分',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '学习准确率',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '81',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '%',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '本周排名',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '7',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '/62',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

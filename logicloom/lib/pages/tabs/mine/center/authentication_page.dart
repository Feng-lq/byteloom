import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logicloom/utils/myStyle.dart';

import '../../../../logic/login.dart';
import '../../../../r.dart';
import '../../../../ui/user.dart';

class Authentication extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _idCodeController = TextEditingController();

    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImgAuthenticationBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios_sharp),
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '实名认证',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                '真实有效，便捷教学',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: MyColor.signblue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: screenWidth * (1 / 3),
                            child: const Image(
                              image: AssetImage(R.assetsImgAuthenticationImg),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: MyColor.nullcolor,
                        borderRadius: BorderRadius.circular(10), // 添加圆角
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: MyColor.inputblue,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      '姓名',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '请输入内容',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: MyColor.inputblue,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      '身份证号',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: TextField(
                                      controller: _idCodeController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '请输入内容',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // 获取姓名和身份证号
                              String name = _nameController.text;
                              String idCode = _idCodeController.text;

                              print(_nameController.text);
                              print(_idCodeController.text);

                              // 调用登录方法，并传递手机号和验证码
                              // authController.loginByCode(name, idCode);
                            },
                            // onPressed: () => print(_phoneController.text),
                            style: ElevatedButton.styleFrom(
                              minimumSize:
                                  Size(screenWidth * 0.8, screenHeight * 0.07),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text(
                              '立即认证',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 54,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(
                          Icons.safety_check,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '为保障您使用完整的服务，请您完成实名认证。我们承诺保护您的信息安全，不会对信息做任何采集与保留，请您放心使用。',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

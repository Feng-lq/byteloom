import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logicloom/pages/tabs/login/login_page02.dart';
import 'package:logicloom/utils/myStyle.dart';

import '../../../logic/verification_code.dart';
import 'register_page.dart';
import '../../../logic/login.dart';
import '../../../r.dart';

class LoginPage01 extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController _phoneController =
      TextEditingController(); // 添加TextEditingController
  final TextEditingController _verificationCodeController =
      TextEditingController(); // 添加TextEditingController

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: null,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(R.assetsImgBackground), fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: screenHeight * 0.4,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: MyColor.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        height: screenHeight * 0.3,
                        width: screenWidth * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(R.assetsImgLogin),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            const Expanded(
                              flex: 3,
                              child: Text(
                                'Hello,\nWelcome Back !',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(LoginPage02());
                                },
                                child: const Text('使用密码登录'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller:
                              _phoneController, // 绑定TextEditingController
                          keyboardType: TextInputType.number,
                          onChanged: (newValue) {
                            authController
                                .setPhone(newValue); // 将用户输入的手机号传递给控制器进行保存
                          },
                          decoration: const InputDecoration(
                            hintText: '请输入你的手机号',
                            labelText: '手机号',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        VerificationCodeWidget(
                          // 使用验证码组件
                          onCodeSent: (code) {
                            // 获取验证码后，将验证码传递给 _verificationCodeController
                            _verificationCodeController.text = code;
                          },
                          phoneController: _phoneController, // 传入手机号码
                        ),
                        const SizedBox(height: 36),
                        ElevatedButton(
                          onPressed: () {
                            // 获取手机号和验证码
                            String phone = _phoneController.text;
                            String verificationCode =
                                _verificationCodeController.text;

                            print(_phoneController.text);
                            print(_verificationCodeController.text);

                            // 调用登录方法，并传递手机号和验证码
                            authController.loginByCode(phone, verificationCode);
                          },
                          // onPressed: () => print(_phoneController.text),
                          style: ElevatedButton.styleFrom(
                            minimumSize:
                                Size(screenWidth * 0.8, screenHeight * 0.07),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('登录'),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          text: TextSpan(
                            text: '还没有账号？点此',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '注册',
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // 在此处添加 TextButton 被点击时的处理逻辑
                                    // 点击注册按钮跳转到注册页面
                                    Get.to(RegisterPage());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

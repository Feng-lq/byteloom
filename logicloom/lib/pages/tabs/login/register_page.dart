import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logicloom/pages/tabs/login/login_page01.dart';

import '../../../logic/login.dart';
import '../../../logic/verification_code.dart';
import '../../../r.dart';
import '../../../utils/myStyle.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController _phoneController =
      TextEditingController(); // 添加TextEditingController
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController(); // 添加TextEditingController

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    bool confirm = false;

    return Scaffold(
        appBar: null,
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(R.assetsImgBackground),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight * 0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(R.assetsImgLogo))),
                    ),
                    TextField(
                      controller: _phoneController, // 绑定TextEditingController
                      onChanged: (phone) {
                        authController.setPhone(phone);
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: '请输入你的手机号',
                          labelText: '手机号',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                    const SizedBox(height: 16),
                    VerificationCodeWidget(
                      // 使用验证码组件
                      onCodeSent: (code) {
                        // 获取验证码后，将手机号和验证码一起传递给 onCodeSent 方法
                        // authController.setCode(_phoneController.text, code);
                        // 获取验证码后，将验证码传递给 _verificationCodeController
                        _verificationCodeController.text = code;
                      },
                      phoneController: _phoneController,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (password) {
                        authController.setPassword(password);
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: '请输入密码',
                          labelText: '密码',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (password) {
                        confirm = authController.setConfirmPassword(password);
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: '请再次输入密码',
                          labelText: '确认密码',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // 获取手机号和验证码
                        String phone = _phoneController.text;
                        String password = _passwordController.text;
                        String verificationCode =
                            _verificationCodeController.text;

                        print(_phoneController.text);
                        print(_verificationCodeController.text);

                        // 调用登录方法，并传递手机号和验证码
                        if (confirm) {
                          authController.register(
                              phone, password, verificationCode);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(screenWidth * 0.8, screenHeight * 0.07),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      child: const Text('注册'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '点击"',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                        children: <TextSpan>[
                          const TextSpan(
                            text: '注册"',
                            style: TextStyle(
                              color: MyColor.blue,
                            ),
                          ),
                          const TextSpan(
                            text: '表示您同意我们的',
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: '使用条款',
                            style: const TextStyle(
                              color: MyColor.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // 在此处添加 TextButton 被点击时的处理逻辑
                              },
                          ),
                          const TextSpan(text: '和'),
                          TextSpan(
                            text: '隐私政策',
                            style: const TextStyle(
                              color: MyColor.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // 在此处添加 TextButton 被点击时的处理逻辑
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '已有账号？立即',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: '登录',
                            style: const TextStyle(
                              color: MyColor.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // 在此处添加 TextButton 被点击时的处理逻辑

                                // 点击注册按钮跳转到注册页面
                                Get.to(LoginPage01());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

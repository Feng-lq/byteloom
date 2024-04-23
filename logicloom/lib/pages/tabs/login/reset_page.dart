import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/logic/login.dart';

import '../../../logic/verification_code.dart';
import '../../../r.dart';

class ResetPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController(); // 添加密码控制器

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.assetsImgBackground),
                fit: BoxFit.cover,
              ),
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
                        image: AssetImage(R.assetsImgLogo),
                      ),
                    ),
                  ),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '请输入你的手机号',
                      labelText: '手机号',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  VerificationCodeWidget(
                    onCodeSent: (code) {
                      _verificationCodeController.text = code;
                    },
                    phoneController: _phoneController,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '请输入新密码',
                      labelText: '密码',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: (value) {
                      // 在确认密码框中检查密码是否匹配
                      authController.setConfirmPassword(value);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '请再次输入密码',
                      labelText: '确认密码',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      String phone = _phoneController.text;
                      String newPassword = _passwordController.text;
                      String verificationCode =
                          _verificationCodeController.text;

                      // print(_phoneController.text);
                      // print(_passwordController.text);
                      // print(_verificationCodeController.text);
                      // 调用密码重置方法，传递手机号、验证码和密码
                      authController.reset(
                        phone,
                        newPassword,
                        verificationCode,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('重置'),
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

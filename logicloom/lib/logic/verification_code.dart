import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';

class VerificationCodeWidget extends StatefulWidget {
  final void Function(String) onCodeSent;
  final TextEditingController phoneController; // 修改为 TextEditingController
  final TextEditingController codeController =
      TextEditingController(); // 添加验证码输入框的 TextEditingController

  VerificationCodeWidget({
    Key? key,
    required this.onCodeSent,
    required this.phoneController,
  }) : super(key: key);
  @override
  _VerificationCodeWidgetState createState() => _VerificationCodeWidgetState();
}

class _VerificationCodeWidgetState extends State<VerificationCodeWidget> {
  int _start = 60;
  bool _isCounting = false;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start == 0) {
          _isCounting = false;
          _timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  Future<void> _getVerificationCode() async {
    // 发送获取验证码的请求
    try {
      // 实例化 Dio
      final dio.Dio dioInstance = dio.Dio();

      // 构造请求参数
      final Map<String, dynamic> params = {
        'phone': widget.phoneController.text,
      };

      print(params);
      // 发送 GET 请求到验证码接口，携带手机号码参数和授权信息
      final response = await dioInstance.get(
        'http://116.62.102.2:10101/verify/phone',
        queryParameters: params,
        options: dio.Options(headers: {
          'Authorization':
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTA2NzA2ODgsImlkIjoiMTc2MTM2NzE0ODkzMzg5ODI0MiJ9.TlpJAv6aL94Jb0y0QVMXRhTcSlk7aYAQYVzwbET98KE', // 替换为实际的授权信息
        }),
      );

      // 请求成功
      if (response.statusCode == 200) {
        // 重置倒计时时间
        setState(() {
          _start = 60;
          _isCounting = true;
        });

        // 启动倒计时
        _startTimer();
      }
    } catch (e) {
      // 请求失败或出现异常
      print('Error fetching verification code: $e');
    }
  }

  Future<void> _sendVerificationCodeToBackend(String code) async {
    try {
      // 实例化 Dio
      final dio.Dio dioInstance = dio.Dio();

      // 发送 POST 请求到后端验证验证码
      final response = await dioInstance.post(
        'http://116.62.102.2:10101/user/loginByCode', // 替换成您的验证码验证接口地址
        data: {
          'phone': widget.phoneController.text,
          'code': code
        }, // 将验证码作为参数发送
      );

      // 请求成功
      if (response.statusCode == 200) {
        // 解析响应数据
        Map<String, dynamic> responseData = response.data;

        // 检查后端返回的验证结果
        if (responseData['code'] == 200) {
          // 验证成功，执行相应的逻辑，例如登录成功或其他操作
          String userId = responseData['data']['userId'];
          String token = responseData['data']['token'];
          print('Verification successful! User ID: $userId, Token: $token');
          // 这里可以将用户ID和令牌保存到本地存储中，并执行登录成功逻辑
        } else {
          // 验证失败，显示错误提示
          String errorMessage = responseData['message'];
          print('Verification failed: $errorMessage');
          // 这里可以根据后端返回的错误信息做出相应的处理，例如显示错误提示给用户
        }
      } else {
        // 请求失败，显示错误提示
        print('Verification failed: Unexpected error');
        // 这里可以处理请求失败的情况，例如显示错误提示给用户
      }
    } catch (e) {
      // 请求失败或出现异常
      print('Error verifying code: $e');
      // 这里可以处理请求失败或出现异常的情况，例如显示错误提示给用户
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '请输入验证码',
        labelText: '验证码',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        suffixIcon: TextButton(
          onPressed: _isCounting ? null : _getVerificationCode,
          child: Text(_isCounting ? '$_start 秒后重新获取' : '获取验证码'),
        ),
      ),
      onChanged: widget.onCodeSent,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

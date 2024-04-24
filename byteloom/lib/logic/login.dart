import 'package:get/get.dart' hide Response; // 隐藏 Get 库中的 Response 类
import 'package:dio/dio.dart';
import 'package:logicloom/pages/tabs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:logicloom/pages/tabs/login/login_page01.dart';
import '../pages/tabs/home/home_page.dart';

class AuthController extends GetxController {
  var phone = ''.obs;
  var password = ''.obs;
  var verifyCode = ''.obs;
  RxBool isTeacher = false.obs;
  String? authToken; // 用于存储 Token

  final Dio dio = Dio(); // 新增的 Dio 实例

  void setPhone(String value) => phone.value = value;
  void setPassword(String value) => password.value = value;

  // 保存 Token 到 shared_preferences
  Future<void> saveToken(String newToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', newToken);
  }

  // 从 shared_preferences 加载 Token
  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('authToken');
  }

  Future<void> loginByPassword(String phone, String password) async {
    try {
      Response response = await dio.post(
        'http://116.62.102.2:10101/user/loginByPassword', // 替换成实际的登录接口地址
        data: {
          'phone': phone,
          'password': password,
        },
      );

      // 解析响应数据
      Map<String, dynamic> responseData = response.data;

      // 判断状态码
      if (responseData['code'] == 200) {
        // 操作成功
        String userId = responseData['data']['userId'];
        authToken = responseData['data']['token'];

        // 进行相应的处理，例如保存 userId 和 token
        print('User ID: $userId');
        print('Token: $authToken');

        // 保存 Token
        saveToken(authToken!);

        String successMessage = responseData['message'];
        Get.snackbar('Success', successMessage);

        // 跳转到主页
        Get.offAll(Tabs());
      } else {
        // 操作失败，显示错误提示
        String errorMessage = responseData['message'];
        Get.snackbar('Error', errorMessage);
      }
    } catch (error) {
      // 处理登录失败的错误
      print('Login Error: $error');
      // 登录失败，显示错误提示
      Get.snackbar('Login Failed', 'Invalid username or password');
    }
  }

  Future<void> loginByCode(String phone, String verificationCode) async {
    try {
      // print(phone);
      // print(verificationCode);

      Response response = await dio.post(
        'http://116.62.102.2:10101/user/loginByCode', // 替换成实际的登录接口地址
        data: {
          'phone': phone,
          'verifyCode': verificationCode,
        },
      );

      // 解析响应数据
      Map<String, dynamic> responseData = response.data;

      // 判断状态码
      if (responseData['code'] == 200) {
        // 操作成功
        String userId = responseData['data']['userId'];
        authToken = responseData['data']['token'];

        // 进行相应的处理，例如保存 userId 和 token
        print('User ID: $userId');
        print('Token: $authToken');

        // 保存 Token
        saveToken(authToken!);

        // 跳转到主页
        Get.offAll(Tabs());
      } else {
        // 操作失败，显示错误提示
        String errorMessage = responseData['message'];
        Get.snackbar('Error', errorMessage);
      }
    } catch (error) {
      // 处理登录失败的错误
      print('Login Error: $error');
      // 登录失败，显示错误提示
      Get.snackbar('Login Failed', 'Invalid username or password');
    }
  }

  Future<void> register(String phone, String password, String verificationCode) async {
    try {
      Response response = await dio.post(
        'http://116.62.102.2:10101/user/register',
        data: {
          'phone': phone,
          "password": password,
          "identity": '0',
          'verifyCode': verifyCode,
        },
      );

      // 保存 Token
      saveToken(response.data['token']);

      //login();

      // 注册成功，你可以根据实际情况进行处理
      // 如果需要额外的注册后逻辑，可以在这里添加
    } catch (error) {
      // 统一处理网络错误
      handleNetworkError(error);
    }
  }

  bool setConfirmPassword(String depassword){
      // ignore: unrelated_type_equality_checks
      return depassword == password;

  }

  void reset(String phone, String newpassword, String verifyCode0) async {
  try {
    // 检查手机号和验证码是否有效，这里假设你已经有了验证逻辑
    if (phone.isEmpty || verifyCode.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    // 发起密码重置请求
    Response response = await dio.post(
      'http://116.62.102.2:10101/user/forget', // 替换成实际的密码重置接口地址
      data: {
        'phone': phone,
        'verifyCode': verifyCode0,
        'newPassword': newpassword,
      },
    );
    print(phone,);
    print(verifyCode0);
    print(newpassword);

    // 解析响应数据
    Map<String, dynamic> responseData = response.data;

    // 判断状态码
    if (responseData['code'] == 200) {
      // 密码重置成功，跳转到登录页面或其他操作
      Get.offAll(LoginPage01());
      Get.snackbar('成功', '密码已重置成功');
    } else {
      // 操作失败，显示错误提示
      String errorMessage = responseData['message'];
      Get.snackbar('Error', errorMessage);
    }
  } catch (error) {
    // 处理重置密码失败的错误
    print('Password Reset Error: $error');
    // 显示错误提示
    Get.snackbar('失败', '密码重置失败');
  }
}

  void setTeacherStatus(bool value) {
    isTeacher.value = value;
  }

  bool getTeacherStatus() {
    return isTeacher.value;
  }

  // // 设置验证码的方法
  // void setCode(String phone, String code) {
  //   // 这里可以执行您的逻辑，例如将验证码保存到状态管理器中
  //   // 或者将验证码发送给后端进行验证
  //   print('Received verification code: $code');
  //   // loginByCode();
  //   // 在这里添加您的处理逻辑
  // }

  // 发送带有 Token 的请求的示例
  Future<void> fetchData() async {
    try {
      // 判断是否有 Token
      if (authToken == null) {
        Get.snackbar('Error', 'Token not available. Please login.');
        return;
      }

      // 使用 Token 发送请求
      Response response = await dio.get(
        'URL',
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      // 处理响应数据
      print('Data: ${response.data}');
    } catch (error) {
      // 处理网络错误
      handleNetworkError(error);
    }
  }

  void logout() {
    // 清除本地存储的令牌
    clearToken();

    // 导航用户到登录页面
    Get.offAll(LoginPage01());
  }

// 清除本地存储的令牌
  Future<void> clearToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('authToken');
    } catch (error) {
      print('清除令牌错误: $error');
      // 在实际应用中，你可能还需要处理清除令牌失败的情况
    }
  }

  // 全局处理网络错误
  void handleNetworkError(error) {
    print('Network Error: $error');
    Get.snackbar('Network Error', 'Please check your internet connection');
    // 在实际应用中，你可能还需要根据不同类型的错误提供不同的用户反馈
  }
}

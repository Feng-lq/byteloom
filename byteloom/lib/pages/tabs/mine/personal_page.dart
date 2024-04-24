import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs/mine/center/authentication_page.dart';
import 'package:logicloom/utils/myStyle.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Map<String, dynamic> userData;
  late Map<String, TextEditingController> controllers;
  bool isEditMode = false;
  bool isLoading = true;

  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人资料'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                      image: DecorationImage(
                        image: NetworkImage(userData?['avatar'] ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '头像七天内只能修改1次，无论是否修改成功，提交即消耗次数。请您谨慎提交。',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 16),
                  buildUserInfoCard("基本资料", [
                    buildUserInfoRow("用户名", "nickname"),
                    buildUserInfoRow("性别", "gender"),
                    buildUserInfoRow("生日", "birthday"),
                    buildUserInfoRow("个性签名", "signature"),
                  ]),
                  SizedBox(height: 16),
                  buildUserInfoCard("其他资料", [
                    buildUserInfoRow("学校", "school"),
                    buildUserInfoRow("班级", "clubum"),
                    buildUserInfoRow("学号/工号", "sid"),
                  ]),
                ],
              ),
            ),
      floatingActionButton: IconButton(
        onPressed: () {
          if (isEditMode) {
            _saveProfileChanges();
          } else {
            setState(() {
              isEditMode = true;
            });
          }
        },
        icon: Icon(isEditMode ? Icons.done : Icons.edit),
      ),
    );
  }

  Widget buildUserInfoCard(String title, List<Widget> rows) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget buildUserInfoRow(String label, String field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isEditMode && label == '用户名') // 只有在非编辑模式下才显示实名认证按钮
                TextButton(
                  onPressed: () {
                    // 在这里使用 Get.to 来跳转到 Authentication 页面
                    Get.to(Authentication());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // 调整圆角大小
                      ),
                    ),
                  ),
                  child: Text(
                    '实名认证',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
          isEditMode
              ? Expanded(
                  child: TextField(
                    controller: controllers[field],
                    decoration: InputDecoration(
                      hintText: 'Enter $label',
                    ),
                  ),
                )
              : Text(userData?[field] ?? ''), // 显式地将值转换为字符串
        ],
      ),
    );
  }

  Future<void> fetchUserData() async {
    try {
      final response = await dio.get(
        'http://116.62.102.2:10101/user/getById',
        options: Options(
          headers: {
            'Authorization':
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTA2NzA2ODgsImlkIjoiMTc2MTM2NzE0ODkzMzg5ODI0MiJ9.TlpJAv6aL94Jb0y0QVMXRhTcSlk7aYAQYVzwbET98KE', // 替换为实际的授权信息
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = response.data['data'];

        if (responseData != null && responseData is Map<String, dynamic>) {
          setState(() {
            userData = {
              'id': responseData['id'].toString(),
              'nickname': responseData['nickname'],
              'phone': responseData['phone'],
              'password': responseData['password'],
              'identity': responseData['identity'],
              'school': responseData['school'],
              'clubum': responseData['clubum'],
              'sid': responseData['sid'],
              'createTime': responseData['createTime'],
              'updateTime': responseData['updateTime'],
              'gender': responseData['gender'],
              'birthday': responseData['birthday'],
              'signature': responseData['signature'],
              'avatar': responseData['avatar'],
              'exist': responseData['exist'],
              'version': responseData['version'].toString(),
            };
            controllers = {
              'nickname': TextEditingController(text: responseData['nickname']),
              'gender': TextEditingController(text: responseData['gender']),
              'birthday': TextEditingController(text: responseData['birthday']),
              'signature':
                  TextEditingController(text: responseData['signature']),
              'school': TextEditingController(text: responseData['school']),
              'clubum': TextEditingController(text: responseData['clubum']),
              'sid': TextEditingController(text: responseData['sid']),
            };
            isLoading = false;
          });
        } else {
          print('收到了意外的数据格式');
        }
      } else {
        print('获取用户数据失败: ${response.statusCode}');
      }
    } catch (e) {
      print('获取用户数据失败: $e');
    }
  }

  void _saveProfileChanges() async {
    Map<String, dynamic> updatedData = {};
    controllers.forEach((key, controller) {
      updatedData[key] = controller.text;
    });

    try {
      final response = await dio.post(
        'http://116.62.102.2:10101/user/update',
        data: updatedData,
        options: Options(
          headers: {
            'Authorization':
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MTA2NzA2ODgsImlkIjoiMTc2MTM2NzE0ODkzMzg5ODI0MiJ9.TlpJAv6aL94Jb0y0QVMXRhTcSlk7aYAQYVzwbET98KE', // 替换为实际的授权信息
          },
        ),
      );

      if (response.statusCode == 200) {
        // 更新成功，显示成功提示
        Get.snackbar('Success', 'Profile updated successfully',
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);

        // 刷新用户数据
        fetchUserData();

        // 切换回非编辑模式
        setState(() {
          isEditMode = false;
        });
      } else {
        // 更新失败，显示失败提示
        Get.snackbar('Error', 'Failed to update profile',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      // 更新失败，显示失败提示
      Get.snackbar('Error', 'Failed to update profile: $e',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

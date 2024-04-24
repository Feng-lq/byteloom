import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionExample extends StatefulWidget {
  @override
  _PermissionExampleState createState() => _PermissionExampleState();
}

class _PermissionExampleState extends State<PermissionExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _requestCameraPermission();
          },
          child: Text('Request Camera Permission'),
        ),
      ),
    );
  }

  Future<void> _requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      // 用户已授予相机权限
      print('Camera permission granted');
    } else if (status.isDenied) {
      // 用户拒绝了相机权限，但可以再次请求
      print('Camera permission denied');
    } else if (status.isPermanentlyDenied) {
      // 用户拒绝了相机权限并选择了“不再询问”
      // 可以引导用户进入应用程序设置页面以手动授予权限
      print('Camera permission permanently denied');
    }
  }
}

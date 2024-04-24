import 'package:dio/dio.dart';
import 'dart:io';

Future<void> uploadImage(File imageFile) async {
  // 创建 Dio 实例
  Dio dio = Dio();

  try {
    // 构造请求表单数据
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imageFile.path, filename: "image.jpg"),
    });

    // 发起 POST 请求上传图片
    Response response = await dio.post(
      "http://116.62.102.2:10101/common/ocr",
      data: formData,
      options: Options(
        contentType: "multipart/form-data",
      ),
    );

    // 检查请求是否成功
    if (response.statusCode == 200) {
      print("上传成功");
      print(response.data); // 如果服务器返回 JSON 数据，可以通过 response.data 获取
    } else {
      print("上传失败：${response.statusCode}");
    }
  } catch (e) {
    print("上传出错：$e");
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:logicloom/pages/tabs/login/identity_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Cropper Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CropImageDemo(),
    );
  }
}

class CropImageDemo extends StatelessWidget {
  final ImageCropper _imageCropper = ImageCropper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Cropper Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _pickAndCropImage(context);
          },
          child: Text('Pick and Crop Image'),
        ),
      ),
    );
  }

  Future<void> _pickAndCropImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final croppedFile = await _cropImage(pickedFile.path, context);
      if (croppedFile != null) {
        // 在这里处理裁剪后的图片
        // croppedFile 是裁剪后的图片文件
        print('Cropped Image Path: ${croppedFile.path}');
      } else {
        print('No image cropped.');
      }
    } else {
      print('No image selected.');
    }
  }

  Future<File?> _cropImage(String imagePath, BuildContext context) async {
    File? croppedFile;
    try {
      croppedFile = await _imageCropper.cropImage(
        sourcePath: imagePath,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ),
      );
    } catch (e) {
      print('Error cropping image: $e');
    }
    return croppedFile;
  }
}

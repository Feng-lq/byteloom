import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logicloom/logic/imgpost.dart';
import 'package:logicloom/utils/myStyle.dart';


class GetImg {
  static Future<Uint8List?> getCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      print("---------------------------------------");
      print(image.path);
      File imageFile = File("image.path");
      uploadImage(imageFile);
      return await crop(image);
      // return image;
    } else {
      ToastUtil.showToast("无照片");
      return null;
    }
  }

  static Future<Uint8List?> getGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return await crop(image);
    } else {
      ToastUtil.showToast("无照片");
      return null;
    }
  }

  static Future<Uint8List?> crop(XFile xFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: xFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: '剪裁图片',
        toolbarColor: MyColor.back,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ),
    );
    if (croppedFile != null) {
      final bytes = await croppedFile.readAsBytes();
      return bytes;
    }
    return null;
  }
}

class ToastUtil {
  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
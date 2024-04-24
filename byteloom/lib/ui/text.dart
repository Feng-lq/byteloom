import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String buttonText;
  final int readers;
  final VoidCallback? onPressed;
  final Widget destinationPage; // 接受目标页面作为参数

  CustomContainer({
    required this.text,
    required this.buttonText,
    required this.readers,
    required this.destinationPage, // 添加目标页面参数
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 点击整个容器时的操作，例如跳转页面
        Get.to(destinationPage); // 使用目标页面参数进行页面导航
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          color: Colors.white,
          child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                // height: double.infinity,
                // width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$readers 人浏览过',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -5,
              right: 0,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12), // 右上角圆角
                        bottomLeft: Radius.circular(12), // 左下角圆角
                      ),
                    ),
                  ),
                ),
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}

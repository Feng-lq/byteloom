import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../r.dart';
import '../../../../utils/myStyle.dart';

class AchievementPage extends StatefulWidget {
  const AchievementPage({super.key});

  @override
  State<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends State<AchievementPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double scrennHeight = MediaQuery.of(context).size.height;
    final double scrennWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: null,
        //backgroundColor: Colors.grey, //改变总的背景颜色
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.assetsImgMyAchievement),
                  fit: BoxFit.cover)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: AppBar(
                  title: const Text('我的成就',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  backgroundColor: Colors.transparent,
                  //将scaffold背景改为透明
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  elevation: 0.0, //清除顶部appBar的横线
                ),
              ),
              Positioned(
                  top: scrennHeight * 0.13,
                  left: scrennWidth / 30,
                  height: scrennHeight * 0.15,
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.circle,
                          //border: Border.all(color: Colors.white, width: 5),
                          image: DecorationImage(
                              image: AssetImage(R.assetsImgAvatar),
                              fit: BoxFit.cover)),
                      child: Container(
                        margin: const EdgeInsets.all(75),
                        padding: const EdgeInsets.all(7),
                      ),
                    ),
                  )),
              Positioned(
                  top: scrennHeight * 0.2,
                  right: scrennWidth / 10,
                  height: scrennHeight * 0.15,
                  child: Container(child: Text('已获得5枚勋章'))),
              Positioned(
                top: scrennHeight * 0.3, // 调整垂直位置
                left: scrennWidth * 0.01, // 调整水平位置，左对齐
                height: scrennHeight * 0.2, // 放大图片容器高度
                width: scrennWidth * 0.4, // 放大图片容器宽度
                child: Container(
                  child: Image.asset(R.assetsImgMedal1), // 显示第一张勋章图片
                ),
              ),
              Positioned(
                top: scrennHeight * 0.3, // 调整垂直位置
                left: scrennWidth * 0.31, // 调整水平位置，居中对齐
                height: scrennHeight * 0.2, // 放大图片容器高度
                width: scrennWidth * 0.4, // 放大图片容器宽度
                child: Container(
                  child: Image.asset(R.assetsImgMedal2), // 显示第二张勋章图片
                ),
              ),
              Positioned(
                top: scrennHeight * 0.3, // 调整垂直位置
                left: scrennWidth * 0.61, // 调整水平位置，右对齐
                height: scrennHeight * 0.2, // 放大图片容器高度
                width: scrennWidth * 0.4, // 放大图片容器宽度
                child: Container(
                  child: Image.asset(R.assetsImgMedal3), // 显示第三张勋章图片
                ),
              ),
              Positioned(
                bottom: scrennHeight * 0.3, // 调整垂直位置
                left: scrennWidth * 0.11, // 调整水平位置，左对齐
                height: scrennHeight * 0.2, // 放大图片容器高度
                width: scrennWidth * 0.4, // 放大图片容器宽度
                child: Container(
                  child: Image.asset(R.assetsImgMedal4), // 显示第四张勋章图片
                ),
              ),
              Positioned(
                bottom: scrennHeight * 0.3, // 调整垂直位置
                left: scrennWidth * 0.5, // 调整水平位置，居中对齐
                height: scrennHeight * 0.2, // 放大图片容器高度
                width: scrennWidth * 0.4, // 放大图片容器宽度
                child: Container(
                  child: Image.asset(R.assetsImgMedal5), // 显示第五张勋章图片
                ),
              ),
            ],
          ),
        ));
  }
}

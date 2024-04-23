import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs/course/preview_page.dart';
import '../../../logic/login.dart';
import '../../../r.dart';
import 'package:logicloom/utils/myStyle.dart';

class CoursePage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: null,
      body: ListView(children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(R.assetsImgCourseBack),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              const Text(
                                'Welcome,',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: '码小跳',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.blue),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '同学',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(R.assetsImgAvatar),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  child: TextField(
                    onChanged: (text) {
                      // 在这里监听文本输入变化，满足条件时执行跳转操作
                      if (text.isNotEmpty) {
                        Get.to(PreviewPage());
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.5)),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "请输入文字进行AI定制化学习路线",
                      hintStyle: TextStyle(
                        color: MyColor.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('今日推荐'),
                    Text(
                      '>>> 更多',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  height: screenHight * 0.3,
                  child: Expanded(
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: CourseColumn(
                            imageUrl: R.assetsImgCourse1,
                            title: 'HTML & CSS',
                            instructor: '惠老师教学',
                            duration: '2h 10m     10节课',
                            avatarUrl: R.assetsImgAvater1,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: const DecorationImage(
                                      image: AssetImage(R.assetsImgCourse2),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: const DecorationImage(
                                      image: AssetImage(R.assetsImgCourse3),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('平台好课'),
                    Text(
                      '>>> 更多',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Container(
                  height: screenHight * 0.35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CourseColumn(
                        imageUrl: R.assetsImgCourse4,
                        title: '编程思维训练',
                        instructor: '睿睿学编程',
                        avatarUrl: R.assetsImgAvater2,
                        duration: '2h 10m     5节课',
                      ),
                      SizedBox(width: 2),
                      CourseColumn(
                        imageUrl: R.assetsImgCourse3,
                        title: 'Web开发基础',
                        instructor: 'Kevin程序开发',
                        avatarUrl: R.assetsImgAvater3,
                        duration: '9h 26m     16节课',
                      ),
                      SizedBox(width: 2),
                      CourseColumn(
                        imageUrl: R.assetsImgCourse5,
                        title: '前端开发初级课程',
                        instructor: '字节忍者王五',
                        avatarUrl: R.assetsImgAvater4,
                        duration: '1h 10m     10节课',
                      ),
                    ],
                  ),
                )
              ],
            )),
      ]),
    );
  }
}

class CourseColumn extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String instructor;
  final String duration;
  final String avatarUrl;

  const CourseColumn({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.instructor,
    required this.duration,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(avatarUrl),
                  ),
                ),
                const SizedBox(width: 5),
                Text(instructor),
              ],
            ),
            const SizedBox(height: 5),
            if (duration.isNotEmpty)
              Text(
                duration,
                style: TextStyle(color: Colors.blue),
              ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:logicloom/pages/tabs.dart';
import 'package:logicloom/r.dart';
import 'package:logicloom/ui/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommunityPage(),
    );
  }
}

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(R.assetsImgCommunityBackground),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 32.0),
            Row(
              children: [
                Text(
                  '社区',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      border: Border.all(color: Colors.grey, width: 1.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: '搜索感兴趣的圈子或话题',
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 19.0),
                            ),
                            onSubmitted: (query) {
                              // 在这里执行搜索操作
                              print('执行搜索：$query');
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // 在这里执行搜索操作
                            print('执行搜索');
                          },
                          icon: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity,
              height: 120.0,
              child: Image(image: AssetImage(R.assetsImgActivity)),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '猜你喜欢',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text('更多'),
                            icon: Icon(Icons.keyboard_arrow_right_outlined),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      shrinkWrap: true,
                      children: [
                        _buildCommunityBlock(
                          imageUrl: R.assetsImgBackground,
                          title: '板块标题',
                          participants: 100,
                          posts: 50,
                        ),
                        _buildCommunityBlock(
                          imageUrl: R.assetsImgCenterperson,
                          title: '板块标题',
                          participants: 80,
                          posts: 30,
                        ),
                        _buildCommunityBlock(
                          imageUrl: R.assetsImgBackground,
                          title: '板块标题',
                          participants: 100,
                          posts: 50,
                        ),
                        _buildCommunityBlock(
                          imageUrl: R.assetsImgCenterperson,
                          title: '板块标题',
                          participants: 80,
                          posts: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            _buildPost(
              avatar: R.assetsImgCommunity1,
              username: '代码王',
              content:
                  'Java基础语法： 了解Java的基本语法，包括变量、数据类型、运算符、控制流程（条件语句和循环语句）、方法等。',
              createTime: 10,
              comment: 13,
              likes: 30,
            ),
            _buildPost(
              avatar: R.assetsImgCommunity1,
              username: '学Python的菜菜',
              content: '标题党，新手小白入门，求大佬分享经验。',
              createTime: 10,
              comment: 13,
              likes: 30,
            ),
            _buildPost(
              avatar: R.assetsImgCommunity1,
              username: '深夜代码战士',
              content:
                  'Day12：多线程编程： 了解Java中多线程编程的基本概念，学习如何创建和管理线程，以及线程同步和互斥等问题。',
              createTime: 10,
              comment: 13,
              likes: 30,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 导航到发布内容页面
          Get.to(Page1());
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

Widget _buildCommunityBlock({
  required String imageUrl,
  required String title,
  required int participants,
  required int posts,
}) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30.0, // 图片区域宽度
          height: 30.0, // 图片区域高度
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 2, // 文字区域占比
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                '参与人数: $participants 发帖数量: $posts',
                style: TextStyle(fontSize: 5.0),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildPost({
  required String avatar,
  required String username,
  required String content,
  required int createTime,
  required int comment,
  required int likes,
}) {
  return Container(
    padding: EdgeInsets.all(16.0),
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 1),
            image: DecorationImage(
              image: AssetImage(avatar),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$username',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 8.0),
              Markdown(
                data: content,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
              Row(
                children: [
                  Text(
                    '$createTime分钟前',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 72,
                  ),
                  Icon(
                    Icons.abc,
                    size: 18,
                  ),
                  Text(
                    '$likes',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.insert_comment,
                    size: 18,
                  ),
                  Text(
                    '$comment',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '观看全部',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

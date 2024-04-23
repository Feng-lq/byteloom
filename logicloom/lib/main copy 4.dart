import 'package:flutter/material.dart';
import 'package:logicloom/r.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double scrennHeight = MediaQuery.of(context).size.height;
    final double scrennWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('个人页面'),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(R.assetsImgPersonalBackground),
                          fit: BoxFit.cover)),
                ),
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage(R.assetsImgPersonalBackground),
                  //         fit: BoxFit.cover)),
                ),
                SizedBox(height: 20),
                Text(
                  '用户名',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildStatItem('粉丝', '1000'),
                    SizedBox(width: 20),
                    _buildStatItem('关注', '500'),
                    SizedBox(width: 20),
                    _buildStatItem('获赞', '2000'),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    child: Center(
                      child: Text(''),
                    ),
                  ),
                ),
              ],
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
          ],
        ));
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: <Widget>[
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

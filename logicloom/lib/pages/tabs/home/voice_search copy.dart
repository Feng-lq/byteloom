import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../logic/speech_to_text.dart';
import '../../../r.dart';
import '../../../utils/myStyle.dart';

class Voice extends StatefulWidget {
  const Voice({Key? key}) : super(key: key);

  @override
  _VoiceState createState() => _VoiceState();
}

class _VoiceState extends State<Voice> {
  int _start = 0;
  late final ValueNotifier<int> _timerNotifier;
  bool _isCounting = false;

  final TextEditingController _textEditingController =
      TextEditingController(); //用于题目输入的文本编辑控制器
  late final SpeechToText _speech; // 语音识别对象
  bool _isListening = false; // 是否正在语音识别

  @override
  void initState() {
    super.initState();
    _timerNotifier = ValueNotifier<int>(_start);
    _speech = SpeechToText();
  }

  void _startTimer() {
    _isCounting = true;
    _timerNotifier.value = _start;
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start < 60) {
        _start++;
        _timerNotifier.value = _start;
      } else {
        _isCounting = false;
        timer.cancel();
      }
    });
  }
  

  // // 开始语音识别
  // void _startListening() {
  //   _speech.listen(
  //     onResult: (result) {
  //       setState(() {
  //         _textEditingController.text = result as String;
  //       });
  //     },
  //     onError: (error) {
  //       print('Speech recognition error: ${error.errorMsg}');
  //     },
  //     onListening: (isListening) {
  //       setState(() {
  //         _isListening = isListening;
  //       });
  //     },
  //   );
  // }

  // 停止语音识别
  void _stopListening() {
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyColor.back,
      appBar: AppBar(
        title: const Text(
          '语音搜题',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: MyColor.back,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '题目词卡',
                style: TextStyle(
                  color: MyColor.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(R.assetsImgWordcard),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 15,
                right: 15,
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.3,
                    child: TextField(
                      controller: _textEditingController, // 使用文本编辑控制器
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入题目',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _timerNotifier,
                builder: (context, value, child) {
                  String minutes = (value ~/ 60).toString().padLeft(2, '0');
                  String seconds = (value % 60).toString().padLeft(2, '0');
                  return Text(
                    '$minutes:$seconds',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 0,
                right: 32,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_isCounting) {
                      _startTimer();
                    }
                  },
                  child: Text(
                    '搜题',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onLongPressStart: (_) {
              // if (!_isCounting && !_isListening) {
              //   _startListening(); // 长按开始语音识别
              // }
            },
            onLongPressEnd: (_) {
              if (!_isCounting) {
                _stopListening(); // 长按结束语音识别
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: screenHeight * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(R.assetsImgRecord),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

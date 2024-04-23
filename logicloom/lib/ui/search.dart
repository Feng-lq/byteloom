import 'package:flutter/material.dart';
import 'package:logicloom/utils/myStyle.dart';

class Search extends StatefulWidget {
  final Function(String) onSearch;

  const Search({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          widget.onSearch(value); // 调用传递进来的搜索回调函数
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          prefixIcon: Icon(Icons.search),
          hintText: "请输入文字进行搜索",
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColor.grey,
          ),
        ),
      ),
    );
  }
}

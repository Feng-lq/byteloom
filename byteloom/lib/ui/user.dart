import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Widget leftIcon;
  final String text;
  final VoidCallback onTap;

  const CustomListItem({
    Key? key,
    required this.leftIcon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            leftIcon,
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
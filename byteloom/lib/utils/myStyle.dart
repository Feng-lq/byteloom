import 'package:flutter/material.dart';

import '../../../r.dart';

class MyColor {
  static const Color blue = Color(0xFF178DC9);
  static const Color lightBlue = Color(0xFFEBF8FF);
  static const Color darkBlue = Color(0xFF066EA3);
  static const Color darkBluesign = Color(0xFF066EA3);
  static const Color signblue = Color(0xFF65A8CD);
  static const Color inputblue = Color(0xFFE5F2F9);
  static const Color grey = Color(0xFFBFBFBF);
  static const Color back = Color(0xFFF4F8FB);
  static const Color nullcolor = Color(0xFFFFFFFF);
  static const Color mygreen = Color(0xFF00D008);
  static const Color wordBack = Color(0xFF7AAEC9);
}

class MyIcon {
  static const CustomIcon document = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgDocument,
  );
  static const CustomIcon accomplishment = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgAccomplishment,
  );
  static const CustomIcon help =
      CustomIcon(iconSize: 24.0, imagePath: R.assetsImgHelp);
  static const CustomIcon settings = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgSettings,
  );
  static const CustomIcon classs = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgClass,
  );
  static const CustomIcon note = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgNote,
  );
  static const CustomIcon arrow = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgArrows2,
  );
  static const CustomIcon courseIcon = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgCourseIcon,
  );
  static const CustomIcon searchIcon = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgSearchIcon,
  );
  static const CustomIcon communicateIcon = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgCommunicateIcon,
  );
  static const CustomIcon mineIcon = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgMineIcon,
  );
  static const CustomIcon classIcon = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgClassIcon,
  );
  static const CustomIcon more = CustomIcon(
    iconSize: 24.0,
    imagePath: R.assetsImgMore,
  );
}

class CustomIcon extends StatelessWidget {
  final String imagePath;
  final double iconSize;

  const CustomIcon({
    required this.imagePath,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: iconSize,
      height: iconSize,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons {
  static String iconArrow = 'assets/icons/Arrow, Right.svg';
  static String iconBackspace = 'assets/icons/backspace,delete.svg';
  static String iconClose = 'assets/icons/Close.svg';
  static String iconPin = 'assets/icons/Lock, Pin.svg';
  static String iconMore = 'assets/icons/More, Kebab.svg';
  static String iconRefresh = 'assets/icons/Refresh, Rotate, Circle.svg';
  static String iconUser = 'assets/icons/User, Profile.svg';
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    Key? key,
    required this.name,
    required this.size,
    required this.color,
  }) : super(key: key);

  final String name;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: size,
      height: size,
      name,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}

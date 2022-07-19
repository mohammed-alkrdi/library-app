import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';

class BookIcons extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
  final double? size;
  final double fontSize;
  final void Function()? onPressed;

  const BookIcons({Key? key,
    required this.icon,
    required this.text,
    required this.color,
    this.size,
    required this.fontSize,
    required this.iconColor,
    required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: iconColor,
              size: size,
            )),
        NewText(
          text: text,
          color: color,
          fontsize: fontSize,
        ),
      ],
    );
  }
}

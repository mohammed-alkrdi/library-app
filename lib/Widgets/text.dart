import 'package:flutter/material.dart';

class NewText extends StatelessWidget {
  final String text;
  final double? fontsize;
  final Color? color;
  final Alignment? alignment;
  final double? height;
   const NewText({
    Key? key,
    required this.text,
    this.fontsize = 16,
    required this.color,
    this.height,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            color: color, height: height, fontSize: fontsize, fontWeight: FontWeight.w900),
      ),
    );
  }
}

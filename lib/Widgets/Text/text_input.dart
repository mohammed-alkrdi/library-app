import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment alignment;

  const TextInput({
    Key? key,
    this.text = '',
    this.fontsize = 16,
    this.color = Colors.white,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: fontsize, fontWeight: FontWeight.w900),
      ),
    );
  }
}

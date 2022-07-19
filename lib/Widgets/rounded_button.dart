import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double sizeHeight;
  final double sizeWidth;
  final Color? color;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.sizeHeight,
    required this.sizeWidth,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight,
      width: sizeWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: NewText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        ),
      ),
    );
  }
}

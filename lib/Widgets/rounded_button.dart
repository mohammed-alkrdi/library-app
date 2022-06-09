import 'package:flutter/material.dart';
import 'package:my_library/Widgets/Text/text_input.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 310,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: onPressed,
          child: TextInput(
            text: text,
            alignment: Alignment.center,
            color: Colors.white,
          ),
        ),
    );
  }
}

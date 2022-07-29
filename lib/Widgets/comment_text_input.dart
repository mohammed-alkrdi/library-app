
import 'package:flutter/material.dart';
import 'package:my_library/colors.dart';


class CommentTextInput extends StatelessWidget {


  final TextEditingController textController;

  final TextInputType inputType;

  final TextInputAction inputAction;

  Function(String? value) onSaved;

  String? Function(String? value) validator;

  CommentTextInput(
      {Key? key,
        required this.textController,
        required this.onSaved,
        required this.validator,
        required this.inputType,
        required this.inputAction,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            decoration: InputDecoration(
          ),
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: textController,
        onSaved: onSaved,
        validator: validator,
    );
  }
}

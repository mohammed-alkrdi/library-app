import 'package:flutter/material.dart';
import 'package:my_library/colors.dart';

import 'app_icons.dart';

class ProfileEditWidget extends StatelessWidget {
  AppIcons appIcons;
  String text;
  final TextEditingController textController;
  final TextInputType inputType;

  final TextInputAction inputAction;
  final Color? color;

  Function(String? value) onSaved;

  String? Function(String? value) validator;


  ProfileEditWidget({
    Key? key,
    required this.color,
    required this.appIcons,
    required this.text,
    required this.onSaved,
    required this.validator,
    required this.inputType,
    required this.inputAction,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: appIcons,
            ),
            hintText: text,
            hintStyle:  TextStyle(
              color: AppColors.g,
            ),
            fillColor: AppColors.g,
          ),
          style:  TextStyle(
            color: AppColors.g,
          ),
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: textController,
          onSaved: onSaved,
          validator: validator,
          //controller: ,
        ),
      ),
    );
  }
}

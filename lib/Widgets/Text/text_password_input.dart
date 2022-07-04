import 'package:flutter/material.dart';

class TextPasswordInput extends StatelessWidget {
  final String hint;

  final String image;

  final TextInputAction inputAction;

  Function(String? value) onSaved;

  String? Function(String? value) validator;

  TextPasswordInput(
      {Key? key,
        required this.hint,
        required this.image,
        required this.onSaved,
        required this.validator,
        required this.inputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image(
                  image:AssetImage(image),
                ),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              fillColor: Colors.white,
            ),
            obscureText: true,
            style: const TextStyle(
              color: Colors.white,
            ),
            textInputAction: inputAction,
            onSaved: onSaved,
            validator: validator,
          ),
      ),
    );
  }
}

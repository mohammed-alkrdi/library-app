import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: NewText(
          text: 'Comments',
          color: Colors.black,
          alignment: Alignment.centerLeft,
          fontsize: 24,
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'MainBooksPage'),
          child: Icon(Icons.arrow_back, size: 30, color: Colors.black),
        ),
      ),
    );
  }
}

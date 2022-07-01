import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
            {Navigator.pushNamed(context, 'CommentScreen')},
            icon: Icon(
              FontAwesomeIcons.comment,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: LikeButton(
              size: 29,
              isLiked: false,
            ),
          ),
        ],
      ),
    );
  }
}

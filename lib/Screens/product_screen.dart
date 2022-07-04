import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7B8F5),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
          child:  Image(
             image: AssetImage("assets/icons_img/icons8-back-50.png"),
            ),
          ),
        actions: [
          IconButton(
            onPressed: () => {Navigator.pushNamed(context, 'CommentScreen')},
            icon: Image(
                image: AssetImage("assets/icons_img/icons8-comments-50.png"),
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
      body: SingleChildScrollView(
        child: Container(
          height: size.height * .35,
          decoration: BoxDecoration(
            color: Color(0xFFC7B8F5),
            image: DecorationImage(
              alignment: Alignment.centerRight,
              image: AssetImage("assets/icons/djhsa.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: ListView(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}

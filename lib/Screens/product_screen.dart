import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product-detail';

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
        backgroundColor: Color(0xFFC7B8F50),
        leading: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'HomeScreen'),
          child: Icon(Icons.arrow_back, size: 30),
          ),
        actions: [
          IconButton(
            onPressed: () => {Navigator.pushNamed(context, 'CommentScreen')},
            icon: Icon(Icons.comment, size: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: Color(0xFFC7B8F50),
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

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final items = <Widget>[
      Container(
        child: Image(
          image: AssetImage(
            "assets/icons_img/icons8-download-from-the-cloud-50.png",
          ),
        ),
      ),
      Container(
        child: Image(
          image: AssetImage(
            "assets/icons_img/icons8-heart-50.png",
          ),
        ),
      ),
      Container(
        child: Image(
          image: AssetImage(
            "assets/icons_img/icons8-home-50.png",
          ),
        ),
      ),
      Container(
        child: Image(
          image: AssetImage(
            "assets/icons_img/icons8-settings-50.png",
          ),
        ),
      ),
      Container(
        child: Image(
          image: AssetImage(
            "assets/icons_img/icons8-shutdown-50.png",
          ),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        height: 60,
        color: Color(0xFFC7B8F5),
        index: index,
        items: items,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: Color(0xFFC7B8F5),
            image: DecorationImage(
              alignment: Alignment.centerRight,
              image: AssetImage("assets/icons/book.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 185,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: Container(
                          child: Image(
                            image:AssetImage("assets/icons_img/icons8-search-50.png"),
                          ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

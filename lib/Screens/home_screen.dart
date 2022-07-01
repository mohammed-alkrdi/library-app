import 'package:flutter/material.dart';
import 'package:my_library/Widgets/Text/text_input.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 2 ;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final items = <Widget>[
      Icon(Icons.download , size: 30),
      Icon(Icons.favorite , size: 30),
      Icon(Icons.home , size: 30),
      Icon(Icons.person , size: 30),
      Icon(Icons.logout , size: 30),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        height: 60,
        color: Color(0xFFC7B8F5),
        index: index,
        items: items,
      ) ,
      body: SingleChildScrollView(
        child: Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: Color(0xFFC7B8F5),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage("assets/images/meditation_bg.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInput(
                      text: 'Discover Milestone Books',
                      fontsize: 24,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
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

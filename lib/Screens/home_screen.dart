import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_library/Widgets/products_grid.dart';


enum FilterOptions {
  Favorites,
  All,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _showOnlyFavorites = false;
  int index = 2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final items = <Widget>[
      GestureDetector(


        child: Icon(Icons.favorite, size: 30),
      ),
      Icon(Icons.download, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(FontAwesomeIcons.powerOff, size: 30),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7B8F50),
        title: Text('Search for books'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        height: 60,
        color: Color(0xFFC7B8F50),
        index: index,
        items: items,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFC7B8F50),
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage("assets/icons/book.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          ProductsGrid(showFavs: _showOnlyFavorites),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final search = [
    "ahmed",
    "mohammed",
  ];
  final recentSearch = ["mohammed"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear, size: 30),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'HomeScreen');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return new HomeScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentSearch : search;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.book),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}

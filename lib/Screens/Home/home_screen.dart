import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_library/Models/book_model.dart';
import 'package:my_library/Widgets/products_grid.dart';
import 'package:provider/provider.dart';
import 'drawer_app.dart';

enum FilterOptions {
  favorites,
  all,
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _showOnlyFavorites = false;
@override
/*void initState() {
  Future.delayed(Duration.zero).then((_) {
  //final postModel =
  //postModel.getPostData();
});
  super.initState();
}*/
@override
  void didChangeDependencies() {
   if (_isInit) {
     Provider.of<Book>(context, listen: false);
   }
   _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<Book>(context);
    var size = MediaQuery.of(context).size;
    /* final items = <Widget>[
      Icon(Icons.favorite, size: 30),
      Icon(Icons.download, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(FontAwesomeIcons.powerOff, size: 30),
    ];*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Search for books'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text("Only Favorites Books"),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text("Show All books"),
              ),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      /* bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        height: 60,
        color: Color(0xFFC7B8F50),
        index: index,
        items: items,
      ),*/
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                alignment: Alignment.centerRight,
                image: AssetImage("assets/icons/book.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
         // ProductsGrid(showFavs: _showOnlyFavorites),
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
          icon: const Icon(Icons.clear, size: 30),
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

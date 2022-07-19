
import 'package:flutter/material.dart';

import 'Main_books_page.dart';


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
        Navigator.pushNamed(context, 'MainBooksPage');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return new MainBooksPage();
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
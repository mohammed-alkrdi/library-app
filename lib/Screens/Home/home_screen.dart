import 'package:flutter/material.dart';
import 'package:my_library/Screens/Details/book_details_screen.dart';
import 'package:my_library/Screens/Home/Main_books_page.dart';
import 'package:my_library/Screens/Profile/account_details.dart';
import 'package:provider/provider.dart';

import '../../Models/logout_request.dart';
import '../../Providers/logout_provider.dart';
import '../../colors.dart';
import '../login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;


  List pages = [
    MainBooksPage(),
    AccountDetails(),
    BookDetailsScreen(),
  ];

  void onTapNav(int index) {
    if(index == 3) {
      return;
  }
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Future<void> _logOut() async {
      LogOutRequest(
        token: "token",
      );
      var provider = Provider.of<DataLogOut>(context, listen: false);
      await provider.postData();
      if (provider.isBack) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }

    AlertDialog alert = AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure you want to log out from the app?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _logOut();
          },
          child: Text(
            'yes',
            style: TextStyle(
              color: AppColors.b,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'no',
            style: TextStyle(
              color: AppColors.b,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          selectedItemColor: AppColors.b,
          unselectedItemColor: AppColors.c,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          iconSize: 30,
          onTap: onTapNav,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  },
                  child: Icon(Icons.logout)),
              label: "Log Out",
            ),
          ],
        ),
      ),
    );
  }
}

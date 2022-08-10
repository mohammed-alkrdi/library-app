import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Screens/Home/Main_books_page.dart';
import 'package:my_library/Screens/Profile/account_details.dart';
import 'package:my_library/Screens/Settings/settings_screen.dart';
import 'package:provider/provider.dart';

import '../../Models/logout_request.dart';
import '../../Providers/logout_provider.dart';
import '../../colors.dart';
import '../login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    SettingScreen(),
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
      title: Text(AppLocalizations.of(context)!.log_out),
      content: Text(AppLocalizations.of(context)!.sure_log_out),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _logOut();
          },
          child: Text(
            AppLocalizations.of(context)!.yes_f,
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
            AppLocalizations.of(context)!.no_f,
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
          backgroundColor: Theme.of(context).primaryColor,
          onTap: onTapNav,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: AppLocalizations.of(context)!.home_screen,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_alt),
              label: AppLocalizations.of(context)!.profile_n,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: AppLocalizations.of(context)!.settings_n,
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
              label: AppLocalizations.of(context)!.log_out,
            ),
          ],
        ),
      ),
    );
  }
}

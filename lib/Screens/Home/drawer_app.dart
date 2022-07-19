import 'package:flutter/material.dart';
import 'package:my_library/Models/logout_request.dart';
import 'package:my_library/Providers/logout_provider.dart';
import 'package:my_library/Screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    //var tokenController = TextEditingController();
    Future<void> _logOut() async {
     // String token = tokenController.text.trim();
      LogOutRequest logOutRequest = LogOutRequest(
        token:"token" ,
      );
      var provider = Provider.of<DataLogOut>(context, listen: false);
      await provider.postData(logOutRequest);
      if (provider.isBack) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
      return Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Image(
                image: AssetImage("assets/images/Picture1.png"),
                fit: BoxFit.cover,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                'User profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                'Log out',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _logOut();
              },
            ),
          ],
        ),
      );
    }
  }



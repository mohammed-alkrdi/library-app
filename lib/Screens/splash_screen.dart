

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_library/Screens/Home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/theme_provider.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  Future check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool key = (prefs.getBool('isLoggedIn') as bool);
    key == false ?
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  LoginScreen()))

    :  Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>  HomeScreen()));
  }
  late Animation <double> animation;
  late AnimationController controller;
  
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2))..forward();
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
    );
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamed(context, 'CreateNewAccount')
            //check,
    );
  }

  @override
  Widget build(BuildContext context) {
    final postModelTheme = Provider.of<ThemeProvider>(context,);
    return Scaffold(
      backgroundColor: postModelTheme.isDark
      ? postModelTheme.darkTheme.backgroundColor
      : postModelTheme.lightTheme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
              child: Center(
                  child: postModelTheme.isDark
                  ? Image.asset("assets/images/Logo.png", width:250 ,) : Image.asset("assets/images/logo 2.png", width:250 ,)
              ),
          ),

        ],
      ),
    );
  }
}

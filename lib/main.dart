import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_library/Models/logout_request.dart';
import 'package:my_library/Providers/books_provider.dart';
import 'package:my_library/Providers/logout_provider.dart';
import 'package:my_library/Providers/signin_provider.dart';
import 'package:my_library/Providers/signup_provider.dart';
import 'package:my_library/Providers/products.dart';
import 'package:my_library/Screens/comment_screen.dart';

import 'package:my_library/Screens/login_screen.dart';
import 'package:my_library/Screens/register_screen.dart';
import 'package:provider/provider.dart';

import 'Screens/Details/book_details_screen.dart';
import 'Screens/Home/Main_books_page.dart';
import 'Screens/Home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: DataSignUp(),
        ),
        ChangeNotifierProvider.value(
          value: DataSignIn(),
        ),
        ChangeNotifierProvider.value(
          value: DataLogOut(),
        ),
        ChangeNotifierProvider.value(value: DataBooks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: RegisterScreen(),
        initialRoute: '/',
        routes: {
          HomeScreen.routeName: (ctx) => new HomeScreen(),
          'CreateNewAccount': (context) => RegisterScreen(),
          'Login': (context) => LoginScreen(),
          'HomeScreen': (context) => HomeScreen(),
          'CommentScreen': (context) => CommentScreen(),
          'ProductScreen': (context) => BookDetailsScreen(),
          'MainBooksPage': (context) => MainBooksPage(),
        },
      ),
    );
  }
}

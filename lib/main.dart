import 'package:flutter/material.dart';
import 'package:my_library/Providers/book_provider.dart';
import 'package:my_library/Providers/comments_provider.dart';
import 'package:my_library/Providers/create_comment_provider.dart';
import 'package:my_library/Providers/delete_comment_provider.dart';
import 'package:my_library/Providers/edit_provider.dart';
import 'package:my_library/Providers/logout_provider.dart';
import 'package:my_library/Providers/search_provider.dart';
import 'package:my_library/Providers/signin_provider.dart';
import 'package:my_library/Providers/signup_provider.dart';
import 'package:my_library/Screens/Comments/comments_screen.dart';
import 'package:my_library/Screens/Home/home_screen.dart';

import 'package:my_library/Screens/Profile/account_edit.dart';


import 'package:my_library/Screens/login_screen.dart';
import 'package:my_library/Screens/register_screen.dart';
import 'package:provider/provider.dart';

import 'Providers/book_category_provider.dart';
import 'Providers/books_provider.dart';
import 'Providers/category_provider.dart';
import 'Providers/like_provider.dart';
import 'Providers/profile_provider.dart';
import 'Providers/update_comment_provider.dart';
import 'Screens/Details/book_details_screen.dart';
import 'Screens/Home/Main_books_page.dart';
import 'Screens/Home/search_screen.dart';
import 'Screens/book_with_category_screen.dart';

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
          value: DataSignUp(),
        ),
        ChangeNotifierProvider.value(
          value: DataSignIn(),
        ),
        ChangeNotifierProvider.value(
          value: DataLogOut(),
        ),
        ChangeNotifierProvider.value(
            value: DataBooks(),
        ),
        ChangeNotifierProvider.value(
          value: EditProfileData(),
        ),
        ChangeNotifierProvider.value(
            value: DataProfile(),
        ),
        ChangeNotifierProvider.value(
            value: DataBook(),
        ),
        ChangeNotifierProvider.value(
            value: DataComments(),
        ),
        ChangeNotifierProvider.value(
          value: DataComment(),
        ),
        ChangeNotifierProvider.value(
            value: DataLike(),
        ),
        ChangeNotifierProvider.value(
          value: DataCategory(),
        ),
        ChangeNotifierProvider.value(
            value: DataCategoryWithBooks(),
        ),
        ChangeNotifierProvider.value(
            value: DataSearch(),
        ),
        ChangeNotifierProvider.value(
          value: DataUpdateComment(),
        ),
        ChangeNotifierProvider.value(
            value: DataDeleteComment(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: RegisterScreen(),
        initialRoute: '/',
        routes: {
          'CreateNewAccount': (context) => RegisterScreen(),
          'Login': (context) => LoginScreen(),
          'CommentScreen': (context) => CommentsScreen(),
          'ProductScreen': (context) => BookDetailsScreen(),
          'MainBooksPage': (context) => MainBooksPage(),
          'Edit My Info': (context) => EditAccount(),
          'BookDetailsScreen': (context) => BookDetailsScreen(),
          'HomeScreen' : (context) => HomeScreen(),
          'SearchScreen' : (context) => SearchScreen(),
          'BookCategory' : (context) => CategoryBook(),
        },

      ),
    );
  }
}

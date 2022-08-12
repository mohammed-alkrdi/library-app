import 'package:flutter/material.dart';
import 'package:my_library/Providers/book_provider.dart';
import 'package:my_library/Providers/comments_provider.dart';
import 'package:my_library/Providers/edit_provider.dart';
import 'package:my_library/Providers/logout_provider.dart';
import 'package:my_library/Providers/search_provider.dart';
import 'package:my_library/Providers/signin_provider.dart';
import 'package:my_library/Providers/signup_provider.dart';
import 'package:my_library/Screens/Comments/comments_screen.dart';
import 'package:my_library/Screens/Home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_library/Screens/Profile/account_edit.dart';


import 'package:my_library/Screens/login_screen.dart';
import 'package:my_library/Screens/register_screen.dart';
import 'package:my_library/Screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Providers/book_category_provider.dart';
import 'Providers/books_provider.dart';
import 'Providers/category_provider.dart';
import 'Providers/language_provider.dart';
import 'Providers/profile_provider.dart';
import 'Providers/theme_provider.dart';
import 'Screens/Details/book_details_screen.dart';
import 'Screens/Home/Main_books_page.dart';
import 'Screens/Home/search_screen.dart';
import 'Screens/book_with_category_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
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
            value: DataCategory(),
        ),
        ChangeNotifierProvider.value(
            value: DataCategoryWithBooks(),
        ),
        ChangeNotifierProvider.value(
            value: DataSearch(),
        ),
        ChangeNotifierProvider.value(
          value: LanguageData(),
        ),
        ChangeNotifierProvider.value(
            value: ThemeProvider(),
        ),
      ],
      child: Consumer(
        builder: (context, ThemeProvider themeNotifier, child) =>
         MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: Provider.of<LanguageData>(context, listen: true).currentLocale,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          home: SplashScreen(),

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
      ),
    );

  }
}

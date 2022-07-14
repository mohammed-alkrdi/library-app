import 'package:flutter/material.dart';
import 'package:my_library/Providers/auth_provider.dart';
import 'package:my_library/Providers/products.dart';
import 'package:my_library/Screens/comment_screen.dart';
import 'package:my_library/Screens/home_screen.dart';
import 'package:my_library/Screens/login_screen.dart';
import 'package:my_library/Screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'Screens/product_screen.dart';


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
            value: DataClass(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home:RegisterScreen(),
        initialRoute: '/',
        routes: {
          ProductScreen.routeName: (ctx) => ProductScreen(),
          HomeScreen.routeName: (ctx) => new HomeScreen(),
          'CreateNewAccount' :(context) => RegisterScreen(),
          'LogIn' :(context) => HomeScreen(),
          //'SignUp' :(context) => LoginScreen(),
          'Login' :(context) => LoginScreen(),
          'HomeScreen' :(context) => HomeScreen(),
          'CommentScreen' :(context) => CommentScreen(),
          'ProductScreen' :(context) => ProductScreen(),
        },

      ),
    );
  }
}

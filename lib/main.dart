import 'package:flutter/material.dart';
import 'package:my_library/Screens/forget_password.dart';
import 'package:my_library/Screens/login_screen.dart';
import 'package:my_library/Screens/register_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:LoginScreen(),
      initialRoute: '/',
      routes: {
        'CreateNewAccount' :(context) => RegisterScreen(),
        //'LogIn' :(context) => RegisterScreen(),
        'SignUp' :(context) => LoginScreen(),
        'Already have account? Login' :(context) => LoginScreen(),
        'ForgetPassword?' :(context) => ForgetPassword(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_library/Providers/signin_provider.dart';
import 'package:my_library/Screens/Home/Main_books_page.dart';
import 'package:my_library/Widgets/Background%20Images/background_login_image.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/Widgets/text_field_input.dart';
import 'package:my_library/Widgets/text_password_input.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:another_flushbar/flushbar.dart';
import '../Models/signin_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late String email, password;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    Future<void> _logIn() async {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      SignInBody signInBody = SignInBody(
        email: email,
        password: password,
      );
      var provider = Provider.of<DataSignIn>(context, listen: false);
      await provider.postData(signInBody);
      if (provider.isBack) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainBooksPage()),
            (route) => false);
      } else if (provider.loading == false) {
         Flushbar(
          title: 'Wellcome Back',
          message:
          'Please Sign Up First',
          duration: Duration(seconds: 4),
        ).show(context);
      }
    }

    return Stack(
      children: [
        BackgroundLoginImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Picture1.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Form(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          TextFieldInput(
                            hint: 'email',
                            textController: emailController,
                            image: 'assets/icons_img/icons8-mail-50.png',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                            onSaved: (value) {
                              email = value!;
                            },
                            validator: (value) {
                              String? _msg;
                              RegExp regex = new RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (value!.isEmpty) {
                                _msg = "your email is required";
                              } else if (!regex.hasMatch(value)) {
                                _msg = "Pleas provide a valid email address";
                              }
                              return _msg;
                            },
                          ),
                          TextPasswordInput(
                            hint: 'Password',
                            textController: passwordController,
                            image: 'assets/icons_img/icons8-lock-50.png',
                            inputAction: TextInputAction.done,
                            onSaved: (value) {
                              password = value!;
                            },
                            validator: (value) {
                              value!.isEmpty;
                              "Please enter your password";
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          //CheckBox(),
                          RoundedButton(
                            onPressed: () => {_logIn()},
                            text: 'LogIn',
                            sizeHeight: 50,
                            sizeWidth: 310,
                            color: AppColors.b,
                          ),
                          SizedBox(height: 50,),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, 'CreateNewAccount'),
                            child: NewText(
                              text: 'CreateNewAccount',
                              fontsize: 16,
                              alignment: Alignment.center,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

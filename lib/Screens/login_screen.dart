import 'package:flutter/material.dart';
import 'package:my_library/Widgets/Background%20Images/background_login_image.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/Text/text_field_input.dart';
import 'package:my_library/Widgets/Text/text_input.dart';
import 'package:my_library/Widgets/Text/text_password_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextFieldInput(
                          hint: 'email',
                          image: 'assets/icons_img/icons8-mail-50.png',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          onSaved: (value) {},
                          validator: (value) {},
                        ),
                        TextPasswordInput(
                          hint: 'Password',
                          image: 'assets/icons_img/icons8-lock-50.png',
                          inputAction: TextInputAction.done,
                          onSaved: (value) {},
                          validator: (value) {},
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'ForgetPassword?'),
                          child: TextInput(
                            text: 'ForgetPassword?',
                            fontsize: 16,
                            color: Colors.white,
                            alignment: Alignment.topRight,
                          ),
                        ),
                        RoundedButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, 'LogIn')},
                          text: 'LogIn',
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, 'CreateNewAccount'),
                          child: TextInput(
                            text: 'CreateNewAccount',
                            fontsize: 16,
                            alignment: Alignment.center,
                            color: Colors.white,
                          ),
                        ),
                      ],
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

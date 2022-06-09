import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_library/Widgets/Background%20Images/background_register_image.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/Text/text_field_input.dart';
import 'package:my_library/Widgets/Text/text_input.dart';
import 'package:my_library/Widgets/Text/text_password_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundSignupImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 90,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Picture1.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextFieldInput(
                          hint: 'user',
                          icon: FontAwesomeIcons.user,
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.none,
                          onSaved: (value) {},
                          validator: (value) {},
                        ),
                        TextFieldInput(
                          hint: 'email',
                          icon: FontAwesomeIcons.solidEnvelope,
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          onSaved: (value) {},
                          validator: (value) {},
                        ),
                        TextPasswordInput(
                          hint: 'Password',
                          icon: FontAwesomeIcons.lock,
                          inputAction: TextInputAction.done,
                          onSaved: (value) {},
                          validator: (value) {},
                        ),
                        TextPasswordInput(
                          hint: 'RePassword',
                          icon: FontAwesomeIcons.lock,
                          inputAction: TextInputAction.done,
                          onSaved: (value) {},
                          validator: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, 'SignUp')},
                          text: 'SingUp',
                        ),
                        /*GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, 'LogIN'),*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextInput(
                              text: 'Already have an account?',
                              fontsize: 16,
                              alignment: Alignment.center,
                              color: Colors.white,
                            ),
                            GestureDetector(onTap: () => Navigator.pushNamed(
                                context, 'Login'),
                              child: TextInput(
                                text: 'Login',
                                fontsize: 16,
                                alignment: Alignment.center,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
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

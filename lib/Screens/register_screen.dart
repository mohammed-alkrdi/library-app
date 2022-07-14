
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Models/signup_model.dart';
import 'package:my_library/Providers/auth_provider.dart';
import 'package:my_library/Screens/login_screen.dart';
import 'package:my_library/Widgets/Background%20Images/background_register_image.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/Text/text_field_input.dart';
import 'package:my_library/Widgets/Text/text_input.dart';
import 'package:my_library/Widgets/Text/text_password_input.dart';
import 'package:provider/provider.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>(

  );

  late String name, email, password, age;
  late int phoneNumber;






  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    var ageController = TextEditingController();

    Future<void> _registration() async {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String age = ageController.text.trim();
      String phoneNumber = phoneNumberController.text.trim();
      SignUpBody signUpBody = SignUpBody(
        name: name,
        age: age,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
      );
      var provider = Provider.of<DataClass>(context, listen: false);
      await provider.postData(signUpBody);
      if(provider.isBack) {
        Navigator.push(
            context,
          MaterialPageRoute(builder: (context) =>  LoginScreen()),
        );
      }
    }

    return Stack(
      children: [
        BackgroundSignupImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: //isLoading
               SingleChildScrollView(
                  child: SafeArea(
                  child: Column(
                  children: [
                  SizedBox(
                    height: 20,
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
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFieldInput(
                            hint: 'name',
                            textController: nameController,
                            image: 'assets/icons_img/icons8-user-male-50.png',
                            inputType: TextInputType.name,
                            inputAction: TextInputAction.next,
                            onSaved: (value) {
                              name = value!;
                            },
                            validator: (value) {
                              String? _msg;
                              if(value!.isEmpty) {
                                _msg =  "Please enter your name";
                              }
                              return _msg;
                            },
                          ),
                          TextFieldInput(
                            hint: 'age',
                            textController: ageController,
                            image:'assets/icons_img/icons8-user-50.png' ,
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                            onSaved: (value) {
                              age = value!;
                            },
                            validator: (value) {
                              String? _msg;
                              if(value!.isEmpty) {
                               _msg =  "Please enter your age";
                              }
                              return _msg;

                            },
                          ),
                          TextFieldInput(
                            hint: 'phone number',
                            textController: phoneNumberController,
                            image: 'assets/icons_img/icons8-phone-50.png',
                            inputType: TextInputType.number,
                            inputAction: TextInputAction.next,
                            onSaved: (value) {
                              phoneNumber = value! as int;
                            },
                            validator: (value) {
                              String? _msg;
                              if(value!.isEmpty) {
                                _msg =  "Please enter your phone number";
                              }
                              return _msg;
                            },
                          ),
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
                              String ? _msg;
                              RegExp regex = new RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if(value!.isEmpty) {
                                _msg = "your email is required";
                              } else if (!regex.hasMatch(value)) {
                                _msg = "Pleas provide a valid email address";
                              }
                              return _msg;
                            },
                          ),
                          TextPasswordInput(
                            hint: 'password',
                            textController: passwordController,
                            image: 'assets/icons_img/icons8-lock-50.png',
                            inputAction: TextInputAction.done,
                            onSaved: (value) {
                              password = value!;
                            },
                            validator: (value) {
                              String? _msg;
                              if(value!.isEmpty) {
                                _msg =  "Please enter your password";
                              }
                              return _msg;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            onPressed: () =>
                                {_registration()},
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
                              GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, 'Login'),
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

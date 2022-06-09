import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_library/Widgets/Background%20Images/background_forget_image.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/Text/text_field_input.dart';
import 'package:my_library/Widgets/Text/text_input.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundForgetImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => {
                Navigator.pop(context),
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Forget Password',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.8,
                        child: TextInput(
                          text: 'Enter your email and we will send you to reset your password',
                          fontsize: 24,
                          color: Colors.white,
                          alignment: Alignment.center,
                        ),
                      ),
                       SizedBox(
                         height: 50,
                       ),
                       Container(
                         padding: const EdgeInsets.symmetric(horizontal: 40),
                         child: TextFieldInput(
                            hint: 'email',
                            icon: FontAwesomeIcons.solidEnvelope,
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            onSaved: (value) {},
                            validator: (value) {},
                          ),
                       ),
                      SizedBox(
                        height: 15,
                      ),
                      RoundedButton(
                        onPressed: () {},
                        text: 'Send',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

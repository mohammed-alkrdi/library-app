import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Models/edit_profile_model.dart';
import 'package:my_library/Providers/edit_provider.dart';
import 'package:my_library/Screens/Home/home_screen.dart';
import 'package:my_library/Widgets/edit_widget.dart';
import 'package:provider/provider.dart';

import '../../Widgets/app_icons.dart';
import '../../Widgets/rounded_button.dart';
import '../../Widgets/text.dart';
import '../../colors.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  final formKey = GlobalKey<FormState>();

  late String? name, email, age, phoneNumber;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    var ageController = TextEditingController();
    Future<void> _edit() async {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String age = ageController.text.trim();
      String phoneNumber = phoneNumberController.text.trim();
      EditProfileBody editProfileBody = EditProfileBody(
        name: name,
        age: age,
        phoneNumber: phoneNumber,
        email: email,
        token: "token",
      );
      var provider = Provider.of<EditProfileData>(context, listen: false);
      await provider.postData(editProfileBody);
      if (provider.isBack) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else if (provider.loading == false) {
        Flushbar(
          title: 'Hi',
          message:
          'Please enter your information currectly',
          duration: Duration(seconds: 4),
        ).show(context);
      }
    }

    AlertDialog alert = AlertDialog(
      title: Text("Edit Your Profile Info"),
      content: Text("Are you sure you want to edit your information?"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _edit();
          },
          child: Text(
            'yes',
            style: TextStyle(
              color: AppColors.b,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'no',
            style: TextStyle(
              color: AppColors.b,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.b,
        title: NewText(
          text: "Edit Profile Info",
          color: Colors.white,
          fontsize: 20,
          alignment: Alignment.centerLeft,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            //profile icon
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppIcons(
                        icon: Icons.person,
                        backgroundColor: AppColors.b,
                        iconColor: Colors.white,
                        size: 150,
                        iconSize: 75,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // name
                      ProfileEditWidget(
                        appIcons: AppIcons(
                          icon: Icons.person,
                          backgroundColor: AppColors.b,
                          iconColor: Colors.white,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: 'name',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        textController: nameController,
                        onSaved: (value) {
                          name = value!;
                        },
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //age
                      ProfileEditWidget(
                        appIcons: AppIcons(
                          icon: Icons.person,
                          backgroundColor: AppColors.b,
                          iconColor: Colors.white,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: 'age',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        textController: ageController,
                        onSaved: (value) {
                          age = value!;
                        },
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //phone number
                      ProfileEditWidget(
                        appIcons: AppIcons(
                          icon: Icons.phone,
                          backgroundColor: AppColors.j,
                          iconColor: Colors.white,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: 'phone number',
                        inputType: TextInputType.number,
                        inputAction: TextInputAction.next,
                        textController: phoneNumberController,
                        onSaved: (value) {
                          phoneNumber = value!;
                        },
                        validator: (value) {},
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //email
                      ProfileEditWidget(
                        appIcons: AppIcons(
                          icon: Icons.email,
                          backgroundColor: AppColors.j,
                          iconColor: Colors.white,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: 'email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.none,
                        textController: emailController,
                        onSaved: (value) {
                          email = value!;
                        },
                        validator: (value) {
                          !EmailValidator.validate(value!)
                              ? "your email incorrect" : null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //password
                      /* ProfileEditWidget(
                              appIcons: AppIcons(
                                icon: Icons.person,
                                backgroundColor: AppColors.b,
                                iconColor: Colors.white,
                                size: 50,
                                iconSize: 25,
                              ),
                              text: 'name',
                              inputType: TextInputType.name,
                              inputAction:TextInputAction.next,
                              textController: nameController,
                              onSaved: (value) {},
                              validator: (value) {},
                            ),
                            SizedBox(height: 20,),*/
                      RoundedButton(
                        color: AppColors.b,
                        text: "Save New Info",
                        sizeHeight: 50,
                        sizeWidth: 310,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

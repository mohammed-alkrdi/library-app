import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Models/edit_profile_model.dart';
import 'package:my_library/Providers/edit_provider.dart';
import 'package:my_library/Screens/Home/home_screen.dart';
import 'package:my_library/Widgets/edit_widget.dart';
import 'package:provider/provider.dart';

import '../../Providers/theme_provider.dart';
import '../../Widgets/app_icons.dart';
import '../../Widgets/rounded_button.dart';
import '../../Widgets/text.dart';
import '../../colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final postModelTheme = Provider.of<ThemeProvider>(context,);
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
      title: Text(AppLocalizations.of(context)!.edit_profile_info_f),
      content: Text(AppLocalizations.of(context)!.are_sure_edit_info_p),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            _edit();
          },
          child: Text(
            AppLocalizations.of(context)!.yes_f,
            style: TextStyle(
              color: postModelTheme.isDark
                  ? postModelTheme.darkTheme.primaryColorDark
                  : AppColors.b,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppLocalizations.of(context)!.no_f,
            style: TextStyle(
              color: postModelTheme.isDark
                  ? postModelTheme.darkTheme.primaryColorDark
                  : AppColors.b,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: postModelTheme.isDark
            ? postModelTheme.darkTheme.backgroundColor
            : postModelTheme.lightTheme.backgroundColor,
        title: NewText(
          text: AppLocalizations.of(context)!.edit_profile_b,
          color: postModelTheme.isDark
              ? postModelTheme.darkTheme.primaryColor
              : postModelTheme.lightTheme.primaryColor,
          fontsize: 24,
          alignment: Alignment.center,
        ),
        iconTheme: IconThemeData(
              color: postModelTheme.isDark
                  ? postModelTheme.darkTheme.primaryColor
                  : postModelTheme.lightTheme.primaryColor,
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
                        backgroundColor: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColorDark
                            : AppColors.b,
                        iconColor: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColor
                            : postModelTheme.lightTheme.primaryColor,
                        size: 150,
                        iconSize: 75,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // name
                      ProfileEditWidget(
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons: AppIcons(
                          icon: Icons.person,
                          backgroundColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColorDark
                              : AppColors.b,
                          iconColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColor
                              : postModelTheme.lightTheme.primaryColor,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: AppLocalizations.of(context)!.name,
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
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons: AppIcons(
                          icon: Icons.person,
                          backgroundColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColorDark
                              : AppColors.b,
                          iconColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColor
                              : postModelTheme.lightTheme.primaryColor,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: AppLocalizations.of(context)!.age,
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
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons: AppIcons(
                          icon: Icons.phone,
                          backgroundColor: AppColors.j,
                          iconColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColor
                              : postModelTheme.lightTheme.primaryColor,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: AppLocalizations.of(context)!.phone_number,
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
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons: AppIcons(
                          icon: Icons.email,
                          backgroundColor: AppColors.j,
                          iconColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColor
                              : postModelTheme.lightTheme.primaryColor,
                          size: 50,
                          iconSize: 25,
                        ),
                        text: AppLocalizations.of(context)!.email,
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.none,
                        textController: emailController,
                        onSaved: (value) {
                          email = value!;
                        },
                        validator: (value) {
                          //!EmailValidator.validate(value!)
                              //? "your email incorrect" : null;
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
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColorDark
                            : AppColors.b,
                        text: AppLocalizations.of(context)!.save_p_info,
                        sizeHeight: 50,
                        sizeWidth: 310,
                        textColor: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColor
                            : postModelTheme.lightTheme.primaryColor,
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

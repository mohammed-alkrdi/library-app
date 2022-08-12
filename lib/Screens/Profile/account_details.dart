import 'package:flutter/material.dart';
import 'package:my_library/Providers/profile_provider.dart';
import 'package:my_library/Widgets/account_widget.dart';
import 'package:my_library/Widgets/app_icons.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Providers/profile_provider.dart';
import '../../Providers/theme_provider.dart';


class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataProfile>(context, listen: false);
    postModel.getData();
  }
  @override
  Widget build(BuildContext context) {
    final postModelTheme = Provider.of<ThemeProvider>(context,);
    final postModel = Provider.of<DataProfile>(context);
    return Scaffold(
      backgroundColor: postModelTheme.isDark
          ? postModelTheme.darkTheme.backgroundColor
          : postModelTheme.lightTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: postModelTheme.isDark
            ? postModelTheme.darkTheme.backgroundColor
            : postModelTheme.lightTheme.backgroundColor,
        title: NewText(
          text: AppLocalizations.of(context)!.profile,
          color: postModelTheme.isDark
              ? postModelTheme.darkTheme.primaryColor
              : postModelTheme.lightTheme.primaryColor,
          fontsize: 24,
          alignment: Alignment.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20),
        child: Column(

          children: [
            //profile icon
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: postModelTheme.isDark
                          ? postModelTheme.lightTheme.primaryColor
                          : postModelTheme.darkTheme.primaryColor,
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
                      SizedBox(height: 30,),
                      // name
                      AccountWidget(
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons:AppIcons(
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
                        newText: NewText(
                            text: postModel.postProfile?.name ?? "", color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColor
                            : postModelTheme.lightTheme.primaryColor,),
                      ),
                      SizedBox(height: 20,),
                      //age
                      AccountWidget(
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons:AppIcons(
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
                        newText: NewText(text: postModel.postProfile?.age.toString() ?? ""  , color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColor
                            : postModelTheme.lightTheme.primaryColor,),
                      ),
                      SizedBox(height: 20,),
                      //phone number
                      AccountWidget(
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons:AppIcons(
                          icon: Icons.phone,
                          backgroundColor: AppColors.j,
                          iconColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColor
                              : postModelTheme.lightTheme.primaryColor,
                          size: 50,
                          iconSize: 25,
                        ),
                        newText: NewText(text: postModel.postProfile?.phoneNumber.toString() ?? "", color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColor
                            : postModelTheme.lightTheme.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20,),
                      //email
                      AccountWidget(
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.backgroundColor
                            : postModelTheme.lightTheme.backgroundColor,
                        appIcons:AppIcons(
                          icon: Icons.email,
                          backgroundColor: AppColors.j,
                          iconColor: postModelTheme.isDark
                              ? postModelTheme.darkTheme.primaryColor
                              : postModelTheme.lightTheme.primaryColor,
                          size: 50,
                          iconSize: 25,
                        ),
                        newText: NewText(text: postModel.postProfile?.email ?? "", color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColor
                            : AppColors.i
                        ),
                      ),
                      SizedBox(height: 20,),
                      //password
                      SizedBox(height: 20,),
                      RoundedButton(
                        color: postModelTheme.isDark
                            ? postModelTheme.darkTheme.primaryColorDark
                            : AppColors.b,
                        text: AppLocalizations.of(context)!.edit_profile_b,
                        sizeHeight: 50, sizeWidth: 310,
                        textColor: postModelTheme.isDark
                                ? postModelTheme.darkTheme.primaryColor
                                : postModelTheme.lightTheme.primaryColor,
                        onPressed: () => Navigator.pushNamed(
                            context, 'Edit My Info'
                        ),
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

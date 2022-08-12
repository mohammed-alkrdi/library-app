import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Providers/theme_provider.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:provider/provider.dart';

import '../../Providers/language_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: postModel.isDark
          ? postModel.darkTheme.backgroundColor
          : postModel.lightTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: postModel.isDark
            ? postModel.darkTheme.backgroundColor
            : postModel.lightTheme.backgroundColor,
        //elevation: 0.0,
        title: NewText(
          text: AppLocalizations.of(context)!.setting,
          color: postModel.isDark
              ? postModel.darkTheme.primaryColor
              : postModel.lightTheme.primaryColor,
          fontsize: 24,
          alignment: Alignment.center,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: NewText(
                    text: AppLocalizations.of(context)!.change_theme_app,
                    color: postModel.isDark
                        ? postModel.darkTheme.primaryColor
                        : postModel.lightTheme.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Consumer(
                    builder: (context, ThemeProvider themeNotifier, child) {
                  return IconButton(
                    onPressed: () {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                      Navigator.pushNamed(context, 'HomeScreen');
                    },
                    icon: Icon(
                      themeNotifier.isDark ? Icons.dark_mode : Icons.light_mode,
                    ),
                    color: postModel.isDark
                        ? postModel.darkTheme.primaryColor
                        : postModel.lightTheme.primaryColor,
                  );
                }),
              ),
            ],
          ),
          Divider(
            color: postModel.isDark
                ? postModel.darkTheme.primaryColor
                : postModel.lightTheme.primaryColor,
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: NewText(
              text: AppLocalizations.of(context)!.change_app_language,
              color: postModel.isDark
                  ? postModel.darkTheme.primaryColor
                  : postModel.lightTheme.primaryColor,
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RoundedButton(
            text: AppLocalizations.of(context)!.english_language,
            onPressed: () {
              context.read<LanguageData>().ChangeLocal("en");
            },
            sizeHeight: 100,
            sizeWidth: 200,
            textColor: postModel.isDark
                ? postModel.darkTheme.primaryColor
                : postModel.lightTheme.primaryColor,
            color: postModel.isDark
            ? postModel.darkTheme.backgroundColor
            : postModel.darkTheme.primaryColor,
          ),
          //SizedBox(height: 30,),
          RoundedButton(
            text: AppLocalizations.of(context)!.arabic_language,
            onPressed: () {
              context.read<LanguageData>().ChangeLocal("ar");
              // Navigator.pushNamed(context, 'CreateNewAccount');
            },
            sizeHeight: 100,
            sizeWidth: 200,
            textColor: postModel.isDark
                ? postModel.darkTheme.primaryColor
                : postModel.lightTheme.primaryColor,
            color: postModel.isDark
            ? postModel.darkTheme.backgroundColor
            : postModel.darkTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}

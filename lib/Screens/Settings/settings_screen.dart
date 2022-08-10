
import 'package:flutter/material.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:provider/provider.dart';

import '../../Providers/language_provider.dart';
import 'change_theme_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 0.0,
        title: NewText(text: AppLocalizations.of(context)!.setting, color: Colors.black, fontsize: 24, alignment: Alignment.center,),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: NewText(text: AppLocalizations.of(context)!.change_theme_app, color: Colors.black),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: IconButton(
                  onPressed: (){},
                  icon: ChangeThemeButtonWidget(),
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: NewText(
              text: AppLocalizations.of(context)!.change_app_language,
              color: Colors.black,
              alignment: Alignment.centerLeft,
            ),
          ),
          SizedBox(height: 30,),
          RoundedButton(
            text: AppLocalizations.of(context)!.english_language,
            onPressed: () {
              context.read<LanguageData>().ChangeLocal("en");
            },
            sizeHeight: 100,
            sizeWidth: 200,
            textColor: Colors.black,
            color: Colors.white,
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
            textColor: Colors.black,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

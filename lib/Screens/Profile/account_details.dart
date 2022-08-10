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
    final postModel = Provider.of<DataProfile>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: NewText(
          text: AppLocalizations.of(context)!.profile,
          color: Colors.black,
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
                child: Column(
                  children: [
                    AppIcons(
                      icon: Icons.person,
                      backgroundColor: AppColors.b,
                      iconColor: Colors.white,
                      size: 150,
                      iconSize: 75,
                    ),
                    SizedBox(height: 30,),
                    // name
                    AccountWidget(
                      appIcons:AppIcons(
                        icon: Icons.person,
                        backgroundColor: AppColors.b,
                        iconColor: Colors.white,
                        size: 50,
                        iconSize: 25,
                      ),
                      newText: NewText(
                          text: postModel.postProfile?.name ?? "", color: AppColors.i),
                    ),
                    SizedBox(height: 20,),
                    //age
                    AccountWidget(
                      appIcons:AppIcons(
                        icon: Icons.person,
                        backgroundColor: AppColors.b,
                        iconColor: Colors.white,
                        size: 50,
                        iconSize: 25,
                      ),
                      newText: NewText(text: postModel.postProfile?.age.toString() ?? ""  , color: AppColors.i),
                    ),
                    SizedBox(height: 20,),
                    //phone number
                    AccountWidget(
                      appIcons:AppIcons(
                        icon: Icons.phone,
                        backgroundColor: AppColors.j,
                        iconColor: Colors.white,
                        size: 50,
                        iconSize: 25,
                      ),
                      newText: NewText(text: postModel.postProfile?.phoneNumber.toString() ?? "", color: AppColors.i),
                    ),
                    SizedBox(height: 20,),
                    //email
                    AccountWidget(
                      appIcons:AppIcons(
                        icon: Icons.email,
                        backgroundColor: AppColors.j,
                        iconColor: Colors.white,
                        size: 50,
                        iconSize: 25,
                      ),
                      newText: NewText(text: postModel.postProfile?.email ?? "", color: AppColors.i),
                    ),
                    SizedBox(height: 20,),
                    //password
                    SizedBox(height: 20,),
                    RoundedButton(
                      color: AppColors.b,
                      text: AppLocalizations.of(context)!.edit_profile_b,
                      sizeHeight: 50, sizeWidth: 310,
                      textColor: Colors.white,
                      onPressed: () => Navigator.pushNamed(
                          context, 'Edit My Info'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

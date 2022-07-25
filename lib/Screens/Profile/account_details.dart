import 'package:flutter/material.dart';
import 'package:my_library/Providers/profile_provider.dart';
import 'package:my_library/Widgets/account_widget.dart';
import 'package:my_library/Widgets/app_icons.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';


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
    postModel.getPostProfile();
  }
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataProfile>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.b,
        title: NewText(
          text: "Profile",
          color: Colors.white,
          fontsize: 24,
          alignment: Alignment.center,
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
                          text: postModel.post?.name ?? "", color: AppColors.i),
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
                      newText: NewText(text: postModel.post?.age.toString() ?? ""  , color: AppColors.i),
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
                      newText: NewText(text: postModel.post?.phoneNumber.toString() ?? "", color: AppColors.i),
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
                      newText: NewText(text: postModel.post?.email ?? "", color: AppColors.i),
                    ),
                    SizedBox(height: 20,),
                    //password
                    SizedBox(height: 20,),
                    RoundedButton(
                      color: AppColors.b,
                      text: "Edit profile info",
                      sizeHeight: 50, sizeWidth: 310,
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

import 'package:flutter/material.dart';
import 'package:my_library/Widgets/app_icons.dart';
import 'package:my_library/Screens/Details/expandable_text.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';

import '../../Providers/book_provider.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataBook>(context, listen: false);
    postModel.getPostBook();
  }
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataBook>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height *.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      postModel.post?.image ?? "",
                    ),
                  ),
                ),
              )),
          //texts
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              children: [
                AppIcons(
                  icon: Icons.arrow_back_ios,
                ),
              ],
            ),
          ),
          //books details
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .5,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        NewText(text: postModel.post?.name ?? "", color: AppColors.i, fontsize: 24,),
                        SizedBox(width: 30,),
                        NewText(text: postModel.post?.author ?? "", color: AppColors.a, fontsize: 12,)
                      ],
                    ),
                    SizedBox(height: 40,),
                    NewText(text: "price", color: AppColors.i, alignment: Alignment.center,),
                    SizedBox(height: 30,),
                    NewText(text: "Description", color: AppColors.i, fontsize: 24,),
                    SizedBox(height: 30,),
                    Expanded(child: SingleChildScrollView(child: ExpandableText(text: "mohamemdmaskldnjskalksdlajskld;aksdl;sjakl;dsjkla;jdskla;jskl;ncljksahduilaushduha mohamemdmaskldnjskalksdlajskld;aksdl;sjakl;dsjkla;jdskla;jskl;ncljksahduilaushduha mohamemdmaskldnjskalksdlajskld;aksdl;sjakl;dsjkla;jdskla;jskl;ncljksahduilaushduha mohamemdmaskldnjskalksdlajskld;aksdl;sjakl;dsjkla;jdskla;jskl;ncljksahduilaushduha mohamemdmaskldnjskalksdlajskld;aksdl;sjakl;dsjkla;jdskla;jskl;ncljksahduilaushduhadjklsajiodljsklajsdklsncmx,zmcn,xzksldjaiowjeuiorqiojk,zncmx,zksjdlwioaijriosjadklxnm,cn lksaj llah iljailwj odaisodj ioaw",))),
                  ],
                ),
          ),
          ),
          //expandable text
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: AppColors.f,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedButton(
                onPressed: (){},
                text: "Buy",
                sizeHeight: 100,
                sizeWidth: 80,
                color:AppColors.d,
            ),
            RoundedButton(
                onPressed: () {},
                text: "Download",
                sizeHeight: 100,
                sizeWidth: 200,
                color: AppColors.b,
            ),
          ],
        ),
      ),
    );
  }
}

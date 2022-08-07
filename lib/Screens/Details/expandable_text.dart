import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 200;

  @override
  void initState() {
    super.initState();
    if(widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?NewText(text: firstHalf, color: AppColors.g,fontsize: 18,):
          Column(
            children: [
              NewText(height: 1.8, text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf), color: AppColors.g, fontsize: 15,),
              InkWell(
                onTap: () {
                  setState((){
                    hiddenText =! hiddenText;
                  });
                },
                child: Row(
                  children: [
                    NewText(text: "Show more", color: AppColors.b, fontsize: 18,),
                    Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.b,),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

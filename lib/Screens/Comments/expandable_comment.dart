import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';

class ExpandableComment extends StatefulWidget {
  final String text;
  const ExpandableComment({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableComment> createState() => _ExpandableCommentState();
}

class _ExpandableCommentState extends State<ExpandableComment> {
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
      child: secondHalf.isEmpty?NewText(text: firstHalf, color: Colors.black,fontsize: 18,):
      Column(
        children: [
          NewText(height: 1.8, text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf), color: Colors.black, fontsize: 18,),
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

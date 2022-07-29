import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Providers/comments_provider.dart';
import 'package:my_library/Screens/Comments/expandable_comment.dart';
import 'package:my_library/Widgets/comment_text_input.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final args = ModalRoute.of(context)?.settings.arguments;
      print(ModalRoute.of(context)!.settings.arguments);
      final postModel = Provider.of<DataComments>(context, listen: false);
      postModel.getData(args as int);
    });
  }
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataComments>(context);
    var commentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.b,
        title: NewText(
          text: "comments",
          fontsize: 24,
          color: Colors.white,
          alignment: Alignment.centerLeft,
        ),
      ),
       body:Scaffold( body:Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: postModel.listOkComments?.comments.length ?? 0,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    margin:
                    EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NewText(
                            text: "customer name",
                            color: AppColors.h,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: ExpandableComment(
                                    text: postModel.listOkComments?.comments[index].message?? "",
                                  ))),
                        ],
                      ),
                    ),
                  ),
                );

              }),
        ),
         bottomNavigationBar: Container(
           height: 130,
           padding: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
           decoration: BoxDecoration(
             color: AppColors.f,
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               NewText(text: "Add comment", color: AppColors.b),
               //SizedBox(height: 5,),
               CommentTextInput(
                 textController: commentController,
                 inputType: TextInputType.text,
                 inputAction: TextInputAction.done,
                 onSaved: (value) {},
                 validator: (value) {},
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   IconButton(
                     icon: Icon(
                       Icons.send,
                       color: AppColors.b,
                     ),
                     onPressed: () {},
                   ),
                 ],
               ),
             ],
           ),
         ),
       ),

    );
  }
}

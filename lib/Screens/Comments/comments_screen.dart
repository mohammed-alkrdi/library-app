import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Models/create_comment.dart';
import 'package:my_library/Providers/comments_provider.dart';
import 'package:my_library/Screens/Comments/expandable_comment.dart';
import 'package:my_library/Screens/Home/home_screen.dart';
import 'package:my_library/Widgets/comment_text_input.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';

import '../../Providers/create_comment_provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final formKey = GlobalKey<FormState>();
  late String comment;

  bool isFirstDependency = true;
  @override
  void didChangeDependencies() {
    if (isFirstDependency) {
      isFirstDependency = false;
      final args = ModalRoute.of(context)?.settings.arguments;
      print(ModalRoute.of(context)!.settings.arguments);
      final postModel = Provider.of<DataComments>(context, listen: false);
      postModel.getData(args as int);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("ok");
    final postModel = Provider.of<DataComments>(context);
    final args = ModalRoute.of(context)?.settings.arguments;
    var commentController = TextEditingController();
    Future<void> _createComment() async {
      String comment = commentController.text.trim();
      CommentRequest commentRequest = CommentRequest(
        message: comment,
        token: 'token',
      );
      var provider = Provider.of<DataComment>(context, listen: false);
      await provider.postData(commentRequest, args as int);
      if (provider.isBack) {

        Navigator.of(context).pushAndRemoveUntil(
             MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
      }
    }


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.f,
        title: NewText(
          text: "comments",
          fontsize: 24,
          color: Colors.black,
          alignment: Alignment.centerLeft,
        ),

      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              itemCount: postModel.listOkComments?.comments.length ?? 0,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0xFFe8e8e8),
                            blurRadius: 8.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, 0),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(5, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NewText(
                                text: postModel.listOkComments?.comments[index]
                                        .customer?.name ??
                                    "",
                                color: AppColors.h,
                              ),
                              /* NewText(
                                  text: postModel.listOkComments?.comments[index].createdAt ?? "",
                                  color: AppColors.h
                              ),*/
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                  child: ExpandableComment(
                            text: postModel
                                    .listOkComments?.comments[index].message ??
                                "",
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
            /*boxShadow: const [
              BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 8.0,
                  offset: Offset(0, 5)),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(5, 0),
              ),
            ],*/
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NewText(text: "Add comment", color: Colors.black),
              //SizedBox(height: 5,),
              Form(
                child: CommentTextInput(
                  textController: commentController,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  onSaved: (value) {
                    comment = value!;
                  },
                  validator: (value) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      _createComment();
                    },
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

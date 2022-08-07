import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Models/create_comment.dart';
import 'package:my_library/Providers/comments_provider.dart';
import 'package:my_library/Providers/delete_comment_provider.dart';
import 'package:my_library/Providers/update_comment_provider.dart';
import 'package:my_library/Screens/Comments/expandable_comment.dart';
import 'package:my_library/Screens/Home/home_screen.dart';
import 'package:my_library/Widgets/comment_text_input.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';

import '../../Models/update_comment_model.dart';
import '../../Providers/create_comment_provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final formKey = GlobalKey<FormState>();
  late String comment, updateComment;

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

    var updateCommentController = TextEditingController();

    Future<void> _updateCommentFunction(int commentIndex) async {
      String updateComment = updateCommentController.text.trim();
      UpdateComment updateCommentF =
          UpdateComment(message: updateComment, token: 'token');
      var provider = Provider.of<DataUpdateComment>(context, listen: false);
      await provider.putData(updateCommentF, commentIndex);
      if (provider.isBack) {
        Navigator.pop(context);
      }
    }
    Future<void> _deleteCommentFunction(int commentDeleteIndex) async {
      var provider = Provider.of<DataDeleteComment>(context, listen: false);
      await provider.deleteData(commentDeleteIndex);
      if (provider.isBack) {
        Navigator.pop(context);
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
                    height: 130,
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
                      borderRadius: BorderRadius.circular(10),
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
                                fontsize: 20,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ExpandableComment(
                                    text: postModel.listOkComments?.comments[index]
                                            .message ??
                                        "",
                                  ),
                                ),
                              ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              postModel.listOkComments?.comments[index]
                                          .myComment ??
                                      true
                                  ? IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Form(
                                              child: AlertDialog(
                                                title: NewText(
                                                  text: 'Add your edit comment',
                                                  color: Colors.black,
                                                ),
                                                content: TextFormField(
                                                  onSaved: (value) {
                                                     updateComment = value!;
                                                  },
                                                  controller:
                                                      updateCommentController,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Your new Comment"),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        child: Text(
                                                          'CANCEL',
                                                          style: TextStyle(
                                                              color: AppColors.b),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                          'OK',
                                                          style: TextStyle(
                                                              color: AppColors.b),
                                                        ),
                                                        onPressed: () {
                                                          _updateCommentFunction(
                                                              postModel
                                                                  .listOkComments
                                                                  ?.comments[
                                                                      index]
                                                                  .commentId as int);
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        CupertinoIcons.pencil,
                                        color: AppColors.b,
                                      ),
                                    )
                                  : Spacer(),
                              postModel.listOkComments?.comments[index]
                                          .myComment ??
                                      true
                                  ? IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Delete the comment"),
                                              content: Text(
                                                  "Are you sure you want to delete the comment?"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    _deleteCommentFunction(postModel.listOkComments?.comments[index].commentId as int);
                                                  },
                                                  child: Text(
                                                    'yes',
                                                    style: TextStyle(
                                                      color: AppColors.b,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'no',
                                                    style: TextStyle(
                                                      color: AppColors.b,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Colors.red,
                                      ),
                                    )
                                  : Spacer(),
                            ],
                          ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Models/create_comment.dart';
import 'package:my_library/Providers/comments_provider.dart';
import 'package:my_library/Screens/Comments/expandable_comment.dart';
import 'package:my_library/Widgets/comment_text_input.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Models/update_comment_model.dart';
import '../../Providers/theme_provider.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final formKey = GlobalKey<FormState>();
  late String comment, updateComment;

  //late var postModel;

  bool isFirstDependency = true;

  @override
  void didChangeDependencies() {
    if (isFirstDependency) {
      isFirstDependency = false;
      final args = ModalRoute.of(context)?.settings.arguments;
      final postModel = Provider.of<DataComments>(context, listen: false);
      postModel.getData(args as int);
    }
    super.didChangeDependencies();
  }

  Future<void> _createComment(
      TextEditingController commentController, int args) async {
    String comment = commentController.text.trim();
    CommentRequest commentRequest = CommentRequest(
      message: comment,
      token: 'token',
    );
    var provider = Provider.of<DataComments>(context, listen: false);
    await provider.postData(commentRequest, args);
  }

  Future<void> _updateCommentFunction(
      TextEditingController updateCommentController, int commentIndex) async {
    String updateComment = updateCommentController.text.trim();
    UpdateComment updateCommentF =
        UpdateComment(message: updateComment, token: 'token');
    var provider = Provider.of<DataComments>(context, listen: false);
    await provider.putData(updateCommentF, commentIndex);
  }

  Future<void> _deleteCommentFunction(int commentDeleteIndex) async {
    var provider = Provider.of<DataComments>(context, listen: false);
    await provider.deleteData(commentDeleteIndex);
  }

  @override
  Widget build(BuildContext context) {
    final postModelTheme = Provider.of<ThemeProvider>(
      context,
    );
    final postModel = Provider.of<DataComments>(context);
    final args = ModalRoute.of(context)?.settings.arguments;
    var commentController = TextEditingController();
    var updateCommentController = TextEditingController();
    print("ok");

    return Scaffold(
      backgroundColor: postModelTheme.isDark
          ? postModelTheme.darkTheme.backgroundColor
          : Color(0xFFe8e8e8),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: postModelTheme.isDark
              ? postModelTheme.darkTheme.primaryColor
              : postModelTheme.lightTheme.primaryColor,
        ),
        backgroundColor: postModelTheme.isDark
            ? postModelTheme.darkTheme.backgroundColor
            : Color(0xFFe8e8e8),
        title: NewText(
          text: AppLocalizations.of(context)!.comment,
          fontsize: 24,
          color: postModelTheme.isDark
              ? postModelTheme.darkTheme.primaryColor
              : postModelTheme.lightTheme.primaryColor,
          alignment: Alignment.center,
        ),
      ),
      body: Scaffold(
        backgroundColor: postModelTheme.isDark
            ? postModelTheme.darkTheme.backgroundColor
            : Color(0xFFe8e8e8),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
              key: ValueKey(DateTime.now().millisecondsSinceEpoch),
              itemCount: postModel.listOkComments?.comments.length ?? 0,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    height: 130,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: postModelTheme.isDark
                                ? postModelTheme.darkTheme.backgroundColor
                                : Color(0xFFe8e8e8),
                            blurRadius: 8.0,
                            offset: Offset(0, 5)),
                        BoxShadow(
                          color: postModelTheme.isDark
                              ? postModelTheme.darkTheme.backgroundColor
                              : postModelTheme.lightTheme.backgroundColor,
                          offset: Offset(-5, 0),
                        ),
                        BoxShadow(
                          color: postModelTheme.isDark
                              ? postModelTheme.darkTheme.backgroundColor
                              : postModelTheme.lightTheme.backgroundColor,
                          offset: Offset(5, 0),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: postModelTheme.isDark
                          ? postModelTheme.lightTheme.primaryColor
                          : postModelTheme.lightTheme.backgroundColor,
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
                                color: postModelTheme.isDark
                                    ? postModelTheme.darkTheme.primaryColor
                                    : postModelTheme.lightTheme.primaryColor,
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
                                  key: ValueKey(
                                      DateTime.now().millisecondsSinceEpoch),
                                  text: postModel.listOkComments
                                          ?.comments[index].message ??
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
                                                backgroundColor: postModelTheme.isDark
                                                    ? postModelTheme.darkTheme.backgroundColor
                                                    : postModelTheme.lightTheme.backgroundColor,
                                                title: NewText(
                                                  text: AppLocalizations.of(
                                                          context)!
                                                      .add_comment,
                                                  color: postModelTheme.isDark
                                                      ? postModelTheme.darkTheme.primaryColor
                                                      : postModelTheme.lightTheme.primaryColor,
                                                ),
                                                content: TextFormField(
                                                  onSaved: (value) {
                                                    updateComment = value!;
                                                  },
                                                  controller:
                                                      updateCommentController,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        AppLocalizations.of(
                                                                context)!
                                                            .new_comment,
                                                    suffixStyle: TextStyle(
                                                      color: postModelTheme.isDark
                                                          ? postModelTheme.darkTheme.primaryColor
                                                          : postModelTheme.lightTheme.primaryColor,
                                                    ),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      TextButton(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .cancel,
                                                          style: TextStyle(
                                                              color: postModelTheme.isDark
                                                                  ? postModelTheme.darkTheme.primaryColorDark
                                                                  : AppColors.b,

                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .ok,
                                                          style: TextStyle(
                                                              color:
                                                              postModelTheme.isDark
                                                                  ? postModelTheme.darkTheme.primaryColorDark
                                                                  : AppColors.b,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          _updateCommentFunction(
                                                              updateCommentController,
                                                              postModel
                                                                  .listOkComments
                                                                  ?.comments[
                                                                      index]
                                                                  .commentId as int);
                                                          Navigator.pop(
                                                              context);
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
                                        Icons.edit,
                                        color: postModelTheme.isDark
                                            ? postModelTheme.darkTheme.primaryColorDark
                                            : AppColors.b,
                                        size: 30,
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
                                              title: Text(
                                                  AppLocalizations.of(context)!
                                                      .delete_comment,
                                                style: TextStyle(
                                                    color: postModelTheme.isDark
                                                        ? postModelTheme.darkTheme.primaryColor
                                                        : postModelTheme.lightTheme.primaryColor,
                                                ),
                                              ),
                                              content: Text(
                                                  AppLocalizations.of(context)!
                                                      .are_you_sure_delete,
                                                style: TextStyle(
                                                    color: postModelTheme.isDark
                                                        ? postModelTheme.darkTheme.primaryColor
                                                        : postModelTheme.lightTheme.primaryColor,
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () async {
                                                    await _deleteCommentFunction(
                                                        postModel
                                                            .listOkComments
                                                            ?.comments[index]
                                                            .commentId as int);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .yes_f,
                                                    style: TextStyle(
                                                      color: postModelTheme.isDark
                                                          ? postModelTheme.darkTheme.primaryColorDark
                                                          : AppColors.b,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .no_f,
                                                    style: TextStyle(
                                                      color: postModelTheme.isDark
                                                          ? postModelTheme.darkTheme.primaryColorDark
                                                          : AppColors.b,
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
                                        size: 30,
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
          height: 140,
          padding: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
          decoration: BoxDecoration(
            color: postModelTheme.isDark
                ? postModelTheme.darkTheme.backgroundColor
                : AppColors.f,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NewText(
                  text: AppLocalizations.of(context)!.add_comment,
                  color: postModelTheme.isDark
                      ? postModelTheme.darkTheme.primaryColor
                      : postModelTheme.lightTheme.primaryColor,
              ),
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
                      color: postModelTheme.isDark
                          ? postModelTheme.darkTheme.primaryColor
                          : postModelTheme.lightTheme.primaryColor,
                    ),
                    onPressed: () {
                      _createComment(commentController, args as int);
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

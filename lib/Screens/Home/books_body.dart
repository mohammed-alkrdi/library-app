import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Providers/theme_provider.dart';
import 'package:my_library/Widgets/book_icons.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:provider/provider.dart';

import '../../Providers/books_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BooksBody extends StatefulWidget {
  const BooksBody({Key? key}) : super(key: key);

  @override
  State<BooksBody> createState() => _BooksBodyState();
}

class _BooksBodyState extends State<BooksBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  bool isFirstDependency = true;

  @override
  void didChangeDependencies() {
    if (isFirstDependency) {
      isFirstDependency = false;
      final postModel = Provider.of<DataBooks>(context, listen: false);
      postModel.getData();
      pageController.addListener(() {
        setState(() {
          _currPageValue = pageController.page!;
        });
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String ServerStorageUrl = "http://10.0.2.2:8000/storage/";
    final postModel = Provider.of<DataBooks>(context);
    final postModelTheme = Provider.of<ThemeProvider>(context,);
    return Column(
      children: [
        //slider section
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: postModel.listOkBooks?.books.length ?? 0,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //dots
        DotsIndicator(
          dotsCount: postModel.listOkBooks?.books.length ?? 1,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: postModelTheme.isDark
                  ? postModelTheme.darkTheme.primaryColorDark
                  : AppColors.b,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //Fav text
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              NewText(
                  text: AppLocalizations.of(context)!.popular_books,
                  color: postModelTheme.isDark
                      ? postModelTheme.darkTheme.primaryColor
                      : AppColors.i
              ),
              const SizedBox(
                width: 30,
              ),
              NewText(
                text: AppLocalizations.of(context)!.best_books,
                color: AppColors.a,
                fontsize: 10,
              ),
            ],
          ),
        ),
        //list of fav books
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: postModel.listOkBooks?.books.length ?? 0,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    //image section
                    GestureDetector(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: AppColors.b,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              ServerStorageUrl +
                                  (postModel.listOkBooks?.books[index].image
                                          ?.replaceAll("\\", "/") ??
                                      ""),
                            ),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(
                          context, 'BookDetailsScreen',
                          arguments: postModel.listOkBooks?.books[index].id),
                    ),
                    //text Container
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: postModelTheme.isDark
                              ? postModelTheme.darkTheme.backgroundColor
                              : postModelTheme.lightTheme.backgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NewText(
                                text:
                                    postModel.listOkBooks?.books[index].name ??
                                        "",
                                color: postModelTheme.isDark
                                    ? postModelTheme.darkTheme.primaryColor
                                    : AppColors.h,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              NewText(
                                text: postModel
                                        .listOkBooks?.books[index].writerBook ??
                                    "",
                                color: postModelTheme.isDark
                                    ? postModelTheme.darkTheme.primaryColor
                                    : AppColors.h,
                                alignment: Alignment.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              NewText(
                                text:
                                    '${postModel.listOkBooks?.books[index].price} \$',
                                color: postModelTheme.isDark
                                    ? postModelTheme.darkTheme.primaryColor
                                    : AppColors.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Future<void> _likeFunction(int likeIndex) async {
      var provider = Provider.of<DataBooks>(context, listen: false);
      await provider.getLikeData(likeIndex);
      //if (provider.isBack) {
      //Navigator.pop(context);
      //}
    }

    Future<void> _disLikeFunction(int disLikeIndex) async {
      var provider = Provider.of<DataBooks>(context, listen: false);
      await provider.getDisLikeData(disLikeIndex);
      //if (provider.isBack) {
      //Navigator.pop(context);
      //}
    }

    final String ServerStorageUrl = "http://10.0.2.2:8000/storage/";
    final postModel = Provider.of<DataBooks>(context);
    final postModelTheme = Provider.of<ThemeProvider>(context,);
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            child: Container(
              height: 220,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    ServerStorageUrl +
                        (postModel.listOkBooks?.books[index].image
                                ?.replaceAll("\\", "/") ??
                            ""),
                  ),
                ),
              ),
            ),
            onTap: () => Navigator.pushNamed(context, 'BookDetailsScreen',
                arguments: postModel.listOkBooks?.books[index].id),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: postModelTheme.isDark
                         ? postModelTheme.darkTheme.backgroundColor
                         : postModelTheme.lightTheme.backgroundColor,
                boxShadow:  [
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
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewText(
                      text: postModel.listOkBooks?.books[index].name ?? "",
                      color:postModelTheme.isDark
                              ? AppColors.f
                              : AppColors.h,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NewText(
                      text: postModel.listOkBooks?.books[index].writerBook ?? "",
                      color: postModelTheme.isDark
                          ? AppColors.f
                          : AppColors.h,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (postModel.listOkBooks!.books[index].isLikedByMe!)
                          BookIcons(
                            icon: CupertinoIcons.hand_thumbsup_fill,
                            text:
                                "${AppLocalizations.of(context)!.dis_like} ${postModel.listOkBooks?.books[index].likes?.length}",
                            color: AppColors.a,
                            fontSize: 10,
                            iconColor: AppColors.b,
                            onPressed: () {
                              _disLikeFunction(postModel
                                  .listOkBooks?.books[index].id as int);
                              //print(postModelDisLike.postDisLike?.like);
                            },
                          )
                        else
                          BookIcons(
                            icon: CupertinoIcons.hand_thumbsup,
                            text:
                                "${AppLocalizations.of(context)!.like} ${postModel.listOkBooks?.books[index].likes?.length}",
                            color: AppColors.a,
                            fontSize: 10,
                            iconColor: AppColors.b,
                            onPressed: () {
                              _likeFunction(postModel
                                  .listOkBooks?.books[index].id as int);
                              // print(postModel.listOkBooks?.);
                            },
                          ),
                        BookIcons(
                          icon: CupertinoIcons.chat_bubble_text_fill,
                          text: AppLocalizations.of(context)!.comment_i,
                          color: AppColors.a,
                          fontSize: 10,
                          iconColor: AppColors.d,
                          onPressed: () {
                            Navigator.pushNamed(context, 'CommentScreen',
                                arguments:
                                    postModel.listOkBooks?.books[index].id);
                          },
                        ),
                        BookIcons(
                          icon: Icons.category,
                          text: AppLocalizations.of(context)!.category_i,
                          color: AppColors.a,
                          fontSize: 10,
                          iconColor: AppColors.j,
                          onPressed: () {
                            Navigator.pushNamed(context, 'SearchScreen');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

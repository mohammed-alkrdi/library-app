import 'package:flutter/material.dart';
import 'package:my_library/Widgets/book_icons.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'data_search.dart';

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

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //dots
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.b,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        //Fav text
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              NewText(text: "Favorite", color: AppColors.i),
              SizedBox(width: 30,),
              NewText(text: "your favorite books", color: AppColors.a, fontsize: 10,),
            ],
          ),
        ),
        //list of fav books
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    //image section
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.b,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/images/124412.webp",
                          ),
                        ),
                      ),
                    ),
                    //text Container
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NewText(
                                text: "title",
                                color: AppColors.h,
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              NewText(
                                text: 'author',
                                color: AppColors.h,
                                alignment: Alignment.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              NewText(
                                text: 'price',
                                color: AppColors.h,
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
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/Library Backgrounds.jpeg"
                ),
              ),
              //color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 130,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
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
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewText(
                      text: "title",
                      color: AppColors.h,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NewText(
                      text: 'author',
                      color: AppColors.h,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BookIcons(
                          icon: Icons.favorite_border,
                          text: "like",
                          color: AppColors.a,
                          fontSize: 10 ,
                          iconColor: AppColors.d,
                          onPressed: () {},
                        ),
                        BookIcons(
                          icon: Icons.comment,
                          text: "comments",
                          color: AppColors.a,
                          fontSize: 10,
                          iconColor: AppColors.b,
                          onPressed: () {
                            Navigator.pushNamed(context, 'CommentScreen');
                          },
                        ),
                        BookIcons(
                          icon: Icons.category,
                          text: "category",
                          color: AppColors.a,
                          fontSize: 10,
                          iconColor: AppColors.j,
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
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

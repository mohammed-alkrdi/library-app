
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';

import '../Providers/book_category_provider.dart';

class CategoryBook extends StatefulWidget {
  const CategoryBook({Key? key}) : super(key: key);

  @override
  State<CategoryBook> createState() => _CategoryBookState();
}

class _CategoryBookState extends State<CategoryBook> {
  bool isFirstDependency = true;
  @override
  void didChangeDependencies() {
    if (isFirstDependency) {
      isFirstDependency = false;
      final args = ModalRoute.of(context)?.settings.arguments;
      final postModel = Provider.of<DataCategoryWithBooks>(context, listen: false);
      postModel.getData(args as int);

    }
    super.didChangeDependencies();

  }
  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataCategoryWithBooks>(context);
    final String ServerStorageUrl = "http://10.0.2.2:8000/storage/";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context), 
                      icon: Icon(CupertinoIcons.arrow_left, color: AppColors.i,),
                  ),
                  NewText(
                      text: "Book Category",
                      color: AppColors.i,
                      fontsize: 24,
                      alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
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
                              color: AppColors.b,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  ServerStorageUrl +
                                      (postModel.listOkBooks?.books[index].imageUrl
                                          ?.replaceAll("\\", "/") ??
                                          ""),
                                ),
                              ),
                            ),
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, 'BookDetailsScreen', arguments: postModel.listOkBooks?.books[index].id),
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
                              color: Colors.white,
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
                                    color: AppColors.h,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  NewText(
                                    text: postModel
                                        .listOkBooks?.books[index].author ??
                                        "",
                                    color: AppColors.h,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  NewText(
                                    text: '${postModel.listOkBooks?.books[index].price} \$',
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
        ),
      ),
    );
  }
}

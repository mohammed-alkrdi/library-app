import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Providers/search_provider.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Providers/category_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isFirstDependency = true;

  @override
  void didChangeDependencies() {
    if (isFirstDependency) {
      isFirstDependency = false;
      final postModel = Provider.of<DataCategory>(context, listen: false);
      postModel.getData();
      //final searchPostModel = Provider.of<DataSearch>(context, listen: false);
      //searchPostModel.getData(search);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final String ServerStorageUrl = "http://10.0.2.2:8000/storage/";
    final postModel = Provider.of<DataCategory>(context);
    final searchPostModel = Provider.of<DataSearch>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                            AppLocalizations.of(context)!.localeName == "en"
                                ? CupertinoIcons.arrow_left
                                : CupertinoIcons.arrow_right,
                            color: AppColors.i),
                        onPressed: () {
                          Navigator.pushNamed(context, 'HomeScreen');
                        },
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppLocalizations.of(context)!.search_hint,
                            hintStyle: TextStyle(
                              color: AppColors.a,
                            ),
                          ),
                          onChanged: (value) {
                            final searchPostModel =
                                Provider.of<DataSearch>(context, listen: false);
                            searchPostModel.getData(value);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(CupertinoIcons.search, color: AppColors.a),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: NewText(
                text: AppLocalizations.of(context)!.category_search_screen,
                color: AppColors.i,
                alignment: AppLocalizations.of(context)!.localeName == "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: List.generate(
                      postModel.listOkCategory?.category.length ?? 0,
                      (index) {
                        return GestureDetector(
                          child: FilterChip(
                            label: Text(
                              postModel.listOkCategory?.category[index].name ??
                                  "",
                            ),
                            labelStyle: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: Colors.grey[350]?.withOpacity(0.4),
                            onSelected: (isSelected) {
                              setState(() {
                                Navigator.pushNamed(context, "BookCategory",
                                    arguments: postModel
                                        .listOkCategory?.category[index].id);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: NewText(
                  text: AppLocalizations.of(context)!.search_result,
                  color: AppColors.i,
                alignment: AppLocalizations.of(context)!.localeName == "en" ? Alignment.centerLeft : Alignment.centerRight,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: searchPostModel.listOkBooks?.books.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                                      (searchPostModel.listOkBooks?.books[index]
                                              .image
                                              ?.replaceAll("\\", "/") ??
                                          ""),
                                ),
                              ),
                            ),
                          ),
                          onTap: () => Navigator.pushNamed(
                              context, 'BookDetailsScreen',
                              arguments:
                                  searchPostModel.listOkBooks?.books[index].id),
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
                                    text: searchPostModel
                                            .listOkBooks?.books[index].name ??
                                        "",
                                    color: AppColors.h,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  NewText(
                                    text: searchPostModel
                                            .listOkBooks?.books[index].writerBook ??
                                        "",
                                    color: AppColors.h,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  NewText(
                                    text:
                                        '${searchPostModel.listOkBooks?.books[index].price} \$',
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

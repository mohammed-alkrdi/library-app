import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Widgets/app_icons.dart';
import 'package:my_library/Screens/Details/expandable_text.dart';
import 'package:my_library/Widgets/rounded_button.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../Models/buy_model.dart';
import '../../Providers/book_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool isFirstDependency = true;
  var progressString = "";
  final String ServerStorageUrl = "http://10.0.2.2:8000/storage/";


  @override
  void didChangeDependencies() {
    if (isFirstDependency) {
      isFirstDependency = false;
      final args = ModalRoute.of(context)?.settings.arguments;
      print(ModalRoute.of(context)!.settings.arguments);
      final postModel = Provider.of<DataBook>(context, listen: false);
      postModel.getData(args as int);
    }
    super.didChangeDependencies();
  }
  Future<void> _bookRequest() async {
    final args = ModalRoute.of(context)?.settings.arguments;
    Buy buy = Buy(
      bookId: args as int,
    );
    var provider = Provider.of<DataBook>(context, listen: false);
    await provider.postData(buy);
  }

  Future<void> _bookStatus() async {
    final args = ModalRoute.of(context)?.settings.arguments;
    var provider = Provider.of<DataBook>(context, listen: false);
    await provider.getRequestData(args as int);
  }
  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      final postModel = Provider.of<DataBook>(context, listen: false);
      String file = postModel.postBook?.file?.substring(19,62)  ??  "";
      file =ServerStorageUrl+'${file}'.replaceAll("\\", "/");
      print("wow ${file}");
      await dio.download(
          file,
          "${dir.path}/myFile.pdf",
          onReceiveProgress: (rec,total) {
            print("Rec: $rec, Total: $total");

            setState((){
              progressString = ((rec/total)*100).toStringAsFixed(0) + "%";
            });
          });
    } catch (e) {

      print("errore");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ok");
    //print(postModel.postStatus?.status);
    final postModel = Provider.of<DataBook>(context);
    if (postModel == null || postModel.postBook == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            //background image
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        ServerStorageUrl +
                            (postModel.postBook?.image
                                    ?.replaceAll("\\", "/") ??
                                ""),
                      ),
                    ),
                  ),
                )),
            //texts
            Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppIcons(
                    icon: CupertinoIcons.chevron_back,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            //books details
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        NewText(
                          text: postModel.postBook?.name ?? "",
                          color: AppColors.i,
                          fontsize: 24,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        NewText(
                          text: postModel.postBook?.writerBook ?? "",
                          color: AppColors.a,
                          fontsize: 12,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    NewText(
                      text: '${postModel.postBook?.price} \$',
                      color: AppColors.i,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    NewText(
                      text: AppLocalizations.of(context)!.descriptions,
                      color: AppColors.i,
                      fontsize: 24,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableText(
                      text: postModel.postBook?.bookInfo ?? "",
                    ))),
                  ],
                ),
              ),
            ),
            //expandable text
          ],
        ),
        bottomNavigationBar: Container(
          height: 100,
          padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: AppColors.f,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RoundedButton(
                    onPressed: () {
                      _bookRequest();
                    },
                    text: AppLocalizations.of(context)!.buy,
                    sizeHeight: 100,
                    sizeWidth: 80,
                    color: AppColors.d,
                    textColor: Colors.white,
                  ),

              RoundedButton(
                key: ValueKey(progressString),
                onPressed: () {
                  downloadFile();
                },
                text: AppLocalizations.of(context)!.download + progressString,
                sizeHeight: 100,
                sizeWidth: 200,
                color: AppColors.b,
                textColor: Colors.white,
              ),
                ],
          ),
        ),
      );
    }
  }
}

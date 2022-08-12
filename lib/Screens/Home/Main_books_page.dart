import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';
import 'package:my_library/colors.dart';
import 'package:provider/provider.dart';
import '../../Providers/theme_provider.dart';
import 'books_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class MainBooksPage extends StatefulWidget {
  const MainBooksPage({Key? key}) : super(key: key);

  @override
  State<MainBooksPage> createState() => _MainBooksPageState();
}

class _MainBooksPageState extends State<MainBooksPage> {




  @override
  Widget build(BuildContext context) {
    final postModelTheme = Provider.of<ThemeProvider>(context,);
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 35, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NewText(
                    text: AppLocalizations.of(context)!.search,
                    color: postModelTheme.isDark
                        ? postModelTheme.darkTheme.primaryColorDark
                        : AppColors.b,
                    fontsize: 20,
                    alignment: Alignment.center,
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: postModelTheme.isDark
                          ? postModelTheme.darkTheme.primaryColorDark
                          : AppColors.b,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.pushNamed(context, 'SearchScreen');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: BooksBody(),
          )),
        ],
      ),
    );
  }
}

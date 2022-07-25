import 'package:flutter/material.dart';
import 'package:my_library/Widgets/text.dart';

import 'app_icons.dart';

class AccountWidget extends StatelessWidget {
  AppIcons appIcons;
  NewText newText;

  AccountWidget({Key? key, required this.appIcons, required this.newText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: const Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        children: [
          appIcons,
          const SizedBox(width: 20,),
          newText,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

import '../utils/text.dart';

class appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          boldText(
            color: AppColors.primary,
            size: 20,
            text: 'Tech',
          ),
          midileText(
            color: AppColors.lightwhite,
            size: 20,
            text: 'New',
          )
        ]),
      ),
    );
  }
}

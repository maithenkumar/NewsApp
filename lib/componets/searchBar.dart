import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/funnctions.dart';
import '../utils/colors.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});
  static TextEditingController searchcontroler =
      TextEditingController(text: "");

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.drakgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    controller: SearchBar.searchcontroler,
                    decoration: InputDecoration(
                        helperText: "search a keyword or a phrase",
                        helperStyle: GoogleFonts.lato(),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.drakgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}

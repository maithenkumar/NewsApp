// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

import '../utils/text.dart';
import 'bottomsheet.dart';

class NewsBox extends StatelessWidget {
  final String imageurl, title, description, url, time;
  const NewsBox({
    Key? key,
    required this.url,
    required this.imageurl,
    required this.title,
    required this.description,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        showMyBottonSheet(context, title, description, imageurl, url);
      },
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
          width: w,
          color: AppColors.black,
          child: Row(children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage(imageurl), fit: BoxFit.cover)),
            ),
            Expanded(
              child: Column(children: [
                boldText(text: title, size: 18, color: Colors.white),
                midileText(
                  text: time,
                  color: Color.fromARGB(255, 176, 169, 169),
                  size: 10,
                )
              ]),
            ),
          ])),
    );
  }
}

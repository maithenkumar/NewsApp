// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/text.dart';

class BottomSheetImage extends StatelessWidget {
  const BottomSheetImage({
    Key? key,
    required this.title,
    required this.imageurl,
  }) : super(key: key);
  final String imageurl, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          Container(
            // ignore: prefer_const_constructors
            foregroundDecoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.topRight,
                end: Alignment.topCenter,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: NetworkImage(imageurl), fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: boldText(
                  color: Colors.white,
                  size: 18,
                  text: title,
                ),
              ))
        ],
      ),
    );
  }
}

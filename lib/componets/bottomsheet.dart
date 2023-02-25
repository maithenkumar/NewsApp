import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:url_launcher/url_launcher.dart";

import "../utils/text.dart";
import "compnents.dart";

void showMyBottonSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      elevation: 20,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return MyBottonSheetLayout(
            title: title,
            description: description,
            imageurl: imageurl,
            url: url);
      });
}

class MyBottonSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottonSheetLayout(
      {super.key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(
            imageurl: imageurl,
            title: title,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: midileText(text: description, size: 16, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Read fulll Article",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(url);
                    },
                  style: GoogleFonts.lato(color: Colors.blue.shade400))
            ])),
          )
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.platformDefault);
  } else {
    throw "could not launch $url";
  }
}

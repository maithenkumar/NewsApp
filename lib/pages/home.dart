import 'package:flutter/material.dart';

import '../backend/funnctions.dart';

import '../componets/newsBox.dart';
import '../componets/searchBar.dart';
import '../utils/colors.dart';
import '../utils/text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
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
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) => NewsBox(
                          url: snapshot.data![index]["url"],
                          // ignore: prefer_if_null_operators
                          imageurl: snapshot.data![index]["urlToImage"] != null
                              ? snapshot.data![index]["urlToImage"]
                              : "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-vector%2Fcaution-exclamation-mark-white-red-260nw-1055269061.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Ferror&tbnid=NyyEim_FKOz1jM&vet=12ahUKEwj47IyY_a_9AhXd1jgGHasZAS0QMygEegUIARDtAQ..i&docid=IZbA2KT5EihWnM&w=260&h=280&q=error%20image&ved=2ahUKEwj47IyY_a_9AhXd1jgGHasZAS0QMygEegUIARDtAQ",
                          title: snapshot.data![index]["title"],
                          description:
                              snapshot.data![index]["description"].toString(),
                          time: snapshot.data![index]["publishedAt"])),
                    );
                  } else if (snapshot.hasData) {
                    return Container();
                  }
                  return Center();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

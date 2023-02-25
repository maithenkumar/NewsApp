import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../componets/searchBar.dart';
import '../utils/key.dart';

Future<List> fetchnews() async {
  final responce = await http.get(
    Uri.parse(

        "https://newsapi.org/v2/top-headlines?country=us&category=technology&paseSize=100&apiKey=9363cdac554a47aba5ee03037f8b059a"+"&q="+SearchBar.searchcontroler.text));
       Map result =jsonDecode(responce.body);
       print("fetched");
       return (result["articles"]);

}

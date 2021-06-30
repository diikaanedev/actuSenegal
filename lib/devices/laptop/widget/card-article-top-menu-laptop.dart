import 'package:actu/devices/laptop/widget/card-new-menu-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

class CardArticleTopMenuLaptop extends StatefulWidget {
  @override
  _CardArticleTopMenuLaptopState createState() =>
      _CardArticleTopMenuLaptopState();
}

class _CardArticleTopMenuLaptopState extends State<CardArticleTopMenuLaptop> {
  late Size size;
  List<Article> listeM = appState.listePost
      .where((element) =>
          element.categorie.toLowerCase() != 'Breaking News'.toLowerCase() &&
          element.categorie.toLowerCase() != 'Découverte'.toLowerCase() &&
          element.categorie.toLowerCase() != 'Redaction'.toLowerCase() &&
          element.categorie.toLowerCase() != 'Investigation'.toLowerCase())
      .toList();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .68,
      width: size.width * .45,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * .15,
            width: size.width * .45,
            // color: Colors.red,
            child: Row(
              children: [
                CardNewMenuLaptop(
                  article: listeM[0],
                ),
                CardNewMenuLaptop(
                  article: listeM[1],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * .15,
            width: size.width * .45,
            // color: Colors.red,
            child: Row(
              children: [
                CardNewMenuLaptop(
                  article: listeM[2],
                ),
                CardNewMenuLaptop(
                  article: listeM[3],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * .15,
            width: size.width * .45,
            // color: Colors.red,
            child: Row(
              children: [
                CardNewMenuLaptop(
                  article: listeM[4],
                ),
                CardNewMenuLaptop(
                  article: listeM[5],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: size.height * .15,
            width: size.width * .45,
            // color: Colors.red,
            child: Row(
              children: [
                CardNewMenuLaptop(
                  article: listeM[6],
                ),
                CardNewMenuLaptop(
                  article: listeM[7],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

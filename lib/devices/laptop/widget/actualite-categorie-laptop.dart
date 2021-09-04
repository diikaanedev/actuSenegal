import 'package:actu/devices/laptop/widget/widget-article-tag-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

class ActualieCategorieLaptop extends StatefulWidget {
  @override
  _ActualieCategorieLaptopState createState() =>
      _ActualieCategorieLaptopState();
}

class _ActualieCategorieLaptopState extends State<ActualieCategorieLaptop> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
                left: constraints.maxWidth * .05,
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .9,
                  child: GridView.count(
                    crossAxisCount: 5,
                    children: getList(),
                  ),
                ))
          ],
        ),
      );

  List<Widget> getList() {
    List<Widget> listes = [];

    List<Article> listeArticle = appState.listePost
        .where((element) => element.tag == appState.titreCategorie)
        .toList();

    listeArticle = listeArticle
        .where((element) =>
            element.categorie.toLowerCase() != 'Ênquete'.toLowerCase())
        .toList();
    listeArticle = listeArticle
        .where((element) =>
            element.categorie.toLowerCase() != 'Reportage'.toLowerCase())
        .toList();

    listeArticle = listeArticle
        .where((element) =>
            element.categorie.toLowerCase() != 'Scandales'.toLowerCase())
        .toList();

    listeArticle = listeArticle
        .where((element) =>
            element.categorie.toLowerCase() != 'Direct Actu221'.toLowerCase())
        .toList();

    for (var item in listeArticle) {
      listes.add(
        WidgetArticleLaptop(
          article: item,
        ),
      );
    }

    return listes;
  }
}

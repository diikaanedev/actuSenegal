import 'package:actu/devices/laptop/widget/card-dialog-tag-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

getArticleSameCategorieTag({required Article article, Size? size}) {
  List<Widget> liste = [];
  List<Article> listeArticle = appState.listePost
      .where((element) => element.tag == article.tag)
      .toList()
      .reversed
      .toList();

  for (var item in listeArticle
      .where((element) => element.categorie != 'Breaking News')) {
    liste.add(Container(
        height: size!.height * .35, child: CardDialogTagLaptop(article: item)));
  }
  print(liste);
  return liste;
}

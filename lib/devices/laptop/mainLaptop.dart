import 'package:actu/devices/laptop/screen/categorie-laptop.dart';
import 'package:actu/devices/laptop/screen/categorie-scandale-decouverte-ohter.dart';
import 'package:actu/devices/laptop/screen/free-senegal.dart';
import 'package:actu/devices/laptop/screen/home-laptop.dart';
import 'package:actu/devices/laptop/screen/read-article-laptop.dart';
import 'package:actu/devices/laptop/screen/tag-categorie-laptop.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

MaterialApp mainLatop() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => appState.screen == 0
          ? HomeLaptop()
          : appState.screen == 1
              ? CategorieLaptop()
              : appState.screen == 2
                  ? CategorieScandaleDecouverteOther()
                  : appState.screen == 3
                      ? FreeSenegalLaptop()
                      : appState.screen == 4
                          ? TagCategorieLaptop()
                          : Container(),
      '/${appState.article.id}': (context) => ReadArticleLaptop(),
    },
    initialRoute: '/',
  );
}

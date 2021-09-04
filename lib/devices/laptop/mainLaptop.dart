// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:actu/devices/laptop/screen/categorie-laptop.dart';
import 'package:actu/devices/laptop/screen/categorie-scandale-decouverte-ohter.dart';
import 'package:actu/devices/laptop/screen/free-senegal.dart';
import 'package:actu/devices/laptop/screen/home-laptop.dart';
import 'package:actu/devices/laptop/screen/read-article-laptop.dart';
import 'package:actu/devices/laptop/screen/tag-categorie-laptop.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

var url = window.location.href;
MaterialApp mainLatop() {
  print('url => $url');
  if (url.split('/').last == '') {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => "Actu221 | L'éssentiel de l'infos ",
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
        "/${appState.article.id}": (context) => ReadArticleLaptop(),
      },
      onUnknownRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => ReadArticleLaptop());
      },
      initialRoute: '/',
    );
  } else {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => "Actu221 | L'éssentiel de l'infos ",
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
        "/${url.split('/').last}": (context) => ReadArticleLaptop(),
      },
      onUnknownRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => ReadArticleLaptop());
      },
      initialRoute: '/',
    );
  }
}

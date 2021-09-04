import 'dart:html';

import 'package:actu/devices/phone/screen/categorie-decouverte.dart';
import 'package:actu/devices/phone/screen/categorie-phone.dart';
import 'package:actu/devices/phone/screen/free-senegal-phone.dart';
import 'package:actu/devices/phone/screen/home-phone.dart';
import 'package:actu/devices/phone/screen/read-article-phone.dart';
import 'package:actu/devices/phone/screen/tag-categorie-phone.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

var url = window.location.href;

MaterialApp mainPhone() {
  if (url.split('/').last == '') {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Actu221',
      theme: ThemeData(fontFamily: 'Lato'),
      onGenerateTitle: (context) => "Actu221 | L'éssentiel de l'infos ",
      initialRoute: '/',
      onUnknownRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute<void>(
            settings: settings,
            builder: (BuildContext context) => ReadArticlePhone());
      },
      routes: {
        '/': (context) => appState.screen == 0
            ? HomePhone()
            : appState.screen == 1
                ? CategoriePhone()
                : appState.screen == 2
                    ? CategorieDecouverteInvestigationScandalesPhone()
                    : appState.screen == 3
                        ? FreeSenegal()
                        : appState.screen == 4
                            ? TagCategoriePhone()
                            : Container(),
        "/${appState.article.id}": (context) => ReadArticlePhone(),
      },
    );
  } else {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => "Actu221 | L'éssentiel de l'infos ",
      routes: {
        '/': (context) => appState.screen == 0
            ? HomePhone()
            : appState.screen == 1
                ? CategoriePhone()
                : appState.screen == 2
                    ? CategorieDecouverteInvestigationScandalesPhone()
                    : appState.screen == 3
                        ? FreeSenegal()
                        : appState.screen == 4
                            ? TagCategoriePhone()
                            : Container(),
        "/${url.split('/').last}": (context) => ReadArticlePhone(),
      },
      onUnknownRoute: (settings) {
        print(settings.name);
        return MaterialPageRoute<void>(
            settings: settings, builder: (BuildContext context) => Container());
      },
      initialRoute: '/',
    );
  }
}

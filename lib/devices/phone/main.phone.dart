import 'package:actu/devices/phone/screen/categorie-decouverte.dart';
import 'package:actu/devices/phone/screen/categorie-phone.dart';
import 'package:actu/devices/phone/screen/free-senegal-phone.dart';
import 'package:actu/devices/phone/screen/home-phone.dart';
import 'package:actu/devices/phone/screen/tag-categorie-phone.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

MaterialApp mainPhone() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Actu221',
    theme: ThemeData(fontFamily: 'Lato'),
    initialRoute: '/',
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
    },
  );
}

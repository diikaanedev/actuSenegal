import 'dart:convert';

import 'package:actu/devices/phone/widget/card-categorie-les-autres-phone.dart';
import 'package:actu/devices/phone/widget/card-categorie-les-plus-lus-phone.dart';
import 'package:actu/devices/phone/widget/card-categorie-recent.dart';
import 'package:actu/devices/phone/widget/footer-phone.dart';
import 'package:actu/devices/phone/widget/menu-top-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:flutter/material.dart';

late _CategoriePhoneState categoriePhoneState;

class CategoriePhone extends StatefulWidget {
  @override
  _CategoriePhoneState createState() {
    categoriePhoneState = _CategoriePhoneState();
    return categoriePhoneState;
  }
}

class _CategoriePhoneState extends State<CategoriePhone> {
  bool isShowMenu = false;
  late Size size;
  bool chargement = false;

  // List<KeyWords> keyWords = [];

  @override
  void initState() {
    super.initState();
    getKeyWor();
  }

  getKeyWor() async {
    setState(() {
      chargement = true;
    });
    WebByDii.get(url: 'mots').then((response) {
      var data = json.decode(response.body);
      setState(() {
        chargement = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: colorSecondaire,
          ),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: size.height * .07,
                width: size.width,
                color: Colors.white,
                child: Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowMenu = !isShowMenu;
                        });
                      },
                      child: Container(
                        width: size.width * .3,
                        // color: colorPrimaire,
                        child: Row(
                          children: [
                            Text(
                              'MENU',
                              style: TextStyle(
                                  fontSize: 22,
                                  // fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Icon(
                              Icons.arrow_circle_down_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        appState.setState(() {
                          appState.screen = 0;
                        });
                      },
                      child: Container(
                        width: size.width * .6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // color: Color.fromRGBO(229, 229, 229, 1),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/logo_solgan.png'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )),
          Positioned(
              top: size.height * .07,
              child: Container(
                height: size.height,
                width: size.width,
                // color: colorPrimaire,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Container(
                            // width: size.width * .17,
                            child: Text(
                              appState.titreCategorie,
                              style: TextStyle(
                                  color: colorPrimaire,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Container(
                    //   height: size.height * .05,
                    //   width: size.width,
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: size.width * .05,
                    //       ),
                    //       Container(
                    //         height: 15,
                    //         width: 15,
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     'assets/images/icon_double_foward.png'))),
                    //       ),
                    //       SizedBox(
                    //         width: 2,
                    //       ),
                    //       Text(
                    //         'RÉCENT',
                    //         style: TextStyle(
                    //             fontSize: 20, fontWeight: FontWeight.bold),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    Container(
                      height: size.height,
                      width: size.width,
                      child: GridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 1,
                        padding: const EdgeInsets.all(4.0),
                        crossAxisSpacing: 4.0,
                        children: getListRecent(),
                        physics: BouncingScrollPhysics(),
                      ),
                    ),
                    // Container(
                    //   height: size.height * .05,
                    //   width: size.width,
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: size.width * .05,
                    //       ),
                    //       Container(
                    //         height: 15,
                    //         width: 15,
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     'assets/images/icon_double_foward.png'))),
                    //       ),
                    //       SizedBox(
                    //         width: 2,
                    //       ),
                    //       Text(
                    //         'LES PLUS LUS',
                    //         style: TextStyle(
                    //             fontSize: 20, fontWeight: FontWeight.bold),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: size.height * .3,
                    //   width: size.width,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     physics: BouncingScrollPhysics(),
                    //     children: getListLesPlusLu(),
                    //   ),
                    // ),
                    // Container(
                    //   height: size.height * .05,
                    //   width: size.width,
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: size.width * .05,
                    //       ),
                    //       Container(
                    //         height: 15,
                    //         width: 15,
                    //         decoration: BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     'assets/images/icon_double_foward.png'))),
                    //       ),
                    //       SizedBox(
                    //         width: 2,
                    //       ),
                    //       Text(
                    //         'LES AUTRES',
                    //         style: TextStyle(
                    //             fontSize: 20, fontWeight: FontWeight.bold),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: size.height * .55,
                    //   width: size.width,
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         width: 12,
                    //       ),
                    // Container(
                    //   width: size.width - 12,
                    //   height: size.height * .55,
                    //   child: GridView.count(
                    //     crossAxisCount: 2,
                    //     childAspectRatio: 2,
                    //     mainAxisSpacing: 12,
                    //     padding: const EdgeInsets.all(4.0),
                    //     crossAxisSpacing: 4.0,
                    //     children: getListLesAutres(),
                    //     physics: BouncingScrollPhysics(),
                    //   ),
                    // ),
                    //     ],
                    //   ),
                    // ),
                    FooterPhone(),
                    SizedBox(
                      height: size.height * .1,
                    )
                  ],
                  physics: BouncingScrollPhysics(),
                ),
              )),
          isShowMenu
              ? Positioned(
                  top: size.height * .07,
                  child: Container(
                    height: size.height * .8,
                    width: size.width * .9,
                    child: MenuTopPhone(),
                  ))
              : Container()
        ],
      ),
    );
  }

  // List<Widget> getListKeyWord() {
  //   List<Widget> liste = [];
  //   for (var item in keyWords) {
  //     liste.add(
  //       WordKeyPhone(
  //         titre: item.mots,
  //       ),
  //     );
  //   }
  //   // liste.add(CardPlusTablet());
  //   return liste;
  // }

  List<Widget> getListRecent() {
    List<Widget> listes = [];

    List<Article> listeArticle = appState.listePost
        .where((element) => element.categorie == appState.titreCategorie)
        .toList();

    print(listeArticle.length);

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

    print(listeArticle.length);

    List<Widget> liste = [];
    for (var item in listeArticle) {
      liste.add(
        CardCategorieLesPlusLustPhone(
          article: item,
        ),
      );
    }

    return liste;
  }

  List<Widget> getListLesPlusLu() {
    List<Widget> liste = [];
    if (appState.titreCategorie.toLowerCase() == 'actualites') {
      for (var i = 8; i < 16; i++) {
        liste.add(CardCategorieLesPlusLustPhone(
          article: appState.listePost[i],
        ));
      }
    } else {
      for (var i = 8; i < 16; i++) {
        liste.add(CardCategorieLesPlusLustPhone(
          article: appState.listePost
              .where((element) =>
                  element.categorie.toLowerCase() ==
                  appState.titreCategorie.toLowerCase())
              .toList()[i],
        ));
      }
    }

    return liste;
  }

  List<Widget> getListLesAutres() {
    List<Widget> liste = [];
    if (appState.titreCategorie.toLowerCase() == 'actualites') {
      for (var i = 16; i < 24; i++) {
        liste.add(CardCategorieLesAutresPhone(
          article: appState.listePost.toList()[i],
        ));
      }
    } else {
      for (var i = 16; i < 24; i++) {
        liste.add(CardCategorieLesAutresPhone(
          article: appState.listePost
              .where((element) =>
                  element.categorie.toLowerCase() ==
                  appState.titreCategorie.toLowerCase())
              .toList()
              .reversed
              .toList()[i],
        ));
      }
    }

    return liste;
  }
}

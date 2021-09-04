import 'dart:convert';
import 'dart:html';

import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/devices/phone/widget/article-text-laptop.dart';
import 'package:actu/devices/phone/widget/card-article-categorie-tablet.dart';
import 'package:actu/devices/phone/widget/card-titre-phone.dart';
import 'package:actu/devices/phone/widget/menu-top-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadArticlePhone extends StatefulWidget {
  const ReadArticlePhone({Key? key}) : super(key: key);

  @override
  _ReadArticlePhoneState createState() => _ReadArticlePhoneState();
}

class _ReadArticlePhoneState extends State<ReadArticlePhone> {
  late Size size;
  bool isShowMenu = false;
  bool chargement = true;
  late Article article;
  var url = window.location.href;
  bool isValid = true;

  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    if (appState.article.id == url.split('/').last) {
      setState(() {
        chargement = false;
        article = appState.article;
      });
    } else {
      await FirebaseFirestore.instance
          .collection('publicite')
          .get()
          .then((value) {
        appState.setState(() {
          appState.listePub = PubActu.fromFireBase(value.docs);
        });
      });
      if (url.split('/').last != '') {
        await WebByDii.get(url: 'posts').then((response) {
          var data = json.decode(response.body);
          print('taille => ${data['data'].length}');
          appState.setState(() {
            appState.listePost = Article.fromJson(data);
            if (appState.listePost
                    .where((element) => element.id == url.split('/').last)
                    .length >
                0) {
              appState.article = appState.listePost
                  .where((element) => element.id == url.split('/').last)
                  .first;
            } else {
              setState(() {
                isValid = false;
              });
            }
          });
        });
        setState(() {
          article = appState.article;
          chargement = false;
        });
        // WebByDii.get(url: 'posts/${url.split('/').last}').then((response) {
        //   var data = json.decode(response.body);
        //   print(data['data']['id']);
        //   setState(() {
        //     article = Article.fromJsonOne(data);
        //     appState.setState(() {
        //       appState.article = article;
        //     });
        //   });

        // });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return isValid
        ? Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              elevation: 0,
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
                      color: Color.fromRGBO(255, 255, 255, 1),
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
                                        // fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                  Icon(
                                    Icons.arrow_circle_down_outlined,
                                    size: 30,
                                    color: Color.fromRGBO(0, 0, 0, 1),
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
                              Navigator.pushNamed(context, "/");
                            },
                            child: Container(
                              width: size.width * .6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Color.fromRGBO(229, 229, 229, 1),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/logo_solgan.png'),
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
                      child: chargement
                          ? Center(
                              child: Container(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      colorPrimaire),
                                ),
                              ),
                            )
                          : AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              insetPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 8),
                              elevation: 0,
                              title: TitreTextLaptop(titre: article.titre),
                              content: Container(
                                height: size.height * .9,
                                width: size.width * 1.2,
                                color: colorSecondaire,
                                child: Container(
                                  height: size.height * 1,
                                  width: size.width,
                                  child: ListView(
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      Container(
                                        height: size.height * .15,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  appState.listePub.first.url2,
                                                ),
                                                fit: BoxFit.fitWidth)),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        height: size.height * 0.25,
                                        width: size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Spacer(),
                                            // Container(
                                            //   width: size.width * .1,
                                            //   child: TitreTextLaptop(titre: 'PUB REGIE'),
                                            // ),
                                            Container(
                                              width: size.width * .8,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          article.urlPhoto),
                                                      fit: BoxFit.contain)),
                                            ),
                                            Spacer(),

                                            // Container(
                                            //   width: size.width * .1,
                                            //   child: TitreTextLaptop(titre: 'PUB REGIE'),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 24,
                                        child: TitreTextLaptop(
                                          titre: article.tag,
                                          fontSize: 16,
                                        ),
                                      ),
                                      ArticeTextLaptop(
                                        titre: article.body,
                                      ),
                                      SizedBox(
                                        height: size.height * .03,
                                      ),
                                      Container(
                                        height: size.height * .05,
                                        width: size.width * .6,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Spacer(),
                                            Text(
                                              '${appState.article.date}',
                                              style: TextStyle(
                                                  color: colorPrimaire),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: size.height * .03,
                                        width: size.width,
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Text(
                                              '${article.nameAuthor}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              ' , Journaliste ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      article.allFichier.length > 0
                                          ? Container(
                                              height: size.height * 0.19,
                                              //color: Colors.amber,
                                              child: ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                children: [],
                                              ),
                                            )
                                          : Container(),
                                      Container(
                                        height: size.height * .3,
                                        width: size.width,
                                        // color: colorPrimaire,
                                        child: ListView(
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          children: getList(article: article),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            RaisedButton(
                                              color: colorPrimaire,
                                              onPressed: () {
                                                print('here');
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Fermer',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
          )
        : GestureDetector(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 0,
                backgroundColor: Colors.white,
                shadowColor: Colors.white,
                elevation: 0,
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
                        color: Color.fromRGBO(255, 255, 255, 1),
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
                                          // fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(0, 0, 0, 1)),
                                    ),
                                    Icon(
                                      Icons.arrow_circle_down_outlined,
                                      size: 30,
                                      color: Color.fromRGBO(0, 0, 0, 1),
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
                                        image: AssetImage(
                                            'assets/images/logo_solgan.png'),
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
                          child: Center(
                            child: CardTitrePhone(
                                titre:
                                    "Pas d'article avec ce titre cliquez pour retounez "),
                          ))),
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
            ),
          );
  }

  List<Widget> getList({required Article article}) {
    List<Widget> liste = [];
    List<Article> listeArticle = appState.listePost
        .where((element) => element.tag == article.tag)
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
    for (var item in listeArticle
        .where((element) => element.categorie != 'Breaking News')
        .toList()
        .reversed
        .toList()) {
      liste.add(Container(
        height: size.height * .3,
        width: size.width * .5,
        child: CardArticleCategorieTabletBis(
          article: item,
        ),
      ));
    }
    return liste;
  }
}

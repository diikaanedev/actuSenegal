import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'dart:io' as FILE;

import 'package:actu/devices/laptop/widget/acceuil-top-laptop.dart';
import 'package:actu/devices/laptop/widget/card-scandale-decouverte-reportage-laptop.dart';
import 'package:actu/devices/laptop/widget/get-article-same-categorie-tag.dart';
import 'package:actu/devices/laptop/widget/menu-item-laptop.dart';
import 'package:actu/devices/laptop/widget/read-reportage-dialog.dart';
import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

class ReadArticleLaptop extends StatefulWidget {
  @override
  _ReadArticleLaptopState createState() => _ReadArticleLaptopState();
}

class _ReadArticleLaptopState extends State<ReadArticleLaptop> {
  bool showMenu = false;
  bool showBreakingNews = false;
  bool chargement = true;
  bool isValid = true;
  late Size size;
  var url = window.location.href;
  String viewID = "view-id";
  late String urlVideo = "https://www.youtube.com/embed/8HYX7vLnzZw";
  late Article article;

  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    if (appState.article.id == url.split('/').last) {
      setState(() {
        chargement = false;
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
          chargement = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    html.Element? head = html.document.querySelector('head');
    head!.appendHtml(
        '<meta name="description" content="1er Groupe de Média Digital au Sénégal">');

    head.appendHtml('<meta name="title" content="${appState.article.titre}">');
    head.appendHtml(
        '<meta name="url" content="https:www.actu221.net/${appState.article.id}">');
    return isValid
        ? Scaffold(
            body: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                Positioned(
                    top: size.height * .1,
                    child: Container(
                      height: size.height * .93,
                      width: size.width,
                      // color: colorPrimaire,
                      child: chargement == false
                          ? ListView(
                              physics: BouncingScrollPhysics(),
                              // controller: controller,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                appState.listeTopPage.length > 0
                                    ? AcceuilTopLaptop()
                                    : Container(),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: size.height * .2,
                                  width: size.width,
                                  // color: colorPrimaire,
                                  child: Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Spacer(),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                    content: new Text(
                                                        "En cour de Développement"),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('Fermer'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  ));
                                        },
                                        child: Container(
                                          width: size.width * .2,
                                          child:
                                              CardScandaleDecouverteReportageLaptop(
                                            titre: 'Découverte',
                                            urlTof: appState.listeDecouvertes
                                                .first.urlPhoto,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                    content: HtmlWidget(
                                                      appState.listeProgrammes
                                                          .first.body,
                                                      webView: true,
                                                      webViewJs: true,
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('Fermer'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  ));
                                        },
                                        child: Container(
                                          width: size.width * .2,
                                          child:
                                              CardScandaleDecouverteReportageLaptop(
                                            titre: 'Programmes',
                                            urlTof:
                                                'https://us.123rf.com/450wm/alexwhite/alexwhite1509/alexwhite150906240/45620260-replay-roter-kreis-gl%C3%A4nzend-web-symbol-runde-taste-mit-metallischen-rand.jpg?ver=6',
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (_) => new AlertDialog(
                                                    content: HtmlWidget(
                                                      appState.listePost
                                                          .where((element) =>
                                                              element.categorie
                                                                  .toLowerCase() ==
                                                              'Scandales'
                                                                  .toLowerCase())
                                                          .first
                                                          .body,
                                                      webView: true,
                                                      webViewJs: true,
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text('Fermer'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  ));
                                        },
                                        child: Container(
                                          width: size.width * .2,
                                          child:
                                              CardScandaleDecouverteReportageLaptop(
                                            titre: 'Scandales',
                                            urlTof: appState.listePost
                                                .where((element) =>
                                                    element.categorie
                                                        .toLowerCase() ==
                                                    'Scandales'.toLowerCase())
                                                .first
                                                .urlPhoto,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () => readReportage(context,
                                            appState.listeReportages.first),
                                        child: Container(
                                          width: size.width * .2,
                                          child:
                                              CardScandaleDecouverteReportageLaptop(
                                            titre: 'Reportages',
                                            urlTof: appState
                                                .listeReportages.first.urlPhoto,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            )
                          : Container(
                              height: size.height * .93,
                              width: size.width,
                              child: Center(
                                child: CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
                                            colorPrimaire)),
                              ),
                            ),
                    )),
                Positioned(
                    top: 0,
                    child: Container(
                      height: size.height * .1,
                      width: size.width,
                      decoration: BoxDecoration(),
                      child: Card(
                        elevation: 2,
                        shadowColor: colorPrimaire,
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            GestureDetector(
                              onTap: () {
                                appState.setState(() {
                                  appState.screen = 0;
                                });
                              },
                              child: Container(
                                width: size.width * .2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/logo_solgan.png'))),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(width: 2, color: Colors.black),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showMenu = !showMenu;
                                });
                              },
                              child: Container(
                                // width: size.width * .07,
                                // color: colorPrimaire,
                                child: Row(
                                  children: [
                                    Text(
                                      'MENU',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: showMenu
                                              ? colorPrimaire
                                              : Colors.black),
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Icon(
                                      Icons.arrow_circle_down_outlined,
                                      color: showMenu
                                          ? colorPrimaire
                                          : Colors.grey[850],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * .5,
                              child: Row(
                                children: [
                                  Spacer(),
                                  MenuItemLaptop(
                                    titre: "Actualités",
                                  ),
                                  MenuItemLaptop(
                                    titre: "Politique",
                                  ),
                                  MenuItemLaptop(
                                    titre: "Economie",
                                  ),
                                  MenuItemLaptop(
                                    titre: "Investigation",
                                  ),
                                  MenuItemLaptop(
                                    titre: "International",
                                  ),
                                  MenuItemLaptop(
                                    titre: "Sport",
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 2),
                              child: GestureDetector(
                                onTap: () async {
                                  await launch(
                                      'https://www.youtube.com/channel/UC7Phmsh-eFFFz7wVWKwkJ0g');
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Container(
                                        height: 50,
                                        width: 100,
                                        child: Image.asset(
                                            'assets/images/logo_tv.png'),
                                      ),
                                      Text(
                                        'Nos Live',
                                        style: TextStyle(
                                            color: colorPrimaire,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    // color: _color,
                                    // color: colorPrimaire,

                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .03,
                            )
                          ],
                        ),
                      ),
                    )),
                chargement == false
                    ? AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: TitreTextLaptop(titre: appState.article.titre),
                        content: Container(
                            height: size.height * 1,
                            width: size.width * 0.6,
                            color: colorSecondaire,
                            child: ListView(
                              children: [
                                Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/actu221.appspot.com/o/djamil-logistique%2Ffn-34.jpg?alt=media&token=98f2d2b6-73b3-4fe2-a44c-c9aede2748bb",
                                  scale: 1.5,
                                  // height: size.height * .35,
                                  // width: size.width * .6,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: size.height * .4,
                                  width: size.width * .6,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Spacer(),
                                      Container(
                                          width: size.width * .4,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(appState
                                                      .article.urlPhoto),
                                                  fit: BoxFit.contain))),
                                      Spacer()
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width,
                                  child: Center(
                                    child: TitreTextLaptop(
                                      titre: appState.article.tag.toUpperCase(),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: size.height * .5,
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      HtmlWidget(
                                        appState.article.body,
                                        webView: true,
                                        webViewJs: true,
                                        textStyle: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .6,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: size.width * .01,
                                      ),
                                      Text(
                                        '${appState.article.date}',
                                        style: TextStyle(color: colorPrimaire),
                                      ),
                                      Spacer(),
                                      Text(
                                        appState.article.nameAuthor,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(' , ${appState.article.roleAuthor}'),
                                      SizedBox(width: 30),
                                    ],
                                  ),
                                ),
                                appState.listePost.length > 0
                                    ? Container(
                                        height: size.height * .4,
                                        width: size.width * .45,
                                        child: Carousel(
                                            arrowColor: Colors.black,
                                            unActiveIndicatorColor:
                                                Colors.blueGrey,
                                            showIndicator: true,
                                            axis: Axis.horizontal,
                                            height: size.height * .4,
                                            width: size.width * .4,
                                            initialPage: 0,
                                            allowWrap: false,
                                            type: Types.slideSwiper,
                                            indicatorType: IndicatorTypes.bar,
                                            activeIndicatorColor: colorPrimaire,
                                            indicatorBackgroundColor:
                                                Colors.white,
                                            showArrow: true,
                                            children:
                                                getArticleSameCategorieTag(
                                                    article: appState.article,
                                                    size: size)))
                                    : Container(),
                              ],
                            )),
                        actions: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          RaisedButton(
                            color: colorPrimaire,
                            onPressed: () {
                              print('here');
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Fermer',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          )
        : GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: .0,
                elevation: .0,
              ),
              body: Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                  Positioned(
                      top: size.height * .1,
                      child: Container(
                        height: size.height * .8,
                        width: size.width,
                        child: Center(
                          child: TitreTextLaptop(
                            titre:
                                'Pas d\'article avec ce titre cliquez pour aller a l\'acceuil',
                            fontSize: 18,
                          ),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      child: Container(
                        height: size.height * .1,
                        width: size.width,
                        decoration: BoxDecoration(),
                        child: Card(
                          elevation: 2,
                          shadowColor: colorPrimaire,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .05,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Container(
                                  width: size.width * .2,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logo_solgan.png'))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(width: 2, color: Colors.black),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showMenu = !showMenu;
                                  });
                                },
                                child: Container(
                                  // width: size.width * .07,
                                  // color: colorPrimaire,
                                  child: Row(
                                    children: [
                                      Text(
                                        'MENU',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: showMenu
                                                ? colorPrimaire
                                                : Colors.black),
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Icon(
                                        Icons.arrow_circle_down_outlined,
                                        color: showMenu
                                            ? colorPrimaire
                                            : Colors.grey[850],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * .5,
                                child: Row(
                                  children: [
                                    Spacer(),
                                    MenuItemLaptop(
                                      titre: "Actualités",
                                    ),
                                    MenuItemLaptop(
                                      titre: "Politique",
                                    ),
                                    MenuItemLaptop(
                                      titre: "Economie",
                                    ),
                                    MenuItemLaptop(
                                      titre: "Investigation",
                                    ),
                                    MenuItemLaptop(
                                      titre: "International",
                                    ),
                                    MenuItemLaptop(
                                      titre: "Sport",
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                duration: Duration(seconds: 2),
                                child: GestureDetector(
                                  onTap: () async {
                                    await launch(
                                        'https://www.youtube.com/channel/UC7Phmsh-eFFFz7wVWKwkJ0g');
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Container(
                                          height: 50,
                                          width: 100,
                                          child: Image.asset(
                                              'assets/images/logo_tv.png'),
                                        ),
                                        Text(
                                          'Live',
                                          style: TextStyle(
                                              color: colorPrimaire,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      // color: _color,
                                      // color: colorPrimaire,

                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .03,
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
  }
}

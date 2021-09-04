import 'dart:convert';

import 'package:actu/devices/phone/widget/card-ala-une.dart';
import 'package:actu/devices/phone/widget/card-decouverte-scandales-investigation-phone.dart';
import 'package:actu/devices/phone/widget/card-show-plus.dart';
import 'package:actu/devices/phone/widget/card-titre-phone.dart';
import 'package:actu/devices/phone/widget/footer-phone.dart';
import 'package:actu/devices/phone/widget/menu-top-phone.dart';
import 'package:actu/devices/phone/widget/pub-widget-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

late _HomePhoneState homePhoneState;

class HomePhone extends StatefulWidget {
  @override
  _HomePhoneState createState() {
    homePhoneState = _HomePhoneState();
    return homePhoneState;
  }
}

class _HomePhoneState extends State<HomePhone> {
  late Size size;
  bool isShowMenu = false;
  bool chargement = true;
  String viewID = "publi-reportage";
  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    setState(() {
      chargement = true;
    });
    await FirebaseFirestore.instance
        .collection('publicite')
        .get()
        .then((value) {
      appState.setState(() {
        appState.listePub = PubActu.fromFireBase(value.docs);
      });
    });
    WebByDii.get(url: 'posts').then((response) {
      var data = json.decode(response.body);
      // print('${data['data'].length}');
      appState.setState(() {
        appState.listePost = Article.fromJson(data);

        appState.listeTopPage =
            appState.listePost.where((element) => element.isAlaUne).toList();

        appState.listeDecouvertes = appState.listePost
            .where((element) => element.categorie.toLowerCase() == 'découverte')
            .toList();

        appState.listeInvestigations = appState.listePost
            .where(
                (element) => element.categorie.toLowerCase() == 'investigation')
            .toList();

        appState.listePolitique = appState.listePost
            .where((element) => element.categorie == 'Politique')
            .toList();
        appState.listeRedaction = appState.listePost
            .where((element) => element.categorie == 'Dossier de la Redaction')
            .toList();
        appState.listeEnquetes = appState.listePost
            .where((element) => element.categorie == 'Ênquete')
            .toList();
        appState.listeSport = appState.listePost
            .where((element) => element.categorie == 'Sport')
            .toList();
        appState.listeEconomie = appState.listePost
            .where((element) => element.categorie == 'Economie')
            .toList();
        appState.listeInternational = appState.listePost
            .where((element) => element.categorie == 'International')
            .toList();

        appState.listeBreakingNews = appState.listePost
            .where((element) => element.categorie == 'Breaking News')
            .toList();

        appState.listeEntreprenariats = appState.listePost
            .where((element) => element.categorie == 'Entreprenariat')
            .toList();
        appState.listeBreakingNews = appState.listePost
            .where((element) => element.categorie == 'Breaking News')
            .toList();
        appState.listeRessourceDuSenegal = appState.listePost
            .where((element) => element.categorie == 'Ressource du Senegal')
            .toList();

        appState.listeReportages = appState.listePost
            .where((element) => element.categorie == 'Reportage')
            .toList();
      });

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
                    : ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: size.height * .01,
                          ),
                          CardTitrePhone(
                            titre: 'À LA UNE',
                          ),
                          Container(
                            height: size.height * .45,
                            width: size.width,
                            // color: colorPrimaire,
                            child: CarouselSlider(
                                items: [
                                  CardArticleAlaUnePhone(
                                    article: appState.listeTopPage
                                        .where((element) =>
                                            element.isAlaUne &&
                                            element.positionUne == 1)
                                        .first,
                                  ),
                                  CardArticleAlaUnePhone(
                                    article: appState.listeTopPage
                                        .where((element) =>
                                            element.isAlaUne &&
                                            element.positionUne == 2)
                                        .first,
                                  ),
                                  CardArticleAlaUnePhone(
                                    article: appState.listeTopPage
                                        .where((element) =>
                                            element.isAlaUne &&
                                            element.positionUne == 3)
                                        .first,
                                  ),
                                  CardArticleAlaUnePhone(
                                    article: appState.listeTopPage
                                        .where((element) =>
                                            element.isAlaUne &&
                                            element.positionUne == 4)
                                        .first,
                                  ),
                                  CardArticleAlaUnePhone(
                                    article: appState.listeTopPage
                                        .where((element) =>
                                            element.isAlaUne &&
                                            element.positionUne == 5)
                                        .first,
                                  ),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: size.height * .25,
                            width: size.width,
                            // color: colorPrimaire,
                            child: CarouselSlider(
                                items: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => new AlertDialog(
                                                content: new HtmlWidget(
                                                  appState.listeDecouvertes
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
                                    child:
                                        CardDecouverteScandaleInvestigationPhone(
                                      titre: 'Découverte',
                                      urlTof: appState
                                          .listeDecouvertes.first.urlPhoto,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) => new AlertDialog(
                                                content: new Text(
                                                    "Dans quelques instants ..."),
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
                                    child:
                                        CardDecouverteScandaleInvestigationPhone(
                                      titre: 'Programmes',
                                      urlTof:
                                          'https://us.123rf.com/450wm/alexwhite/alexwhite1509/alexwhite150906240/45620260-replay-roter-kreis-gl%C3%A4nzend-web-symbol-runde-taste-mit-metallischen-rand.jpg?ver=6',
                                    ),
                                  ),
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
                                    child:
                                        CardDecouverteScandaleInvestigationPhone(
                                      titre: 'RÉVÉLATION',
                                      urlTof: appState.listePost
                                          .where((element) =>
                                              element.categorie.toLowerCase() ==
                                              'Scandales'.toLowerCase())
                                          .first
                                          .urlPhoto,
                                    ),
                                  ),
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
                                                          'Reportage'
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
                                    child:
                                        CardDecouverteScandaleInvestigationPhone(
                                      titre: 'Reportages',
                                      urlTof: appState.listePost
                                          .where((element) =>
                                              element.categorie.toLowerCase() ==
                                              'Reportage'.toLowerCase())
                                          .first
                                          .urlPhoto,
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: .6,
                                  initialPage: 1,
                                  // viewportFraction: .6
                                  // autoPlay: true,
                                  // enlargeCenterPage: true,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Actualites',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles: appState.listePost
                                        .where((element) =>
                                            element.categorie.toLowerCase() ==
                                            'Actualites'.toLowerCase())
                                        .toList()
                                        .sublist(0, 8),
                                    categorie: "Actualites"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Politique',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles:
                                        appState.listePolitique.sublist(0, 8),
                                    categorie: "Politique"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  onPageChanged: (index, reason) {},
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Economie',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles:
                                        appState.listeEconomie.sublist(0, 8),
                                    categorie: "Economie"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  onPageChanged: (index, reason) {},
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Investigations',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles: appState.listeInvestigations
                                        .sublist(0, 8),
                                    categorie: "Investigations"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  onPageChanged: (index, reason) {},
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Dossier de la redaction',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles:
                                        appState.listeRedaction.sublist(0, 8),
                                    categorie: "Dossier de la redaction"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Ressource du senegal',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles: appState.listeRessourceDuSenegal
                                        .sublist(0, 8),
                                    categorie: "Ressource du senegal"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  onPageChanged: (index, reason) {},
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'International',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles: appState.listeInternational
                                        .sublist(0, 8),
                                    categorie: "International"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            pub: appState.listePub.first,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CardTitrePhone(
                            titre: 'Sport',
                          ),
                          Container(
                            height: size.height * .4,
                            width: size.width,
                            child: CarouselSlider(
                                items: getListTitre(
                                    articles: appState.listeSport.sublist(0, 8),
                                    categorie: "Sport"),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          FooterPhone(),
                          SizedBox(
                            height: size.height * .1,
                          )
                        ],
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
              : Container(),
          chargement
              ? Container()
              : Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * .07,
                    width: size.width,
                    child: CarouselSlider(
                        items: appState.listeBreakingNews
                            .map((e) => Container(
                                  height: size.height * .07,
                                  width: size.width,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Stack(
                                      children: [
                                        Container(
                                          height: constraints.maxHeight,
                                          width: constraints.maxWidth,
                                          // color: colorPrimaire,
                                        ),
                                        Positioned(
                                            top: constraints.maxHeight * .37,
                                            child: Container(
                                              height:
                                                  constraints.maxHeight * .63,
                                              width: constraints.maxWidth,
                                              color: Colors.grey[700],
                                              child: Center(
                                                child: Text(
                                                  "    ${e.titre}    ",
                                                  textAlign: TextAlign.center,
                                                  // overflow:
                                                  //     TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                            // left: constraints.maxWidth * .1,
                                            child: Container(
                                          height: constraints.maxHeight * .4,
                                          color: colorPrimaire,
                                          child: Column(
                                            children: [
                                              Spacer(),
                                              Text(
                                                "    ${e.tag.toUpperCase()}   ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        constraints.maxHeight *
                                                            .23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 0.8,
                          viewportFraction: 1.4,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 500),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )),
                  )),
        ],
      ),
    );
  }

  List<Widget> getListAlaUne() {
    List<Widget> liste = [];
    for (var item in appState.listeTopPage) {
      liste.add(CardArticleAlaUnePhone(
        article: item,
      ));
    }
    return liste;
  }

  List<Widget> getListTitre(
      {required List<Article> articles, required String categorie}) {
    List<Widget> liste = [];
    for (var item in articles) {
      liste.add(CardArticleAlaUnePhone(
        article: item,
      ));
    }
    liste.add(CardShowPlus(
      categorie: categorie,
    ));
    return liste;
  }
}

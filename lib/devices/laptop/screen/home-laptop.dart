import 'dart:convert';

import 'package:actu/devices/laptop/widget/acceuil-top-laptop.dart';
import 'package:actu/devices/laptop/widget/accueil-actualite-laptop.dart';
import 'package:actu/devices/laptop/widget/accueil-dossier-redaction-laptop.dart';
import 'package:actu/devices/laptop/widget/breaking-news.dart';
import 'package:actu/devices/laptop/widget/card-scandale-decouverte-reportage-laptop.dart';
import 'package:actu/devices/laptop/widget/card-voir-plus.dart';
import 'package:actu/devices/laptop/widget/footer-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-item-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-top-laptop.dart';
import 'package:actu/devices/laptop/widget/pub-widget-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui' as ui;

late _HomeLaptopState homeLaptopState;

class HomeLaptop extends StatefulWidget {
  @override
  _HomeLaptopState createState() {
    homeLaptopState = _HomeLaptopState();
    return homeLaptopState;
  }
}

class _HomeLaptopState extends State<HomeLaptop> {
  bool showMenu = false;
  bool showBreakingNews = false;
  bool chargement = true;
  late Size size;
  String viewID = "your-view-id";
  @override
  void initState() {
    getPost();
  }

  getPost() async {
    setState(() {
      chargement = true;
    });
    FirebaseFirestore.instance.collection('publicite').get().then((value) {
      appState.setState(() {
        appState.listePub = PubActu.fromFireBase(value.docs);
      });
    });
    WebByDii.get(url: 'posts').then((response) {
      var data = json.decode(response.body);
      print('taille => ${data['data'].length}');
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
            .where((element) =>
                element.categorie == 'Politique' && !element.isAlaUne)
            .toList();
        appState.listeRedaction = appState.listePost
            .where((element) =>
                element.categorie == 'Dossier de la Redaction' &&
                !element.isAlaUne)
            .toList();
        appState.listeSport = appState.listePost
            .where(
                (element) => element.categorie == 'Sport' && !element.isAlaUne)
            .toList();
        appState.listeEconomie = appState.listePost
            .where((element) =>
                element.categorie == 'Economie' && !element.isAlaUne)
            .toList();
        appState.listeInternational = appState.listePost
            .where((element) =>
                element.categorie == 'International' && !element.isAlaUne)
            .toList();

        appState.listeEntreprenariats = appState.listePost
            .where((element) =>
                element.categorie == 'Entreprenariat' && !element.isAlaUne)
            .toList();
        appState.listeBreakingNews = appState.listePost
            .where((element) =>
                element.categorie == 'Breaking News' && !element.isAlaUne)
            .toList();
        appState.listeRessourceDuSenegal = appState.listePost
            .where((element) =>
                element.categorie == 'Ressource du Senegal' &&
                !element.isAlaUne)
            .toList();
      });

      print(appState.listeInternational.length);

      setState(() {
        chargement = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src =
              'https://firebasestorage.googleapis.com/v0/b/actu221.appspot.com/o/publi-reportage%2FCCBM%20%26%20LBA%20-%20HD.mp4?alt=media&token=154a5061-6f78-471b-89d2-f96caf32e789'
          ..style.border = 'none');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: colorPrimaire,
        shadowColor: colorPrimaire,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
          ),
          Positioned(
              top: size.height * .1,
              child: Container(
                height: size.height * .93,
                width: size.width,
                // color: colorPrimaire,
                child: chargement
                    ? Center(
                        child: Container(
                          height: size.height * .05,
                          width: size.height * .05,
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
                            height: 15,
                          ),
                          AcceuilTopLaptop(),
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
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              content: new Text(
                                                  "En cour de Dévéllopement"),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('Fermer'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            ));
                                  },
                                  child: CardScandaleDecouverteReportageLaptop(
                                    titre: 'Découverte',
                                    urlTof: appState
                                        .listeDecouvertes.first.urlPhoto,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              content: Container(
                                                height: size.height * .8,
                                                width: size.width * .6,
                                                child: HtmlElementView(
                                                  viewType: viewID,
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('Fermer'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            ));
                                  },
                                  child: CardScandaleDecouverteReportageLaptop(
                                    titre: 'Publi-reportage',
                                    urlTof:
                                        'https://firebasestorage.googleapis.com/v0/b/actu221.appspot.com/o/publi-reportage%2Fccbm.png?alt=media&token=2e26fd94-2f87-44ec-a39f-200d79d6c317',
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              content: new Text(
                                                  "En cour de traitement ..."),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('Fermer'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            ));
                                  },
                                  child: CardScandaleDecouverteReportageLaptop(
                                    titre: 'Scandales',
                                    urlTof:
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlEWJ6WUGiSSyIMGIJQCA7QHs8B6BLns2SU2bZav0Wy8dE-8y-GVghZahZhjRQsFy1hFk&usqp=CAU',
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => new AlertDialog(
                                              content: new Text(
                                                  "En cour de Dévéllopement"),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('Fermer'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            ));
                                  },
                                  child: CardScandaleDecouverteReportageLaptop(
                                    titre: 'Reportages',
                                    urlTof: appState
                                        .listeEntreprenariats.first.urlPhoto,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          chargement
                              ? Center(
                                  child: Container(
                                      height: size.height * .15,
                                      width: size.width * .1,
                                      child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  colorPrimaire))))
                              : AcceuilActualiteLaptop(
                                  titre: 'Actualités',
                                  liste: appState.listePost
                                      .where((element) =>
                                          element.categorie.toLowerCase() ==
                                          'Actualites'.toLowerCase())
                                      .toList(),
                                ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'actualites'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PubWidgetLaptop(
                            pub: appState.listePub[0],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AcceuilDossierRedactionLaptop(),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'Dossier de la Redaction'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PubWidgetLaptop(
                            pub: appState.listePub[1],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          chargement
                              ? Center(
                                  child: Container(
                                      height: size.height * .15,
                                      width: size.width * .1,
                                      child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  colorPrimaire))))
                              : AcceuilActualiteLaptop(
                                  titre: 'Politique',
                                  type: 1,
                                  liste: appState.listePolitique,
                                ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'Politique'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PubWidgetLaptop(
                            pub: appState.listePub[0],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AcceuilActualiteLaptop(
                            titre: 'Economie',
                            type: 2,
                            liste: appState.listeEconomie,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'Economie'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PubWidgetLaptop(
                            pub: appState.listePub[0],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AcceuilActualiteLaptop(
                            titre: 'Investigations',
                            type: 1,
                            liste: appState.listeInvestigations,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'Investigation'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PubWidgetLaptop(
                            pub: appState.listePub[0],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AcceuilActualiteLaptop(
                            titre: 'Ressource du Senegal',
                            type: 2,
                            liste: appState.listeRessourceDuSenegal,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'Ressource du Senegal'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          PubWidgetLaptop(
                            pub: appState.listePub[0],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AcceuilActualiteLaptop(
                            titre: 'International',
                            type: 2,
                            liste: appState.listeInternational,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'International'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AcceuilActualiteLaptop(
                            titre: 'Sport',
                            type: 2,
                            liste: appState.listeSport,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CardVoirPLus(
                            categorie: 'Sport'.toLowerCase(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FooterLaptop(),
                          SizedBox(
                            height: size.height * .07,
                          ),
                        ],
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
                                color:
                                    showMenu ? colorPrimaire : Colors.grey[850],
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
                              titre: "Actualites",
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
                                  child:
                                      Image.asset('assets/images/logo_tv.png'),
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
          showMenu ? MenuTopLaptop() : Container(),
          chargement
              ? Positioned(
                  bottom: 0,
                  child: Center(
                      child: Container(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  colorPrimaire)))),
                )
              : Positioned(
                  bottom: 0,
                  child: Container(
                      height: size.height * .07,
                      width: size.width,
                      color: Colors.grey[800],
                      child: CarouselSlider(
                          items:
                              getListBreakingNews(context: context, size: size),
                          options: CarouselOptions(
                            aspectRatio: 10.8,
                            viewportFraction: 1.2,
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
                          )))),
        ],
      ),
    );
  }

  List<Widget> getListBreakingNews(
      {required BuildContext context, required Size size}) {
    List<Widget> liste = [];
    for (var item in appState.listeBreakingNews) {
      liste.add(breakingNew(context, size, item));
    }
    return liste;
  }
}

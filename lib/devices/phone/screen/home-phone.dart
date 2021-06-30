import 'dart:convert';

import 'package:actu/devices/phone/widget/card-ala-une.dart';
import 'package:actu/devices/phone/widget/card-decouverte-scandales-investigation-phone.dart';
import 'package:actu/devices/phone/widget/card-titre-phone.dart';
import 'package:actu/devices/phone/widget/footer-phone.dart';
import 'package:actu/devices/phone/widget/menu-top-phone.dart';
import 'package:actu/devices/phone/widget/pub-widget-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    getPost();
  }

  getPost() async {
    setState(() {
      chargement = true;
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
            .where((element) =>
                element.categorie == 'Politique' && !element.isAlaUne)
            .toList();
        appState.listeRedaction = appState.listePost
            .where((element) =>
                element.categorie == 'Redaction' && !element.isAlaUne)
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

      print(appState.listeRessourceDuSenegal.length);

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
                            titre: 'A la Une',
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
                            url:
                                'https://caractereconseil.com/assets/c_brands/candia/campagne_1/CANDIA_Sante-6a4a68d97ace7357f382b99038a8804e9caefe41898fdec5f04506e74d24ac7f.jpg',
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
                                                content: new Text(
                                                    "En cour de Dévéllopement"),
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
                                                    "En cour de Dévéllopement"),
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
                                      titre: '#FreeSénégal',
                                      urlTof: 'assets/images/FreeSenegal.jpg',
                                    ),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              ));
                                    },
                                    child:
                                        CardDecouverteScandaleInvestigationPhone(
                                      titre: '#Sénégal',
                                      urlTof: 'assets/images/#senegal.jpg',
                                    ),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  )
                                                ],
                                              ));
                                    },
                                    child:
                                        CardDecouverteScandaleInvestigationPhone(
                                      titre: 'Reportage',
                                      urlTof: appState
                                          .listeEntreprenariats.first.urlPhoto,
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
                            url:
                                'https://caractereconseil.com/assets/c_brands/bic/campagne_1/Bic-4x3-eng-boy-383854400b4cca17890e782a98786d04efcac1da20f6ded6f7252b93b9849281.jpg',
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
                                    articles: appState.listePolitique),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            url:
                                'https://caractereconseil.com/assets/c_brands/jongue/campagne_1/4x3_Jongue-Tablette-4d70b1dc850eaa3cea45d8c65cdf79fda86e9f204bdc9fc0b6814d33af207410.jpg',
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
                                    articles: appState.listeRedaction),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            url:
                                'https://caractereconseil.com/assets/c_brands/pressea/campagne2/image3-d3a338e61e0bc76e41770e784b450d5a4376ccd678f1daa9d0ff8a3c0f1c4e8c.jpg',
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
                                    articles: appState.listePolitique),
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
                            url:
                                'https://caractereconseil.com/assets/c_brands/pressea/campagne2/image3-d3a338e61e0bc76e41770e784b450d5a4376ccd678f1daa9d0ff8a3c0f1c4e8c.jpg',
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
                                    articles: appState.listeEconomie),
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
                            url:
                                'https://caractereconseil.com/assets/c_brands/pressea/campagne2/image3-d3a338e61e0bc76e41770e784b450d5a4376ccd678f1daa9d0ff8a3c0f1c4e8c.jpg',
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
                                    articles: appState.listeInvestigations),
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
                            url:
                                'https://caractereconseil.com/assets/c_brands/pressea/campagne2/image3-d3a338e61e0bc76e41770e784b450d5a4376ccd678f1daa9d0ff8a3c0f1c4e8c.jpg',
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
                                    articles: appState.listeRessourceDuSenegal),
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
                            url:
                                'https://caractereconseil.com/assets/c_brands/pressea/campagne2/image3-d3a338e61e0bc76e41770e784b450d5a4376ccd678f1daa9d0ff8a3c0f1c4e8c.jpg',
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
                                    articles: appState.listeInternational),
                                options: CarouselOptions(
                                  aspectRatio: .8,
                                  viewportFraction: .8,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          PubWidgetPhone(
                            url:
                                'https://caractereconseil.com/assets/c_brands/candia/campagne_1/CANDIA_Sante-6a4a68d97ace7357f382b99038a8804e9caefe41898fdec5f04506e74d24ac7f.jpg',
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
                                items:
                                    getListTitre(articles: appState.listeSport),
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
              : Container()
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

  List<Widget> getListTitre({required List<Article> articles}) {
    List<Widget> liste = [];
    for (var item in articles) {
      liste.add(CardArticleAlaUnePhone(
        article: item,
      ));
    }
    return liste;
  }
}

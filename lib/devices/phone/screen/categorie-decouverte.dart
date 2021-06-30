import 'package:actu/devices/phone/widget/card-decouverte-article-phone.dart';
import 'package:actu/devices/phone/widget/footer-phone.dart';
import 'package:actu/devices/phone/widget/menu-top-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

late _CategorieDecouverteInvestigationScandalesPhoneState
    categorieDecouverteInvestigationScandalesPhoneState;

class CategorieDecouverteInvestigationScandalesPhone extends StatefulWidget {
  @override
  _CategorieDecouverteInvestigationScandalesPhoneState createState() {
    categorieDecouverteInvestigationScandalesPhoneState =
        _CategorieDecouverteInvestigationScandalesPhoneState();
    return categorieDecouverteInvestigationScandalesPhoneState;
  }
}

class _CategorieDecouverteInvestigationScandalesPhoneState
    extends State<CategorieDecouverteInvestigationScandalesPhone> {
  bool isShowMenu = false;
  late Size size;
  bool chargement = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        backgroundColor: Colors.white,
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
                                  // fontWeight: FontWeight.w200,
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
                      height: size.height * .07,
                      width: size.width,
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            width: size.width * .1,
                            // color: Colors.blue,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/infiny.png'))),
                                ),
                                Text(
                                  'THE',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Text(
                            appState.titreCategorie.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .3,
                      width: size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  appState.titreCategorie.toLowerCase() ==
                                          'découverte'
                                      ? appState.listeDecouvertes.first.urlPhoto
                                      : appState.titreCategorie.toLowerCase() ==
                                              'investigations'
                                          ? appState.listeInvestigations.first
                                              .urlPhoto
                                          : appState.listeEntreprenariats.first
                                              .urlPhoto),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            appState.titreCategorie.toLowerCase() ==
                                    'découverte'
                                ? '${appState.listeDecouvertes.first.tag[0]}'
                                : appState.titreCategorie.toLowerCase() ==
                                        'investigations'
                                    ? '${appState.listeInvestigations.first.tag[0]}'
                                    : '${appState.listeEntreprenariats.first.tag[0]}',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(88, 139, 139, 1),
                                decoration: TextDecoration.underline),
                          ),
                          Text(
                            appState.titreCategorie.toLowerCase() ==
                                    'découverte'
                                ? '${appState.listeDecouvertes.first.tag.substring(1).split(' ')[0]}'
                                : appState.titreCategorie.toLowerCase() ==
                                        'investigations'
                                    ? '${appState.listeInvestigations.first.tag.substring(1).split(' ')[0]}'
                                    : '${appState.listeEntreprenariats.first.tag.substring(1).split(' ')[0]}',
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(88, 139, 139, 1)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            appState.titreCategorie.toLowerCase() ==
                                    'découverte'
                                ? '${appState.listeDecouvertes.first.tag.substring(1).split(' ')[1]}'
                                : appState.titreCategorie.toLowerCase() ==
                                        'investigations'
                                    ? '${appState.listeInvestigations.first.tag.substring(1).split(' ')[1]}'
                                    : '${appState.listeEntreprenariats.first.tag.substring(1).split(' ')[1]}',
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontSize: 26,
                                fontWeight: FontWeight.w100,
                                color: Color.fromRGBO(88, 139, 139, 1)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      // height: size.height * .05,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Container(
                            width: size.width * .9,
                            child: Text(
                              appState.titreCategorie.toLowerCase() ==
                                      'découverte'
                                  ? '${appState.listeDecouvertes.first.titre}'
                                  : appState.titreCategorie.toLowerCase() ==
                                          'investigations'
                                      ? '${appState.listeInvestigations.first.titre}'
                                      : '${appState.listeEntreprenariats.first.titre}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  // textBaseline: TextBaseline.alphabetic,

                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height * .2,
                      width: size.width,
                      child: Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: size.height * .15,
                              width: size.width * .8,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * .03,
                                  ),
                                  Container(
                                    height: size.height * .05,
                                    width: size.width * .05,
                                    // color: colorPrimaire,
                                    child: Icon(
                                      Icons.chrome_reader_mode_rounded,
                                      size: 30,
                                      color: Color.fromRGBO(88, 139, 139, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: size.height * .05,
                                    width: size.width * .6,
                                    // color: colorPrimaire,
                                    child: Center(
                                      child: Text(
                                        appState.titreCategorie.toLowerCase() ==
                                                'découverte'
                                            ? 'Bio'
                                            : appState.titreCategorie
                                                        .toLowerCase() ==
                                                    'investigations'
                                                ? 'Investigations'
                                                : 'Reportage',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromRGBO(20, 33, 61, 1)),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Container(
                      // height: size.height * .76,
                      width: size.width,
                      // color: colorPrimaire,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .1,
                            vertical: size.height * .05),
                        child: Container(
                          // height: size.height * .5,
                          width: size.width * .8,
                          // color: Colors.green,
                          child: Column(
                            children: [
                              Container(
                                height: size.height * .05,
                                child: Row(
                                  children: [
                                    Text(
                                      appState.titreCategorie.toLowerCase() ==
                                              'découverte'
                                          ? 'B'
                                          : appState.titreCategorie
                                                      .toLowerCase() ==
                                                  'investigations'
                                              ? 'I'
                                              : 'R',
                                      style: TextStyle(
                                          color: Color.fromRGBO(20, 33, 61, 1),
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                    Text(
                                      appState.titreCategorie.toLowerCase() ==
                                              'découverte'
                                          ? 'iographie'
                                          : appState.titreCategorie
                                                      .toLowerCase() ==
                                                  'investigations'
                                              ? 'nvestigations'
                                              : 'eportage',
                                      style: TextStyle(
                                        color: Color.fromRGBO(20, 33, 61, 1),
                                        fontSize: 32,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  // height: size.height * .4,
                                  width: size.width * .8,
                                  child: HtmlWidget(
                                    appState.titreCategorie.toLowerCase() ==
                                            'découverte'
                                        ? appState.listeDecouvertes.first.body
                                        : appState.titreCategorie
                                                    .toLowerCase() ==
                                                'investigations'
                                            ? appState
                                                .listeInvestigations.first.body
                                            : appState.listeEntreprenariats
                                                .first.body,
                                    textStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'Lato'),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * .05,
                      width: size.width,
                      color: Colors.grey[700],
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Text(
                            'NOS AUTRES ${appState.titreCategorie}'
                                .toUpperCase(),
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .4,
                      width: size.width,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: getListe(),
                      ),
                    ),
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

  List<Widget> getListe() {
    List<Widget> liste = [];
    if (appState.titreCategorie.toLowerCase() == 'découverte') {
      for (var i = 0; i < appState.listeDecouvertes.length; i++) {
        // print(appState.listeDecouvertes[i].titre);
        if (appState.listeDecouvertes[i].titre !=
            appState.listeDecouvertes[0].titre) {
          liste.add(CardDecouverteArticlePhone(
            article: appState.listeDecouvertes[i],
          ));
        }
      }
    } else if (appState.titreCategorie.toLowerCase() == 'investigations') {
      for (var i = 0; i < appState.listeInvestigations.length; i++) {
        // print(appState.listeInvestigations[i].titre);
        if (appState.listeInvestigations[i].titre !=
            appState.listeInvestigations[0].titre) {
          liste.add(CardDecouverteArticlePhone(
            article: appState.listeInvestigations[i],
          ));
        }
      }
    } else {
      for (var i = 0; i < appState.listeEntreprenariats.length; i++) {
        // print(appState.listeEntreprenariats[i].titre);
        if (appState.listeEntreprenariats[i].titre !=
            appState.listeEntreprenariats[0].titre) {
          liste.add(CardDecouverteArticlePhone(
            article: appState.listeEntreprenariats[i],
          ));
        }
      }
    }

    return liste;
  }
}

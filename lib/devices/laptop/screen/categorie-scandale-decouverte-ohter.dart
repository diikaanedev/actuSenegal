import 'dart:ui';
import 'package:actu/devices/laptop/widget/card-decouverte-article-laptop.dart';
import 'package:actu/devices/laptop/widget/card-question-decouverte-laptop.dart';
import 'package:actu/devices/laptop/widget/footer-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-item-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-top-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

late _CategorieScandaleDecouverteOtherState
    categorieScandaleDecouverteOtherState;

class CategorieScandaleDecouverteOther extends StatefulWidget {
  @override
  _CategorieScandaleDecouverteOtherState createState() {
    categorieScandaleDecouverteOtherState =
        _CategorieScandaleDecouverteOtherState();
    return categorieScandaleDecouverteOtherState;
  }
}

class _CategorieScandaleDecouverteOtherState
    extends State<CategorieScandaleDecouverteOther> {
  late Size size;
  bool showMenu = false;
  int showDialogBioCompagnyContact = 1;

  // Timer _timer;
  double _width = 100;
  double _height = 100;

  // void _changeColor() {
  //   double newWidth = _width == 100 ? 50 : 100;
  //   double newheigth = _height == 100 ? 50 : 100;
  //   setState(() {
  //     _width = newWidth;
  //     _height = _height;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(Duration(seconds: 2), (timer) => _changeColor());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned(
              top: size.height * .07,
              child: Container(
                height: size.height * .93,
                width: size.width,
                // color: colorPrimaire,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: size.height * .7,
                      width: size.width,
                      // color: colorPrimaire,
                      child: Stack(
                        children: [
                          Container(
                            height: size.height * .7,
                            width: size.width,
                          ),
                          Positioned(
                              right: size.width * .15,
                              child: Container(
                                height: size.height * .7,
                                width: size.width * .3,
                                color: Color.fromRGBO(20, 33, 61, 1),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: size.height * .04,
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            'Suivez moi',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            height: .5,
                                            width: size.width * .07,
                                            color: Colors.grey[600],
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: size.width * .02,
                                            height: size.height * .02,

                                            // color: colorPrimaire,
                                            child: Image.asset(
                                                'assets/images/twitter.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: size.width * .02,
                                            height: size.height * .02,

                                            // color: colorPrimaire,
                                            child: Image.asset(
                                                'assets/images/youtube.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: size.width * .02,
                                            height: size.height * .02,

                                            // color: colorPrimaire,
                                            child: Image.asset(
                                                'assets/images/instagram.png'),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: size.width * .02,
                                            height: size.height * .02,

                                            // color: colorPrimaire,
                                            child: Image.asset(
                                                'assets/images/facebook.png'),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Positioned(
                              right: size.width * .12,
                              top: size.height * .37,
                              child: Container(
                                height: size.height * .15,
                                width: size.width * .15,
                                // color: colorPrimaire,
                                child: Column(
                                  children: [
                                    Text(
                                      'Actu Group Corpération',
                                      style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: size.height * .05,
                                      width: size.width * .15,
                                      // color: colorPrimaire,
                                      child: Text(
                                        'Depuis Janvier 2020',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Positioned(
                              top: size.height * .12,
                              left: size.width * .1,
                              child: Container(
                                height: size.height * .07,
                                // width: size.width * .15,
                                child: Row(
                                  children: [
                                    Text(
                                      appState.titreCategorie.toLowerCase() ==
                                              'découverte'
                                          ? '${appState.listeDecouvertes.first.tag[0]}'
                                          : appState.titreCategorie
                                                      .toLowerCase() ==
                                                  'investigations'
                                              ? '${appState.listeInvestigations.first.tag[0]}'
                                              : '${appState.listeEntreprenariats.first.tag[0]}',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(88, 139, 139, 1)),
                                    ),
                                    Text(
                                      appState.titreCategorie.toLowerCase() ==
                                              'découverte'
                                          ? '${appState.listeDecouvertes.first.tag.substring(1).split(' ')[0]}'
                                          : appState.titreCategorie
                                                      .toLowerCase() ==
                                                  'investigations'
                                              ? '${appState.listeInvestigations.first.tag.substring(1).split(' ')[0]}'
                                              : '${appState.listeEntreprenariats.first.tag.substring(1).split(' ')[0]}',
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline'
                                          fontSize: 50,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(88, 139, 139, 1)),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      appState.titreCategorie.toLowerCase() ==
                                              'découverte'
                                          ? '${appState.listeDecouvertes.first.tag.substring(1).split(' ')[1]}'
                                          : appState.titreCategorie
                                                      .toLowerCase() ==
                                                  'investigations'
                                              ? '${appState.listeInvestigations.first.tag.substring(1).split(' ')[1]}'
                                              : '${appState.listeEntreprenariats.first.tag.substring(1).split(' ')[1]}',
                                      style: TextStyle(
                                          // decoration: TextDecoration.underline,
                                          fontSize: 50,
                                          fontWeight: FontWeight.w100,
                                          color:
                                              Color.fromRGBO(88, 139, 139, 1)),
                                    ),
                                  ],
                                ),
                                // color: colorPrimaire,
                              )),
                          Positioned(
                              top: size.height * .2,
                              left: size.width * .1,
                              child: Container(
                                height: size.height * .07,
                                width: size.width * .3,
                                // color: colorPrimaire,
                                child: Center(
                                  child: Text(
                                    appState.titreCategorie.toLowerCase() ==
                                            'découverte'
                                        ? '${appState.listeDecouvertes.first.titre}'
                                        : appState.titreCategorie
                                                    .toLowerCase() ==
                                                'investigations'
                                            ? '${appState.listeInvestigations.first.titre}'
                                            : '${appState.listeEntreprenariats.first.titre}',
                                    style: TextStyle(
                                        fontSize: 24,
                                        textBaseline: TextBaseline.alphabetic,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.grey[600]),
                                  ),
                                ),
                              )),
                          Positioned(
                              top: size.height * .28,
                              left: size.width * .1 - 12,
                              child: Container(
                                height: size.height * .425,
                                width: size.width * .3,
                                // color: Colors.green,
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Container(
                                      height: size.height * .2,
                                      width: size.width * .3,
                                      child: CardQuestionDecouverteLaptop(
                                        iconData:
                                            Icons.chrome_reader_mode_rounded,
                                        titre: appState.titreCategorie
                                                    .toLowerCase() ==
                                                'découverte'
                                            ? 'Bio'
                                            : appState.titreCategorie
                                                        .toLowerCase() ==
                                                    'investigations'
                                                ? 'Investigations'
                                                : 'Reportage',
                                        select: true,
                                      ),
                                    ),
                                    Spacer()
                                  ],
                                ),
                              )),
                          Positioned(
                              right: size.width * .29,
                              top: size.height * .08,
                              child: Container(
                                height: size.height * .6,
                                width: size.width * .3,
                                // color: colorPrimaire,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                child: Material(
                                  elevation: 1,
                                  // color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Image.network(
                                    appState.titreCategorie.toLowerCase() ==
                                            'découverte'
                                        ? appState
                                            .listeDecouvertes.first.urlPhoto
                                        : appState.titreCategorie
                                                    .toLowerCase() ==
                                                'investigations'
                                            ? appState.listeInvestigations.first
                                                .urlPhoto
                                            : appState.listeEntreprenariats
                                                .first.urlPhoto,
                                    fit: BoxFit.cover,
                                    // width: size.width * .2,
                                  ),
                                ),
                              )),
                          Positioned(
                              top: size.height * .05,
                              left: size.width * .1,
                              child: Container(
                                height: size.height * .07,
                                width: size.width * .3,
                                // color: colorPrimaire,
                                child: Row(
                                  children: [
                                    Container(
                                      width: size.width * .05,
                                      // color: Colors.blue,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: size.height * .03,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/infiny.png'),
                                                    fit: BoxFit.contain)),
                                          ),
                                          Container(
                                            child: Center(
                                              child: Text(
                                                'THE',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    letterSpacing: 1.5),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: size.width * .2,
                                      height: size.height * .05,
                                      // color: Colors.yellow,
                                      child: Text(
                                        appState.titreCategorie.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 30,
                                            letterSpacing: 3,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                                          fontSize: 72,
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
                                        fontSize: 72,
                                        fontFamily: 'Lato',
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
                                    // textStyle: TextStyle(
                                    //     fontSize: 18,
                                    //     fontWeight: FontWeight.w900,
                                    //     fontFamily: 'Lato'),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    appState.listeDecouvertes.length > 0
                        ? Container(
                            height: size.height * .05,
                            width: size.width,
                            color: Colors.grey[200],
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * .1,
                                ),
                                Text(
                                  'NOS AUTRES ${appState.titreCategorie}'
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    Container(
                      height: size.height * .6,
                      width: size.width,
                      // color: colorPrimaire,
                      child: appState.listeDecouvertes.length > 0
                          ? ListView(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * .05,
                                  vertical: size.height * .03),
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: getListe(),
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FooterLaptop(),
                  ],
                ),
              )),
          Positioned(
              top: 0,
              child: Container(
                height: size.height * .1,
                width: size.width,
                child: Card(
                  elevation: 1,
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
                              titre: "Sport",
                            ),
                            MenuItemLaptop(
                              titre: "Société",
                            ),
                            Spacer(),

                            // DefaultButtonLaptop(
                            //   color: Color.fromRGBO(29, 53, 87, 1),
                            //   text: "Investigation",
                            //   color_text: Colors.white,
                            // ),
                            // DefaultButtonLaptop(
                            //   text: "Reportage ",
                            //   color_text: Colors.white,
                            //   color: Color.fromRGBO(44, 110, 73, 1),
                            // ),
                            Spacer()
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
                                  'Nos Emissions',
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
          liste.add(CardDecouverteArticleLaptop(
            article: appState.listeDecouvertes[i],
          ));
        }
      }
    } else if (appState.titreCategorie.toLowerCase() == 'investigations') {
      for (var i = 0; i < appState.listeInvestigations.length; i++) {
        // print(appState.listeInvestigations[i].titre);
        if (appState.listeInvestigations[i].titre !=
            appState.listeInvestigations[0].titre) {
          liste.add(CardDecouverteArticleLaptop(
            article: appState.listeInvestigations[i],
          ));
        }
      }
    } else {
      for (var i = 0; i < appState.listeEntreprenariats.length; i++) {
        // print(appState.listeEntreprenariats[i].titre);
        if (appState.listeEntreprenariats[i].titre !=
            appState.listeEntreprenariats[0].titre) {
          liste.add(CardDecouverteArticleLaptop(
            article: appState.listeEntreprenariats[i],
          ));
        }
      }
    }

    return liste;
  }
}

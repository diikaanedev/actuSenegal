import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'dart:io' as FILE;

import 'package:actu/devices/laptop/widget/acceuil-top-laptop.dart';
import 'package:actu/devices/laptop/widget/card-scandale-decouverte-reportage-laptop.dart';
import 'package:actu/devices/laptop/widget/get-article-same-categorie-tag.dart';
import 'package:actu/devices/laptop/widget/menu-item-laptop.dart';
import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:social_share/social_share.dart';

class ReadArticleLaptop extends StatefulWidget {
  @override
  _ReadArticleLaptopState createState() => _ReadArticleLaptopState();
}

class _ReadArticleLaptopState extends State<ReadArticleLaptop> {
  bool showMenu = false;
  bool showBreakingNews = false;
  bool chargement = true;
  late Size size;
  var url = window.location.href;

  late Article article;

  @override
  void initState() {
    super.initState();
    if (url.split('/').last != '') {
      WebByDii.get(url: 'post/${url.split('/').last}').then((response) {
        var data = json.decode(response.body);
        setState(() {
          article = Article.fromJsonOne(data);
          appState.setState(() {
            appState.article = article;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
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
              child: ListView(
                physics: BouncingScrollPhysics(),
                // controller: controller,
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
                        CardScandaleDecouverteReportageLaptop(
                          titre: 'Découverte',
                          urlTof: appState.listeDecouvertes.first.urlPhoto,
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        CardScandaleDecouverteReportageLaptop(
                          titre: '#FreeSenegal',
                          urlTof: appState.listeInvestigations.first.urlPhoto,
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        CardScandaleDecouverteReportageLaptop(
                          titre: '#senegal',
                          urlTof: appState.listeInvestigations.first.urlPhoto,
                        ),
                        SizedBox(
                          width: size.width * .03,
                        ),
                        CardScandaleDecouverteReportageLaptop(
                          titre: 'Reportage',
                          urlTof: appState.listeEntreprenariats.first.urlPhoto,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                                  color:
                                      showMenu ? colorPrimaire : Colors.black),
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
                                child: Image.asset('assets/images/logo_tv.png'),
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
        AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: TitreTextLaptop(titre: appState.article.titre),
          content: Container(
              height: size.height * 1,
              width: size.width * 0.6,
              color: colorSecondaire,
              child: ListView(
                children: [
                  Container(
                      height: size.height * .15,
                      width: size.width * .6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/pub.png'),
                              fit: BoxFit.fitWidth))),
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
                                    image:
                                        NetworkImage(appState.article.urlPhoto),
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
                    child: HtmlWidget(
                      appState.article.body,
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                  // appState.article.allFichier.length > 0
                  //     ? Container(
                  //         height: size.height * .2,
                  //         color: Colors.amber,
                  //         child: ListView(
                  //           scrollDirection: Axis.horizontal,
                  //           physics: BouncingScrollPhysics(),
                  //           children: [],
                  //         ),
                  //       )
                  //     : Container(),
                  Container(
                    height: size.height * .05,
                    width: size.width * .6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                  Container(
                      height: size.height * .4,
                      width: size.width * .45,
                      child: Carousel(
                          arrowColor: Colors.black,
                          unActiveIndicatorColor: Colors.blueGrey,
                          showIndicator: true,
                          axis: Axis.horizontal,
                          height: size.height * .4,
                          width: size.width * .4,
                          initialPage: 0,
                          allowWrap: false,
                          type: Types.slideSwiper,
                          indicatorType: IndicatorTypes.bar,
                          activeIndicatorColor: colorPrimaire,
                          indicatorBackgroundColor: Colors.white,
                          showArrow: true,
                          children: getArticleSameCategorieTag(
                              article: appState.article, size: size))
                      // child: ListView(
                      //   physics: BouncingScrollPhysics(),
                      //   scrollDirection: Axis.horizontal,
                      //   children: getArticleSameCategorieTag(
                      //       article: article, size: size),
                      // ),
                      ),
                ],
              )),
          actions: [
            SizedBox(
              width: size.width * .05,
            ),
            RaisedButton(
              // color: colorPrimaire,
              onPressed: () {
                SocialShare.shareWhatsapp("je suis un content");
                // Navigator.of(context).pop();
              },
              child: Text(
                'Share',
                style: TextStyle(color: Colors.white),
              ),
            ),
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
        ),
      ],
    );
  }
}

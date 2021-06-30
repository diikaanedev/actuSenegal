import 'dart:async';
import 'package:actu/devices/laptop/widget/menu-item-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-top-laptop.dart';
import 'package:actu/devices/laptop/widget/widget-article-tag-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class TagCategorieLaptop extends StatefulWidget {
  @override
  _TagCategorieLaptopState createState() => _TagCategorieLaptopState();
}

class _TagCategorieLaptopState extends State<TagCategorieLaptop> {
  late Size size;
  bool showMenu = false;
  double _width = 100;
  double _height = 100;

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
              top: size.height * .1,
              child: Container(
                height: size.height * .93,
                width: size.width,
                // color: colorPrimaire,
                child: Column(
                  // physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: size.height * .05,
                        width: size.width,
                        color: Colors.grey[50],
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .15,
                            ),
                            Text(
                              appState.titreCategorie.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: colorPrimaire),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .8,
                      width: size.width * .8,
                      child: GridView.count(
                        crossAxisCount: 4,
                        physics: BouncingScrollPhysics(),
                        children: getList(),
                        crossAxisSpacing: 24.0,
                        mainAxisSpacing: 24.0,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 24.0),
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // FooterLaptop(),
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
        ],
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> listes = [];
    List<Article> listeArticle = appState.listePost
        .where((element) => element.tag == appState.titreCategorie)
        .toList();

    for (int i = 0;
        i <
            listeArticle
                .where((element) => element.categorie != 'Breaking News')
                .length;
        i++) {
      listes.add(
        WidgetArticleLaptop(
          article: listeArticle
              .where((element) => element.categorie != 'Breaking News')
              .toList()[i],
        ),
      );
    }

    return listes;
  }
}

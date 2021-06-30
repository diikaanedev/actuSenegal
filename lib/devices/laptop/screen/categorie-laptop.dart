import 'package:actu/devices/laptop/widget/actualite-categorie-laptop.dart';
import 'package:actu/devices/laptop/widget/categorie-categorie-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-item-laptop.dart';
import 'package:actu/devices/laptop/widget/menu-top-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

late _CategorieLaptopState categorieLaptopState;

class CategorieLaptop extends StatefulWidget {
  @override
  _CategorieLaptopState createState() {
    categorieLaptopState = _CategorieLaptopState();
    return categorieLaptopState;
  }
}

class _CategorieLaptopState extends State<CategorieLaptop> {
  late Size size;
  bool showMenu = false;
  bool showRecent = false;
  bool showPlusLus = false;
  bool showAutres = false;

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
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height * .15,

                      width: size.width,
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            width: size.width * .25,
                            color: Colors.yellow,
                            child: Center(
                              child: Text(
                                'Espace Pub',
                                style: TextStyle(
                                    fontSize: 38, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: size.height * .15,
                            width: size.width * .4,
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage(appState.titreCategorie
                                                .toLowerCase() ==
                                            'actualites'
                                        ? 'assets/images/actualite.jpg'
                                        : appState.titreCategorie
                                                    .toLowerCase() ==
                                                'politique'
                                            ? 'assets/images/politique.jpg'
                                            : appState.titreCategorie
                                                        .toLowerCase() ==
                                                    'sport'
                                                ? 'assets/images/sport.png'
                                                : appState.titreCategorie
                                                            .toLowerCase() ==
                                                        'société'
                                                    ? 'assets/images/societe.png'
                                                    : appState.titreCategorie
                                                                .toLowerCase() ==
                                                            'investigation'
                                                        ? 'assets/images/investigation.png'
                                                        : appState.titreCategorie
                                                                    .toLowerCase() ==
                                                                'economie'
                                                            ? 'assets/images/economie.jpg'
                                                            : 'assets/images/international_.png'),
                                    fit: BoxFit.contain)),
                          ),
                          Spacer(),
                          Container(
                            width: size.width * .25,
                            color: Colors.yellow,
                            child: Center(
                              child: Text(
                                'Espace Pub',
                                style: TextStyle(
                                    fontSize: 38, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      // color: Colors.red,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: size.height * .8,
                      width: size.width,
                      child:
                          appState.titreCategorie.toLowerCase() == 'actualités'
                              ? ActualieCategorieLaptop()
                              : CategorieCategorieLaptop(),
                    )
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
}

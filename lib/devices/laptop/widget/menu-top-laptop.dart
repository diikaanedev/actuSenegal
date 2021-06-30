import 'package:actu/devices/laptop/widget/card-article-top-menu-laptop.dart';
import 'package:actu/devices/laptop/widget/rubrique-news-laptop-bis.dart';
import 'package:actu/devices/laptop/widget/rubrique-news-laptop.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MenuTopLaptop extends StatefulWidget {
  @override
  _MenuTopLaptopState createState() => _MenuTopLaptopState();
}

class _MenuTopLaptopState extends State<MenuTopLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Positioned(
        top: size.height * .08,
        left: size.width * .15,
        child: Container(
          height: size.height * .7,
          width: size.width * .745,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .7,
                    // color: colorPrimaire,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Container(
                          width: size.width * .07,
                          child: Center(
                            child: Text(
                              'Nos Filiales',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .07,
                        ),
                        Container(
                          width: size.width * .07,
                          child: Center(
                            child: Text(
                              'Rubriques',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .02,
                        ),
                        Container(
                          width: size.width * .14,
                          child: Center(
                            child: Text(
                              'Nos Dernier Article',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: colorPrimaire),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  top: size.height * .05,
                  left: -25,
                  child: Container(
                    height: size.height * .68,
                    width: size.width * .2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * .1,
                          width: size.width * .19,
                          // color: colorPrimaire,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                width: size.width * .05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/actu logo 221.png'))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: size.width * .05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/actu logo 222.png'))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: size.width * .05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/actu logo 223.png'))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * .1,
                          width: size.width * .19,
                          // color: colorPrimaire,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 35,
                              ),
                              Container(
                                width: size.width * .05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/actu logo 224.png'))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: size.width * .05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/actu logo225.png'))),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: size.width * .05,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/digital_Eyes .png'))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        border: Border(
                            right: BorderSide(color: Colors.grey, width: .4))),
                  )),
              Positioned(
                  top: size.height * .05,
                  left: size.width * .16,
                  child: Container(
                    height: size.height * .68,
                    width: size.width * .15,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * .05,
                            ),
                            RubriqueNewsMenuLatop(
                              urlIcon: 'assets/images/actualite_icon.png',
                              titre: 'Actualites',
                            ),
                            RubriqueNewsMenuLatop(
                              urlIcon: 'assets/images/politique_icon.png',
                              titre: 'Politique',
                            ),
                            RubriqueNewsMenuLatop(
                              urlIcon: 'assets/images/economie_icon.png',
                              titre: 'Economie',
                            ),
                            RubriqueNewsMenuLatop(
                              urlIcon: 'assets/images/monde_icon.png',
                              titre: 'International',
                            ),
                            RubriqueNewsMenuLatop(
                              urlIcon: 'assets/images/sport_icon.png',
                              titre: 'Sport',
                            ),
                            SizedBox(
                              height: size.height * .07,
                            ),
                            RubriqueNewMenuBisLaptop(
                              titre: 'Découverte',
                            ),
                            RubriqueNewMenuBisLaptop(
                              titre: 'Investigation',
                            ),
                            RubriqueNewMenuBisLaptop(
                              titre: 'Reportage',
                            ),
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        border: Border(
                            right: BorderSide(color: Colors.grey, width: .4))),
                  )),
              Positioned(
                  top: size.height * .05,
                  left: size.width * .32,
                  child: CardArticleTopMenuLaptop()),
            ],
          ),
        ));
  }
}

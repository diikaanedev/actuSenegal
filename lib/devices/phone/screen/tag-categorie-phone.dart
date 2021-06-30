import 'package:actu/devices/phone/widget/card-categorie-les-plus-lus-phone.dart';
import 'package:actu/devices/phone/widget/menu-top-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TagCategoriePhone extends StatefulWidget {
  @override
  _TagCategoriePhoneState createState() => _TagCategoriePhoneState();
}

class _TagCategoriePhoneState extends State<TagCategoriePhone> {
  late Size size;
  bool isShowMenu = false;
  bool chargement = true;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
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
                                  // fontWeight: FontWeight.w900,
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
                      height: size.height * .05,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/icon_double_foward.png'))),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${appState.titreCategorie} ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * .9,
                      width: size.width,
                      child: Row(
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * .9,
                            // color: colorPrimaire,
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: .78,
                              mainAxisSpacing: 4.0,
                              padding: const EdgeInsets.all(4.0),
                              crossAxisSpacing: 4.0,
                              children: getList(),
                              physics: BouncingScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FooterPhone(),
                    // SizedBox(
                    //   height: size.height * .1,
                    // )
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

  List<Widget> getList() {
    List<Widget> listes = [];

    print(appState.listePost
        .where((element) => element.tag == appState.titreCategorie)
        .length);

    for (int i = 0;
        i <
            appState.listePost
                .where((element) => element.tag == appState.titreCategorie)
                .length;
        i++) {
      listes.add(
        CardCategorieLesPlusLustPhone(
          article: appState.listePost
              .where((element) => element.tag == appState.titreCategorie)
              .toList()[i],
        ),
      );
    }

    return listes;
  }
}

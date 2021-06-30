import 'package:actu/devices/laptop/widget/card-article-other-not-second-laptop.dart';
import 'package:actu/devices/laptop/widget/card-other-not-une-laptop.dart';
import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

class AcceuilDossierRedactionLaptop extends StatefulWidget {
  @override
  _AcceuilDossierRedactionLaptopState createState() =>
      _AcceuilDossierRedactionLaptopState();
}

class _AcceuilDossierRedactionLaptopState
    extends State<AcceuilDossierRedactionLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * .05,
            width: size.width,
            child: TitreTextLaptop(
              titre: 'Dossiers de la Rédaction',
              fontSize: 24,
            ),
          ),
          Container(
            height: size.height * .5,
            width: size.width,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                Container(
                  width: size.width * .2,
                  // color: colorPrimaire,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * .2,
                        height: size.height * .23,
                        child: CardArticleOtherNotSecondLaptop(
                          article: appState.listeRedaction[1],
                          type: 2,
                        ),
                      ),
                      Container(
                        width: size.width * .2,
                        height: size.height * .23,
                        child: CardArticleOtherNotSecondLaptop(
                          article: appState.listeRedaction[2],
                          type: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    width: size.width * .4,
                    // color: colorPrimaire,
                    child: Container(
                      width: size.width * .4,
                      height: size.height * .45,
                      child: CardOtherNotUneLaptop(
                        type: 2,
                        article: appState.listeRedaction[0],
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width * .2,
                  // color: colorPrimaire,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * .2,
                        height: size.height * .23,
                        child: CardArticleOtherNotSecondLaptop(
                          article: appState.listeRedaction[3],
                          type: 2,
                        ),
                      ),
                      Container(
                        width: size.width * .2,
                        height: size.height * .23,
                        child: CardArticleOtherNotSecondLaptop(
                          article: appState.listeRedaction[4],
                          type: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

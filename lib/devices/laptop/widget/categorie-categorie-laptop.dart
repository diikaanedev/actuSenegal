import 'package:actu/devices/laptop/widget/widget-article-tag-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieCategorieLaptop extends StatefulWidget {
  @override
  _CategorieCategorieLaptopState createState() =>
      _CategorieCategorieLaptopState();
}

class _CategorieCategorieLaptopState extends State<CategorieCategorieLaptop> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // Container(
            //   height: constraints.maxHeight * .43,
            //   width: constraints.maxWidth * .9,
            //   // color: Colors.blue,
            //   child: Column(
            //     children: [
            //       Container(
            //         height: constraints.maxHeight * .03,
            //         child: Row(
            //           children: [
            //             SizedBox(
            //               width: constraints.maxWidth * .07,
            //             ),
            //             Text(
            //               'restez connectés pour plus d’infos',
            //               style: TextStyle(
            //                   fontSize: 24,
            //                   fontWeight: FontWeight.bold,
            //                   color: colorPrimaire),
            //             ),
            //             Spacer(),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         height: constraints.maxHeight * .4,
            //         width: constraints.maxWidth * .9,
            //         // color: colorPrimaire,
            //         child: GridView.count(
            //           crossAxisCount: 5,
            //           childAspectRatio: 1,
            //           children: getList(),
            //         ),
            //       ),
            //       Spacer()
            //     ],
            //   ),
            // ),
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              // color: colorPrimaire,
              child: Column(
                children: [
                  Container(
                    height: constraints.maxHeight * .05,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .07,
                        ),
                        Text(
                          'DANS LA MÊME CATEGORIE',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: colorPrimaire),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Container(
                    height: constraints.maxHeight * .9,
                    width: constraints.maxWidth * .9,
                    child: GridView.count(
                      crossAxisCount: 5,
                      childAspectRatio: 1,
                      children: getListSameCategorie(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  List<Widget> getList() {
    List<Widget> listes = [];

    for (var item in appState.listePost
        .where((element) =>
            element.categorie.toLowerCase().trim() ==
            '${appState.titreCategorie}'.toLowerCase().trim())
        .toList()
        .sublist(0, 5)) {
      listes.add(
        WidgetArticleLaptop(
          article: item,
        ),
      );
    }

    return listes;
  }

  List<Widget> getListSameCategorie() {
    List<Widget> listes = [];

    for (var item in appState.listePost
        .where((element) =>
            element.categorie.toLowerCase().trim() ==
            '${appState.titreCategorie}'.toLowerCase().trim())
        .toList()) {
      listes.add(
        WidgetArticleLaptop(
          article: item,
        ),
      );
    }

    // listes.add(Container());

    return listes;
  }
}

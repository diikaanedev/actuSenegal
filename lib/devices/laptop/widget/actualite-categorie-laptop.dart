import 'package:actu/devices/laptop/widget/widget-article-tag-laptop.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

class ActualieCategorieLaptop extends StatefulWidget {
  @override
  _ActualieCategorieLaptopState createState() =>
      _ActualieCategorieLaptopState();
}

class _ActualieCategorieLaptopState extends State<ActualieCategorieLaptop> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            Positioned(
                left: constraints.maxWidth * .05,
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .9,
                  child: GridView.count(
                    crossAxisCount: 5,
                    children: getList(),
                  ),
                ))
          ],
        ),
      );

  List<Widget> getList() {
    List<Widget> listes = [];

    for (var item in appState.listePost
        .where((element) =>
            element.categorie.toLowerCase() == 'Actualites'.toLowerCase())
        .toList()) {
      listes.add(
        WidgetArticleLaptop(
          article: item,
        ),
      );
    }

    return listes;
  }
}

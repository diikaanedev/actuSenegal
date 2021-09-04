import 'package:actu/devices/phone/widget/show-article-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardArticleCategorieTabletBis extends StatefulWidget {
  final Article article;

  const CardArticleCategorieTabletBis({Key? key, required this.article})
      : super(key: key);

  @override
  _CardArticleCategorieTabletBisState createState() =>
      _CardArticleCategorieTabletBisState();
}

class _CardArticleCategorieTabletBisState
    extends State<CardArticleCategorieTabletBis> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        // showDialogArtilePhone(article: widget.article, context: context);
        appState.setState(() {
          appState.article = widget.article;
        });
        Navigator.pushNamed(context, "/${appState.article.id}");
      },
      child: LayoutBuilder(builder: (context, constraint) {
        return Stack(
          children: [
            Card(
              child: Container(
                height: constraint.maxHeight,
                width: constraint.maxWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.article.urlPhoto),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  height: constraint.maxHeight * .1,
                  width: constraint.maxHeight * .1,
                  // color: colorPrimaire,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/logo221_rouge.png'))),
                )),
            Positioned(
                bottom: constraint.maxHeight * .0,
                // left: constraint.maxWidth * .05,
                child: Container(
                  // height: constraint.maxHeight * .2,
                  width: constraint.maxWidth,
                  child: Column(
                    children: [
                      // Spacer(),
                      SizedBox(
                        height: constraint.maxHeight * .05,
                      ),
                      SizedBox(
                        height: constraint.maxHeight * .05,
                      ),
                      Text(
                        widget.article.titre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: constraint.maxHeight * .05,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: constraint.maxHeight * .05,
                      ),
                      SizedBox(
                        height: constraint.maxHeight * .05,
                      ),
                      // Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(5)),
                )),
            Positioned(
                // left: constraint.maxWidth * .06,
                bottom: constraint.maxHeight * .3,
                child: Container(
                  // height: constraint.maxHeight * .03,
                  // width: constraint.maxWidth * .3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' ${widget.article.tag} ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(229, 229, 229, 1)),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: colorPrimaire,
                      borderRadius: BorderRadius.circular(2)),
                ))
          ],
        );
      }),
    );
  }
}

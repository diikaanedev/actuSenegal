import 'package:actu/devices/phone/widget/show-article-phone.dart';
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
        showDialogArtilePhone(article: widget.article, context: context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Stack(
          children: [
            Card(
              child: Container(
                height: size.height,
                width: size.width * .4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.article.urlPhoto),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                top: 15,
                right: 15,
                child: Container(
                  height: 50,
                  width: 100,
                  // color: colorPrimaire,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/logo221_rouge.png'))),
                )),
            Positioned(
                bottom: 10,
                // left: size.width * .05,
                child: Container(
                  height: size.height * .07,
                  width: size.width * .41,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        widget.article.titre,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(5)),
                )),
            Positioned(
                left: size.width * .06,
                bottom: size.height * .07,
                child: Container(
                  // height: size.height * .03,
                  // width: size.width * .3,
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
        ),
      ),
    );
  }
}

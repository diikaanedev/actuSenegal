import 'package:actu/devices/laptop/widget/card-article-other-not-second-laptop.dart';
import 'package:actu/devices/laptop/widget/card-other-not-une-laptop.dart';
import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

class AcceuilActualiteLaptop extends StatefulWidget {
  final String titre;
  final List<Article> liste;
  final int type;

  const AcceuilActualiteLaptop(
      {Key? key, required this.titre, required this.liste, this.type = 1})
      : super(key: key);
  @override
  _AcceuilActualiteLaptopState createState() => _AcceuilActualiteLaptopState();
}

class _AcceuilActualiteLaptopState extends State<AcceuilActualiteLaptop> {
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
              titre: '${widget.titre}',
              fontSize: 24,
            ),
          ),
          Container(
            height: size.height * .75,
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Container(
                        width: size.width * .2,
                        height: size.height * .24,
                        child: CardArticleOtherNotSecondLaptop(
                          article: widget.liste[2],
                          type: widget.type,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * .24,
                        width: size.width * .2,
                        child: CardArticleOtherNotSecondLaptop(
                          type: widget.type,
                          article: widget.liste[3],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * .24,
                        width: size.width * .2,
                        child: CardArticleOtherNotSecondLaptop(
                          type: widget.type,
                          article: widget.liste[4],
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Container(
                        height: size.height * .35,
                        width: size.width * .4,
                        child: CardOtherNotUneLaptop(
                          type: widget.type,
                          article: widget.liste[0],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * .35,
                        width: size.width * .4,
                        child: CardOtherNotUneLaptop(
                          type: widget.type,
                          article: widget.liste[1],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: size.width * .2,
                  // color: colorPrimaire,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Spacer(),
                      Container(
                        height: size.height * .24,
                        width: size.width * .2,
                        child: CardArticleOtherNotSecondLaptop(
                          type: widget.type,
                          article: widget.liste[5],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * .24,
                        width: size.width * .2,
                        child: CardArticleOtherNotSecondLaptop(
                          type: widget.type,
                          article: widget.liste[6],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: size.height * .24,
                        width: size.width * .2,
                        child: CardArticleOtherNotSecondLaptop(
                          type: widget.type,
                          article: widget.liste[7],
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

import 'package:actu/devices/phone/widget/show-article-phone.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardCategorieLesPlusLustPhone extends StatefulWidget {
  final Article article;

  const CardCategorieLesPlusLustPhone({Key? key, required this.article})
      : super(key: key);
  @override
  _CardCategorieLesPlusLustPhoneState createState() =>
      _CardCategorieLesPlusLustPhoneState();
}

class _CardCategorieLesPlusLustPhoneState
    extends State<CardCategorieLesPlusLustPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showDialogArtilePhone(article: widget.article, context: context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Stack(
          children: [
            Container(
              height: size.height * .3,
              width: size.width * .45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
            Positioned(
                child: Container(
              height: size.height * .3,
              width: size.width * .45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.article.urlPhoto),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
            )),
            Positioned(
                top: size.height * .21,
                left: 5,
                child: Container(
                  height: size.height * .03,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: colorPrimaire),
                  child: Center(
                    child: Text(
                      '   ${widget.article.tag.toUpperCase()}   ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            Positioned(
                top: size.height * .25,
                child: Container(
                  height: size.height * .1,
                  width: size.width * .45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(widget.article.titre,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12,
                            // wordSpacing: -2,
                            shadows: [
                              Shadow(blurRadius: 2, color: Colors.black)
                            ],
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                )),
            Positioned(
                top: 5,
                right: 5,
                child: Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/logo221_rouge.png'))),
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:actu/devices/phone/widget/show-article-phone.dart';
import 'package:actu/main.dart';
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
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: () {
          // showDialogArtilePhone(article: widget.article, context: context);
          appState.setState(() {
            appState.article = widget.article;
          });
          Navigator.pushNamed(context, "/${appState.article.id}");
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Stack(
            children: [
              Container(
                height: constraint.maxHeight,
                width: constraint.maxWidth,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
              ),
              Positioned(
                  child: Container(
                height: constraint.maxHeight,
                width: constraint.maxWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.article.urlPhoto),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
              )),
              Positioned(
                  bottom: constraint.maxHeight * .2,
                  left: 5,
                  child: Container(
                    height: constraint.maxHeight * .1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: colorPrimaire),
                    child: Column(
                      children: [
                        Spacer(),
                        SizedBox(
                          height: constraint.maxHeight * .02,
                        ),
                        Text(
                          '   ${widget.article.tag.toUpperCase()}   ',
                          style: TextStyle(
                              fontSize: constraint.maxHeight * .03,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: constraint.maxHeight * .02,
                        ),
                        Spacer(),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: constraint.maxHeight * .0,
                  child: Container(
                    height: constraint.maxHeight * .2,
                    width: constraint.maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(widget.article.titre,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: constraint.maxHeight * .04,
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
    });
  }
}

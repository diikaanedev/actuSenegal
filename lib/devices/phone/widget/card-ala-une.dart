import 'package:actu/devices/phone/widget/show-article-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardArticleAlaUnePhone extends StatefulWidget {
  final Article article;

  const CardArticleAlaUnePhone({Key? key, required this.article})
      : super(key: key);
  @override
  _CardArticleAlaUnePhoneState createState() => _CardArticleAlaUnePhoneState();
}

class _CardArticleAlaUnePhoneState extends State<CardArticleAlaUnePhone> {
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
                width: constraint.maxWidth * .95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.article.urlPhoto),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                top: 5,
                right: 5,
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
                bottom: 10,
                left: constraint.maxWidth * .05,
                child: Container(
                  height: constraint.maxHeight * .2,
                  width: constraint.maxWidth * .8,
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        widget.article.titre,
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: constraint.maxHeight * .04,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 229, 229, 1),
                      borderRadius: BorderRadius.circular(1)),
                )),
            Positioned(
                left: constraint.maxWidth * .075,
                bottom: constraint.maxHeight * .2,
                child: GestureDetector(
                  onTap: () {
                    appState.setState(() {
                      appState.screen = 4;
                      appState.titreCategorie = widget.article.tag;
                    });
                  },
                  child: Container(
                    height: constraint.maxHeight * .1,
                    // width: constraint.maxWidth * .3,
                    child: Column(
                      children: [
                        Spacer(),
                        Text(
                          ' ${widget.article.tag} ',
                          style: TextStyle(
                              fontSize: constraint.maxHeight * .04,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(229, 229, 229, 1)),
                        ),
                        Spacer(),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: colorPrimaire,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                ))
          ],
        );
      }),
    );
  }
}

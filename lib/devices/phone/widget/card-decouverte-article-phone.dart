import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

class CardDecouverteArticlePhone extends StatefulWidget {
  final Article article;

  const CardDecouverteArticlePhone({Key? key, required this.article})
      : super(key: key);
  @override
  _CardDecouverteArticlePhoneState createState() =>
      _CardDecouverteArticlePhoneState();
}

class _CardDecouverteArticlePhoneState
    extends State<CardDecouverteArticlePhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .3,
      width: size.width * .7,
      // color: Colors.yellow,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * .03, horizontal: size.width * .01),
        child: Container(
          height: size.height * .5,
          width: size.width * .7,
          child: Column(
            children: [
              Spacer(),
              Container(
                width: size.width * .7,
                height: size.height * .07,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: size.width * .5,
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            // height: size.height * .05,
                            child: Center(
                              child: Text(
                                '${widget.article.tag}',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            // height: size.height * .04,
                            child: Center(
                              child: Text(
                                '${widget.article.categorie}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Spacer(),
                          // Spacer(),
                          // Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * .15,
                      // color: colorPrimaire,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (appState.titreCategorie.toLowerCase() ==
                                  'découverte') {
                                appState.setState(() {
                                  appState.listeDecouvertes = [];
                                  appState.listeDecouvertes.add(widget.article);
                                  for (var item in appState.listePost) {
                                    if (item.categorie.toLowerCase() ==
                                        'découverte') {
                                      if (item.id == widget.article.id) {
                                        appState.listeDecouvertes.add(item);
                                      }
                                    }
                                  }
                                });
                              } else if (appState.titreCategorie
                                      .toLowerCase() ==
                                  'investigations') {
                                appState.setState(() {
                                  appState.listeInvestigations = [];
                                  appState.listeInvestigations
                                      .add(widget.article);
                                  for (var item in appState.listePost) {
                                    if (item.categorie.toLowerCase() ==
                                        'investigation') {
                                      if (item.id == widget.article.id) {
                                        appState.listeInvestigations.add(item);
                                      }
                                    }
                                  }
                                });
                              } else {
                                appState.setState(() {
                                  appState.listeEntreprenariats = [];
                                  appState.listeEntreprenariats
                                      .add(widget.article);
                                  for (var item in appState.listePost) {
                                    if (item.categorie.toLowerCase() ==
                                        'entreprenariat') {
                                      if (item.id == widget.article.id) {
                                        appState.listeEntreprenariats.add(item);
                                      }
                                    }
                                  }
                                });
                              }
                            },
                            child: Container(
                              width: size.width * .15,
                              height: size.height * .04,
                              child: Center(
                                child: Text(
                                  'Voir +',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromRGBO(88, 139, 139, 1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
              )
            ],
          ),
          // color: colorPrimaire,
          decoration: BoxDecoration(
              // color: colorPrimaire,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: .5)],
              image: DecorationImage(
                  image: NetworkImage(widget.article.urlPhoto),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

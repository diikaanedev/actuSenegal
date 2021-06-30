import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/devices/phone/widget/article-text-laptop.dart';
import 'package:actu/devices/phone/widget/card-article-categorie-tablet.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

showDialogArtilePhone({
  required BuildContext context,
  required Article article,
}) async {
  Size size = MediaQuery.of(context).size;
  if (article.allFichier == null) {
    article.allFichier = [];
  }
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            elevation: 0,
            title: TitreTextLaptop(titre: article.titre),
            content: Container(
              height: size.height * .9,
              width: size.width * 1.2,
              color: colorSecondaire,
              child: Container(
                height: size.height * 1,
                width: size.width,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      height: size.height * .15,
                      width: size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/bannière-facebook.png'),
                              fit: BoxFit.fitWidth)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: size.height * 0.25,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          // Container(
                          //   width: size.width * .1,
                          //   child: TitreTextLaptop(titre: 'PUB REGIE'),
                          // ),
                          Container(
                            width: size.width * .8,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(article.urlPhoto),
                                    fit: BoxFit.contain)),
                          ),
                          Spacer(),

                          // Container(
                          //   width: size.width * .1,
                          //   child: TitreTextLaptop(titre: 'PUB REGIE'),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      height: 24,
                      child: TitreTextLaptop(
                        titre: article.tag,
                        fontSize: 16,
                      ),
                    ),
                    ArticeTextLaptop(
                      titre: article.body,
                    ),
                    Container(
                      height: size.height * .03,
                      width: size.width,
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            '${article.nameAuthor}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            ' , Journaliste ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    article.allFichier.length > 0
                        ? Container(
                            height: size.height * 0.19,
                            //color: Colors.amber,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: [],
                            ),
                          )
                        : Container(),
                    Container(
                      height: size.height * .3,
                      width: size.width,
                      // color: colorPrimaire,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: getList(article: article),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}

List<Widget> getList({required Article article}) {
  List<Widget> liste = [];
  for (var item in appState.listePost
      .where((element) =>
          element.tag.toLowerCase() == article.tag.toLowerCase() &&
          element.titre == element.titre)
      .toList()) {
    liste.add(CardArticleCategorieTabletBis(
      article: item,
    ));
  }
  return liste;
}

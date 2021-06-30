import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardNewOtherNotUne extends StatefulWidget {
  final Article article;

  const CardNewOtherNotUne({Key? key, required this.article}) : super(key: key);
  @override
  _CardNewOtherNotUneState createState() => _CardNewOtherNotUneState();
}

class _CardNewOtherNotUneState extends State<CardNewOtherNotUne> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appState.setState(() {
          appState.article = widget.article;
        });
        Navigator.pushNamed(context, '/${appState.article.id}');
        // showDialogArtile(article: widget.article, context: context);
        // Navigator.pop(context);
      },
      child: LayoutBuilder(builder: (context, constraint) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: .1,
          child: Container(
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            //color: Colors.red,
            child: Stack(
              children: [
                Container(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(widget.article.urlPhoto),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: constraint.maxHeight * .1,
                    left: constraint.maxWidth * 0.005,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Container(
                          height: constraint.maxHeight * .2,
                          width: constraint.maxWidth * .95,
                          // color: colorSecondaire,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Text(
                              '  ${widget.article.titre}  '.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: constraint.maxHeight * .04,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  bottom: constraint.maxHeight * .28,
                  left: constraint.maxWidth * 0.007,
                  child: Center(
                    child: Container(
                      height: constraint.maxHeight * .1,
                      decoration: BoxDecoration(
                          color: colorPrimaire,
                          borderRadius: BorderRadius.circular(2)),
                      // width: constraint.maxWidth / 8,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            appState.setState(() {
                              appState.titreCategorie = widget.article.tag;
                              appState.screen = 4;
                            });
                          },
                          child: Text(
                            '    ${widget.article.tag}    '.toUpperCase(),
                            style: TextStyle(
                                fontSize: constraint.maxHeight * .04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardArticleOtherNotSecondLaptop extends StatefulWidget {
  final Article article;
  final int type;

  const CardArticleOtherNotSecondLaptop(
      {Key? key, required this.article, this.type = 1})
      : super(key: key);
  @override
  _CardArticleOtherNotSecondLaptopState createState() =>
      _CardArticleOtherNotSecondLaptopState();
}

class _CardArticleOtherNotSecondLaptopState
    extends State<CardArticleOtherNotSecondLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        appState.setState(() {
          appState.article = widget.article;
        });
        Navigator.pushNamed(context, '/${appState.article.id}');
        // showDialogArtile(article: widget.article, context: context);
      },
      child: LayoutBuilder(builder: (context, constraint) {
        return Container(
          height: constraint.maxHeight,
          width: constraint.maxWidth,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                  bottom: constraint.maxHeight * 0.1,
                  left: constraint.maxWidth * .01,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      color: widget.type == 1 ? Colors.grey[800] : Colors.white,
                      child: Center(
                        child: Container(
                          height: constraint.maxHeight * .2,
                          width: constraint.maxWidth * .95,
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              '  ${widget.article.titre}  ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: constraint.maxHeight * .05,
                                  fontWeight: FontWeight.w900,
                                  color: widget.type != 1
                                      ? Colors.grey[800]
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              widget.type == 1
                  ? Positioned(
                      bottom: constraint.maxHeight * 0.27,
                      left: constraint.maxWidth * .01,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          color: colorPrimaire,
                          child: Center(
                            child: Container(
                              height: constraint.maxHeight * .1,
                              // width: constraint.maxWidth * 0.20 - 5,
                              decoration: BoxDecoration(
                                color: colorPrimaire,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    appState.setState(() {
                                      appState.titreCategorie =
                                          widget.article.tag;
                                      appState.screen = 4;
                                    });
                                  },
                                  child: Text(
                                    '   ${widget.article.tag}   '.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: constraint.maxHeight * .05,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  : Positioned(
                      bottom: constraint.maxHeight * 0.27,
                      left: constraint.maxWidth * .02,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 1,
                          color: colorPrimaire,
                          child: Center(
                            child: Container(
                              height: constraint.maxHeight * .1,

                              // width: constraint.maxWidth * 0.20 - 5,
                              decoration: BoxDecoration(
                                color: colorPrimaire,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    appState.setState(() {
                                      appState.titreCategorie =
                                          widget.article.tag;
                                      appState.screen = 4;
                                    });
                                  },
                                  child: Text(
                                    '   ${widget.article.tag}   '.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: constraint.maxHeight * .05,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
            ],
          ),
        );
      }),
    );
  }
}

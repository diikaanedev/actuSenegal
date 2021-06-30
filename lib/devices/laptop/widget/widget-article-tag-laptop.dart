import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class WidgetArticleLaptop extends StatefulWidget {
  final Article article;

  const WidgetArticleLaptop({Key? key, required this.article})
      : super(key: key);
  @override
  _WidgetArticleLaptopState createState() => _WidgetArticleLaptopState();
}

class _WidgetArticleLaptopState extends State<WidgetArticleLaptop> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            // showDialogArtile(article: widget.article, context: context);
            appState.setState(() {
              appState.article = widget.article;
            });
            Navigator.pushNamed(context, '/${appState.article.id}');
          },
          child: Container(
            height: constraints.maxHeight * .2,
            width: constraints.maxWidth * .2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                // color: colorPrimaire,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(widget.article.urlPhoto),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        top: constraints.maxHeight * .7,
                        child: Container(
                          height: constraints.maxHeight * .2,
                          width: constraints.maxWidth * .95,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              '  ${widget.article.titre}  ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: constraints.maxHeight * .04,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: constraints.maxHeight * .2,
                        child: Container(
                          height: constraints.maxHeight * .12,
                          // color: colorPrimaire,
                          child: GestureDetector(
                            onTap: () {
                              appState.setState(() {
                                appState.titreCategorie = widget.article.tag;
                                appState.screen = 4;
                              });
                            },
                            child: Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * .12,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    color: colorPrimaire,
                                    height: constraints.maxHeight * .15,
                                    child: Column(
                                      children: [
                                        Spacer(),
                                        Text(
                                          '      ${widget.article.tag}      ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .04,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

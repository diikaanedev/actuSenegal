import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardOtherNotUneLaptop extends StatefulWidget {
  final Article article;
  final int type;

  const CardOtherNotUneLaptop({Key? key, required this.article, this.type = 1})
      : super(key: key);
  @override
  _CardOtherNotUneLaptopState createState() => _CardOtherNotUneLaptopState();
}

class _CardOtherNotUneLaptopState extends State<CardOtherNotUneLaptop> {
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            //color: Colors.red,
            child: Stack(
              children: [
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(widget.article.urlPhoto),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: constraints.maxHeight * 0.2,
                    left: constraints.maxWidth * 0.005,
                    child: Card(
                      elevation: 5,
                      child: Center(
                        child: Container(
                          height: constraints.maxHeight * .15,
                          width: constraints.maxWidth * .95,
                          color: widget.type == 1
                              ? Colors.grey[800]
                              : Colors.white,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '${widget.article.titre}',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .05,
                                    fontWeight: FontWeight.w700,
                                    color: widget.type != 1
                                        ? Colors.grey[800]
                                        : Colors.white),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )),
                widget.type == 1
                    ? Positioned(
                        bottom: constraints.maxHeight * 0.35,
                        left: constraints.maxWidth * 0.007,
                        child: Center(
                          child: Container(
                            height: constraints.maxHeight * .1,
                            color: colorPrimaire,
                            width: constraints.maxWidth * .3,
                            child: Column(
                              children: [
                                Spacer(),
                                GestureDetector(
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
                                        fontSize: constraints.maxHeight * .03,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        bottom: constraints.maxHeight * 0.35,
                        right: constraints.maxWidth * 0.015,
                        child: Center(
                          child: Container(
                            height: constraints.maxHeight * .1,
                            color: colorPrimaire,
                            // width: constraints.maxWidth / 8,
                            child: Column(
                              children: [
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    appState.setState(() {
                                      appState.titreCategorie =
                                          widget.article.tag;
                                      appState.screen = 4;
                                    });
                                  },
                                  child: Text(
                                    ' ${widget.article.tag} '.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .03,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}

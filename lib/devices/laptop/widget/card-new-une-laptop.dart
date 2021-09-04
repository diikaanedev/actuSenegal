import 'package:actu/devices/laptop/screen/read-article-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardNewUneLaptop extends StatefulWidget {
  final Article article;

  const CardNewUneLaptop({Key? key, required this.article}) : super(key: key);
  @override
  _CardNewUneLaptopState createState() => _CardNewUneLaptopState();
}

class _CardNewUneLaptopState extends State<CardNewUneLaptop> {
  late Size size;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        appState.setState(() {
          appState.article = widget.article;
        });
        Navigator.pushNamed(context, "/${appState.article.id}");
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       fullscreenDialog: true,
        //       builder: (context) => ReadArticleLaptop(),
        //     ));
        // showDialogArtile(article: widget.article, context: context);
      },
      child: LayoutBuilder(builder: (context, constraint) {
        return Card(
          elevation: .5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
                    bottom: constraint.maxHeight * 0.2,
                    left: constraint.maxWidth * 0.02,
                    child: Card(
                      // color: colorPrimaire.withOpacity(0.2),
                      elevation: 5,
                      child: Center(
                        child: Container(
                          height: constraint.maxHeight * .1,
                          width: constraint.maxWidth * .94,
                          decoration: BoxDecoration(
                            color: colorSecondaire,
                          ),
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                '  ${widget.article.titre}  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: constraint.maxHeight * .025,
                                    fontWeight: FontWeight.w900),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    left: constraint.maxWidth * 0.022,
                    bottom: constraint.maxHeight * 0.3,
                    child: Center(
                        child: GestureDetector(
                      onTap: () {
                        appState.setState(() {
                          appState.titreCategorie = widget.article.tag;
                          appState.screen = 4;
                        });
                      },
                      child: Container(
                          height: constraint.maxHeight * .05,
                          // width: constraint.maxWidth / 12,
                          decoration: BoxDecoration(
                              color: colorPrimaire,
                              borderRadius: BorderRadius.circular(2)),
                          child: Center(
                            child: Text(
                              '   ${widget.article.tag.toUpperCase()}   ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: constraint.maxHeight * .025,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ))),
              ],
            ),
          ),
        );
      }),
    );
  }
}

import 'package:actu/devices/phone/widget/show-article-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardDialogTagLaptop extends StatefulWidget {
  final Article article;

  const CardDialogTagLaptop({Key? key, required this.article})
      : super(key: key);
  @override
  _CardDialogTagLaptopState createState() => _CardDialogTagLaptopState();
}

class _CardDialogTagLaptopState extends State<CardDialogTagLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: () {
          appState.setState(() {
            appState.article = widget.article;
          });
          // showDialogArtilePhone(article: widget.article, context: context);
          Navigator.pushNamed(context, '/${appState.article.id}');
          // Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                    bottom: constraint.maxHeight * .1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.white.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Container(
                            height: constraint.maxHeight * .1,
                            width: size.width * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '${widget.article.titre}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: constraint.maxHeight * .19,
                    // left: size.width * .045,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.white.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Center(
                          child: Container(
                            height: constraint.maxHeight * .07,
                            // width: size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: colorPrimaire,
                            ),
                            child: Center(
                              child: Text(
                                ' ${widget.article.tag} '.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}

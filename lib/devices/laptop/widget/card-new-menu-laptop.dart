import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardNewMenuLaptop extends StatefulWidget {
  final Article article;

  const CardNewMenuLaptop({Key? key, required this.article}) : super(key: key);
  @override
  _CardNewMenuLaptopState createState() => _CardNewMenuLaptopState();
}

class _CardNewMenuLaptopState extends State<CardNewMenuLaptop> {
  late Size size;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MouseRegion(
      onHover: (evt) {
        setState(() {
          isSelected = true;
        });
      },
      onExit: (event) {
        setState(() {
          isSelected = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          appState.setState(() {
            appState.article = widget.article;
          });
          Navigator.pushNamed(context, '/${appState.article.id}');
          // showDialogArtile(article: widget.article, context: context);
        },
        child: Container(
          height: size.height * .15,
          width: size.width * .21,
          child: Card(
            elevation: isSelected ? 5 : 2,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: size.height * .15,
                  width: size.width * .21,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.article.urlPhoto),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: size.height * .06,
                    left: 5,
                    child: GestureDetector(
                      onTap: () {
                        appState.setState(() {
                          appState.titreCategorie = widget.article.tag;
                          appState.screen = 4;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // color: colorPrimaire
                        ),
                        child: Text(
                          '  ${widget.article.tag}  '.toUpperCase(),
                          style: TextStyle(shadows: [
                            BoxShadow(blurRadius: 2, color: Colors.black)
                          ], color: colorPrimaire, fontWeight: FontWeight.w900),
                        ),
                      ),
                    )),
                Positioned(
                    top: size.height * .08,
                    left: 5,
                    child: Container(
                      height: size.height * .1,
                      width: size.width * .15,
                      // color: Colors.red,
                      decoration: BoxDecoration(),
                      child: Text(
                        widget.article.titre,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white,
                            fontSize: 17,
                            shadows: [
                              Shadow(blurRadius: 2, color: Colors.black)
                            ],
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

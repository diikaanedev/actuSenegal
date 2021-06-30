import 'package:actu/devices/phone/widget/show-article-phone.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardCategorieLesAutresPhone extends StatefulWidget {
  final Article article;

  const CardCategorieLesAutresPhone({Key? key, required this.article})
      : super(key: key);
  @override
  _CardCategorieLesAutresPhoneState createState() =>
      _CardCategorieLesAutresPhoneState();
}

class _CardCategorieLesAutresPhoneState
    extends State<CardCategorieLesAutresPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showDialogArtilePhone(article: widget.article, context: context);
      },
      child: Stack(
        children: [
          Container(
            height: size.height * .15,
            width: size.width * .45,
            // color: colorPrimaire,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.article.urlPhoto),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5)),
          ),
          Positioned(
              top: 2,
              right: 10,
              child: Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo221_rouge.png'))),
              )),
          Positioned(
              // top: size.height * .065,
              // left: size.width * .025,
              bottom: 0,
              child: Container(
                height: size.height * .05,
                width: size.width * .45,
                color: Colors.grey[50],
                child: Center(
                    child: Text(
                  widget.article.titre,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                )),
              )),
          Positioned(
              top: size.height * .1,
              child: Container(
                height: size.height * .03,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: colorPrimaire),
                child: Text(
                  '  ${widget.article.tag}  ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1.5,
                        )
                      ]),
                ),
              )),
        ],
      ),
    );
  }
}

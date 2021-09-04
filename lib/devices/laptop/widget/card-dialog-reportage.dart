import 'package:actu/devices/laptop/widget/read-reportage-dialog.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardDialogREportageLaptop extends StatefulWidget {
  final Article article;

  const CardDialogREportageLaptop({Key? key, required this.article})
      : super(key: key);
  @override
  _CardDialogREportageLaptopState createState() =>
      _CardDialogREportageLaptopState();
}

class _CardDialogREportageLaptopState extends State<CardDialogREportageLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
          readReportage(context, widget.article);
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

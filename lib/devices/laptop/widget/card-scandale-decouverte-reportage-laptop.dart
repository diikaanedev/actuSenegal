import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CardScandaleDecouverteReportageLaptop extends StatefulWidget {
  final String titre;
  final String urlTof;

  const CardScandaleDecouverteReportageLaptop(
      {Key? key, required this.titre, required this.urlTof})
      : super(key: key);
  @override
  _CardScandaleDecouverteReportageLaptopState createState() =>
      _CardScandaleDecouverteReportageLaptopState();
}

class _CardScandaleDecouverteReportageLaptopState
    extends State<CardScandaleDecouverteReportageLaptop> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        child: Stack(
          children: [
            Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Positioned(
                child: Container(
              width: constraints.maxWidth,
              child: Text(widget.titre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontSize: constraints.maxHeight * .1,
                      color: colorPrimaire,
                      fontWeight: FontWeight.w900)),
            )),
            Positioned(
              top: constraints.maxHeight * .15,
              child: widget.titre.toLowerCase() != "programmes"
                  ? Container(
                      height: constraints.maxHeight * .85,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.urlTof,
                              ),
                              fit: BoxFit.cover)),
                    )
                  : Container(
                      height: constraints.maxHeight * .85,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.urlTof,
                              ),
                              fit: BoxFit.contain)),
                    ),
            ),
            Positioned(
                bottom: constraints.maxHeight * .05,
                left: constraints.maxWidth * .05,
                child: widget.titre.toLowerCase() == "reportages"
                    ? Container(
                        // height: constraints.maxHeight * .1,
                        width: constraints.maxWidth * .9,
                        decoration: BoxDecoration(
                            color: colorPrimaire,
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight * .05,
                            ),
                            Container(
                                width: constraints.maxWidth * .9,
                                child: Center(
                                    child: Text(
                                  appState.listeReportages.first.titre,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: constraints.maxHeight * .07),
                                ))),
                            SizedBox(
                              height: constraints.maxHeight * .05,
                            ),
                          ],
                        ),
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }
}

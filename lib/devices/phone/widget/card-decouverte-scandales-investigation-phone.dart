import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardDecouverteScandaleInvestigationPhone extends StatefulWidget {
  final String titre;
  final String urlTof;

  const CardDecouverteScandaleInvestigationPhone(
      {Key? key, required this.titre, required this.urlTof})
      : super(key: key);
  @override
  _CardDecouverteScandaleInvestigationPhoneState createState() =>
      _CardDecouverteScandaleInvestigationPhoneState();
}

class _CardDecouverteScandaleInvestigationPhoneState
    extends State<CardDecouverteScandaleInvestigationPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * .3,
          width: size.width * .8,
          // color: colorPrimaire,
        ),
        Positioned(
          top: size.height * .04,
          child: Container(
            height: size.height * .2,
            width: size.width * .75,
            child: Image.network(
              widget.urlTof,
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: size.width * .225,
            child: Container(
                height: size.height * .04,
                width: size.width * .35,
                // color: Colors.black,
                child: Center(
                  child: Text(
                    '${widget.titre}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: colorPrimaire),
                  ),
                ))),
        if (widget.titre.toLowerCase() == 'Reportage'.toLowerCase())
          Positioned(
              bottom: 0,
              child: Container(
                color: colorSecondaire,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Text(
                      'Combat de Survie',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: colorPrimaire),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              ))
      ],
    );
  }
}
 // if (widget.titre == '#FreeSénégal') {
        //   appState.setState(() {
        //     appState.titreCategorie = widget.titre;
        //     appState.screen = 3;
        //   });
        // } else if (widget.titre == '#Sénégal') {
        //   appState.setState(() {
        //     appState.titreCategorie = widget.titre;
        //     appState.screen = 3;
        //   });
        // } else {
        //   appState.setState(() {
        //     appState.titreCategorie = widget.titre;
        //     appState.screen = 2;
        //   });
        // }
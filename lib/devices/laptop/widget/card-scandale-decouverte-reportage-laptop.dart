import 'package:actu/devices/laptop/widget/titre-text-laptop.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

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
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      // onTap: () async {
      //   if (widget.titre.toLowerCase() == 'investigation'.toLowerCase()) {
      //     appState.setState(() {
      //       appState.titreCategorie = widget.titre;
      //       appState.screen = 1;
      //     });
      //   } else {
      //     if (widget.titre.toLowerCase() == '#freeSenegal'.toLowerCase()) {
      //       appState.setState(() {
      //         appState.titreCategorie = widget.titre;
      //         appState.screen = 3;
      //       });
      //     } else if (widget.titre.toLowerCase() == '#Senegal'.toLowerCase()) {
      //       appState.setState(() {
      //         appState.titreCategorie = widget.titre;
      //         appState.screen = 3;
      //       });
      //     } else {
      //       AlertDialog(
      //         content: Container(
      //           height: 200,
      //           width: size.width * .6,
      //           child: Center(
      //             child: Text('En Construction'),
      //           ),
      //         ),
      //       );
      //     }
      //   }
      // },
      child: Stack(
        children: [
          Container(
            width: widget.titre.toLowerCase() == '#freesenegal'.toLowerCase()
                ? size.width * .2
                : widget.titre.toLowerCase() == '#senegal'.toLowerCase()
                    ? size.width * .2
                    : size.width * .16,
            height: size.height * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // color: colorPrimaire,
              // image: DecorationImage(
              //     image: AssetImage('assets/images/FreeSenegal.jpg'),
              //     fit: BoxFit.fill)
            ),
          ),
          Positioned(
              child: Container(
            height: size.height * .05,
            width: widget.titre.toLowerCase() == '#freesenegal'.toLowerCase()
                ? size.width * .2
                : widget.titre.toLowerCase() == '#senegal'.toLowerCase()
                    ? size.width * .2
                    : size.width * .16,
            child: TitreTextLaptop(
              titre: widget.titre.toLowerCase() == '#freesenegal'.toLowerCase()
                  ? ''
                  : widget.titre.toLowerCase() == '#senegal'.toLowerCase()
                      ? ''
                      : widget.titre,
              fontSize: 20,
            ),
          )),
          Positioned(
              top: size.height * .05,
              left: 0,
              child: Container(
                height: size.height * .15,
                width:
                    widget.titre.toLowerCase() == '#freesenegal'.toLowerCase()
                        ? size.width * .2
                        : widget.titre.toLowerCase() == '#senegal'.toLowerCase()
                            ? size.width * .2
                            : size.width * .16,
                child:
                    widget.titre.toLowerCase() == '#freesenegal'.toLowerCase()
                        ? Image.asset('assets/images/FreeSenegal.jpg',
                            fit: BoxFit.contain)
                        : widget.titre.toLowerCase() == '#senegal'.toLowerCase()
                            ? Image.asset('assets/images/#senegal.jpg',
                                fit: BoxFit.contain)
                            : Image.network(
                                widget.urlTof,
                                fit: BoxFit.cover,
                              ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  // image: DecorationImage(
                  //     image: NetworkImage(widget.urlTof),
                  //     fit: BoxFit.fitWidth)
                  // color: colorPrimaire,
                ),
              ))
        ],
      ),
    );
  }
}

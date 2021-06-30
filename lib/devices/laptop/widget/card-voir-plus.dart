import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardVoirPLus extends StatefulWidget {
  final String categorie;

  const CardVoirPLus({Key? key, required this.categorie}) : super(key: key);
  @override
  _CardVoirPLusState createState() => _CardVoirPLusState();
}

class _CardVoirPLusState extends State<CardVoirPLus> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        appState.setState(() {
          appState.titreCategorie = widget.categorie;
          appState.screen = 1;
        });
      },
      child: Container(
        height: size.height * .05,
        width: size.width,
        child: Row(
          children: [
            Spacer(),
            Container(
              width: size.width * .07,
              height: size.height * .03,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: colorPrimaire),
              child: Center(
                child: Text(
                  ' Voir + ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(
              width: size.width * .1,
            )
          ],
        ),
      ),
    );
  }
}

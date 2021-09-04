import 'package:actu/devices/laptop/widget/card-voir-plus.dart';
import 'package:actu/devices/phone/screen/categorie-phone.dart';
import 'package:actu/devices/phone/screen/home-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardTitrePhone extends StatefulWidget {
  final String titre;

  const CardTitrePhone({Key? key, required this.titre}) : super(key: key);
  @override
  _CardTitrePhoneState createState() => _CardTitrePhoneState();
}

class _CardTitrePhoneState extends State<CardTitrePhone> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (widget.titre.toLowerCase() != 'À LA UNE'.toLowerCase()) {
          if (appState.screen == 0) {
            homePhoneState.setState(() {
              homePhoneState.isShowMenu = false;
            });
          } else if (appState.screen == 1) {
            categoriePhoneState.setState(() {
              categoriePhoneState.isShowMenu = false;
            });
          }

          appState.setState(() {
            appState.titreCategorie = widget.titre;
            appState.screen = 1;
          });
        }
      },
      child: Container(
        height: size.height * .05,
        width: size.width,
        color: colorPrimaire,
        child: Row(
          children: [
            SizedBox(
              width: size.width * .05,
            ),
            Text(
              widget.titre.toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            if (widget.titre.toLowerCase() != 'À LA UNE'.toLowerCase())
              Text(
                'Voir +',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold),
              ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }
}

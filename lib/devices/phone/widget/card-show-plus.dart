import 'package:actu/devices/phone/screen/categorie-phone.dart';
import 'package:actu/devices/phone/screen/home-phone.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

class CardShowPlus extends StatefulWidget {
  final String categorie;
  const CardShowPlus({Key? key, required this.categorie}) : super(key: key);

  @override
  _CardShowPlusState createState() => _CardShowPlusState();
}

class _CardShowPlusState extends State<CardShowPlus> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
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
          appState.titreCategorie = widget.categorie;
          appState.screen = 1;
        });
      },
      child: LayoutBuilder(builder: (context, constraint) {
        return Stack(
          children: [
            Card(
              child: Container(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth * .95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.searchpng.com/wp-content/uploads/2019/03/Add-Icon-PNG.png'),
                    ),
                  )),
            ),
          ],
        );
      }),
    );
  }
}

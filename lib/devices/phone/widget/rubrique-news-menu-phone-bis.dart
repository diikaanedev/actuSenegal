import 'package:actu/devices/phone/screen/home-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class RubriqueNewMenuBisPhone extends StatefulWidget {
  final String titre;

  const RubriqueNewMenuBisPhone({Key? key, required this.titre})
      : super(key: key);
  @override
  _RubriqueNewMenuBisPhoneState createState() =>
      _RubriqueNewMenuBisPhoneState();
}

class _RubriqueNewMenuBisPhoneState extends State<RubriqueNewMenuBisPhone> {
  late Size size;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return MouseRegion(
      onHover: (event) {
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
          if (appState.screen == 0) {
            homePhoneState.setState(() {
              homePhoneState.isShowMenu = false;
            });
          }
          // else if (appState.screen == 1) {
          //   categoriePhoneState.setState(() {
          //     categoriePhoneState.isShowMenu = false;
          //   });
          // } else if (appState.screen == 2) {
          //   categorieDecouverteInvestigationScandalesPhoneState.setState(() {
          //     categorieDecouverteInvestigationScandalesPhoneState.isShowMenu =
          //         false;
          //   });
          // }
          if (widget.titre.toLowerCase() == 'investigation') {
            appState.setState(() {
              appState.titreCategorie = widget.titre;
              appState.screen = 1;
            });
          } else {
            appState.setState(() {
              appState.titreCategorie = widget.titre;
              appState.screen = 2;
            });
          }
          // appState.setState(() {
          //   appState.titre_categorie = widget.titre;
          //   appState.screen = 2;
          // });
        },
        child: Container(
            height: size.height * 0.07,
            width: size.width * .5,
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                ' ${widget.titre} ',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    shadows: isSelected
                        ? [
                            BoxShadow(blurRadius: 10, color: Colors.blue),
                            BoxShadow(blurRadius: 20, color: Colors.black)
                          ]
                        : [],
                    color: isSelected ? colorPrimaire : Colors.black),
              ),
            )),
      ),
    );
  }
}

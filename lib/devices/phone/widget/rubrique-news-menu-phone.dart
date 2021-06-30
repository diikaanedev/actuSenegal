import 'package:actu/devices/phone/screen/categorie-phone.dart';
import 'package:actu/devices/phone/screen/home-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class RubriqueNewMenuPhone extends StatefulWidget {
  final String titre;
  final String urlIcon;

  const RubriqueNewMenuPhone(
      {Key? key, required this.titre, required this.urlIcon})
      : super(key: key);
  @override
  _RubriqueNewMenuPhoneState createState() => _RubriqueNewMenuPhoneState();
}

class _RubriqueNewMenuPhoneState extends State<RubriqueNewMenuPhone> {
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
          } else if (appState.screen == 1) {
            categoriePhoneState.setState(() {
              categoriePhoneState.isShowMenu = false;
            });
          }
          //else if (appState.screen == 2) {
          //   categorieDecouverteInvestigationScandalesPhoneState.setState(() {
          //     categorieDecouverteInvestigationScandalesPhoneState.isShowMenu =
          //         false;
          //   });
          // }
          appState.setState(() {
            appState.titreCategorie = widget.titre;
            appState.screen = 1;
          });
        },
        child: Container(
          height: size.height * 0.07,
          width: size.width * .4,
          // color: colorPrimaire,
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${widget.urlIcon}'))),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                '${widget.titre}',
                style: TextStyle(
                    fontSize: isSelected ? 18 : 14,
                    color: isSelected ? colorPrimaire : Colors.black,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w200),
              )
            ],
          ),
        ),
      ),
    );
  }
}

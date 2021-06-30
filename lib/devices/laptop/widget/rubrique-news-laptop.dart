import 'package:actu/devices/laptop/screen/home-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class RubriqueNewsMenuLatop extends StatefulWidget {
  final String titre;
  final String urlIcon;

  const RubriqueNewsMenuLatop(
      {Key? key, required this.titre, required this.urlIcon})
      : super(key: key);
  @override
  _RubriqueNewsMenuLatopState createState() => _RubriqueNewsMenuLatopState();
}

class _RubriqueNewsMenuLatopState extends State<RubriqueNewsMenuLatop> {
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
          appState.setState(() {
            appState.titreCategorie = widget.titre;
            appState.screen = 1;
          });
          if (appState.screen == 0) {
            homeLaptopState.setState(() {
              homeLaptopState.showMenu = false;
            });
          }
          // else if (appState.screen == 1) {
          //   categorieLaptopState.setState(() {
          //     categorieLaptopState.showMenu = false;
          //   });
          // } else if (appState.screen == 2) {
          //   categorieScandaleDecouverteOtherState.setState(() {
          //     categorieScandaleDecouverteOtherState.showMenu = false;
          //   });
          // }
        },
        child: Container(
          height: size.height * 0.05,
          width: size.width * .1,
          // color: colorPrimaire,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 25,
                width: 25,
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

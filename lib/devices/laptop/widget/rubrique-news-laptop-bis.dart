import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class RubriqueNewMenuBisLaptop extends StatefulWidget {
  final String titre;

  const RubriqueNewMenuBisLaptop({Key? key, required this.titre})
      : super(key: key);
  @override
  _RubriqueNewMenuBisLaptopState createState() =>
      _RubriqueNewMenuBisLaptopState();
}

class _RubriqueNewMenuBisLaptopState extends State<RubriqueNewMenuBisLaptop> {
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
        },
        child: Container(
            height: size.height * 0.04,
            width: size.width * .1,
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                ' ${widget.titre} ',
                style: TextStyle(
                    fontSize: 18,
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

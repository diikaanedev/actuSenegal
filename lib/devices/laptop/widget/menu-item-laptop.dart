import 'package:actu/devices/laptop/screen/categorie-laptop.dart';
import 'package:actu/devices/laptop/screen/categorie-scandale-decouverte-ohter.dart';
import 'package:actu/devices/laptop/screen/home-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MenuItemLaptop extends StatefulWidget {
  final String titre;

  const MenuItemLaptop({Key? key, required this.titre}) : super(key: key);
  @override
  _MenuItemLaptopState createState() => _MenuItemLaptopState();
}

class _MenuItemLaptopState extends State<MenuItemLaptop> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (appState.screen == 0) {
          homeLaptopState.setState(() {
            homeLaptopState.showMenu = false;
          });
        } else if (appState.screen == 1) {
          categorieLaptopState.setState(() {
            categorieLaptopState.showMenu = false;
          });
        } else if (appState.screen == 2) {
          categorieScandaleDecouverteOtherState.setState(() {
            categorieScandaleDecouverteOtherState.showMenu = false;
          });
        }
        appState.setState(() {
          appState.titreCategorie = widget.titre;
          appState.screen = 1;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          widget.titre.toUpperCase(),
          style: TextStyle(
              color: colorPrimaire, fontWeight: FontWeight.w900, fontSize: 12),
        ),
      ),
    );
  }
}

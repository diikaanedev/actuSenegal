import 'package:actu/devices/phone/widget/rubrique-news-menu-phone-bis.dart';
import 'package:actu/devices/phone/widget/rubrique-news-menu-phone.dart';
import 'package:flutter/material.dart';

class MenuTopPhone extends StatefulWidget {
  @override
  _MenuTopPhoneState createState() => _MenuTopPhoneState();
}

class _MenuTopPhoneState extends State<MenuTopPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width * .61,
          color: Colors.white,
        ),
        Positioned(
            child: Container(
          height: size.height,
          width: size.width * .6,
          // color: Colors.yellow,
          child: Column(
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                width: size.width * .6,
                child: Center(
                  child: Text(
                    'Rubriques',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // SizedBox(
              //   height: size.height * .07,
              // ),
              RubriqueNewMenuPhone(
                urlIcon: 'assets/images/actualite_icon.png',
                titre: 'Actualites',
              ),
              RubriqueNewMenuPhone(
                urlIcon: 'assets/images/politique_icon.png',
                titre: 'Politique',
              ),
              RubriqueNewMenuPhone(
                urlIcon: 'assets/images/economie_icon.png',
                titre: 'Economie',
              ),

              RubriqueNewMenuPhone(
                urlIcon: 'assets/images/monde_icon.png',
                titre: 'International',
              ),
              RubriqueNewMenuPhone(
                urlIcon: 'assets/images/sport_icon.png',
                titre: 'Sport',
              ),
              SizedBox(
                height: size.height * .03,
              ),
              RubriqueNewMenuBisPhone(
                titre: 'Decouverte',
              ),

              RubriqueNewMenuBisPhone(
                titre: 'Investigation',
              ),
              RubriqueNewMenuBisPhone(
                titre: 'Reportage',
              ),
            ],
          ),
        )),
      ],
    );
  }
}

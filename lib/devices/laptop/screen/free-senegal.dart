import 'package:actu/devices/laptop/widget/twitter-widget-laptop.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class FreeSenegalLaptop extends StatefulWidget {
  @override
  _FreeSenegalLaptopState createState() => _FreeSenegalLaptopState();
}

class _FreeSenegalLaptopState extends State<FreeSenegalLaptop> {
  late Size size;
  bool showMenu = false;

  bool chargement = true;

  String type = '';

  @override
  void initState() {
    super.initState();
    if (appState.titreCategorie.toLowerCase() == '#freesenegal') {
      setState(() {
        type = 'freeSenegal';
      });
    } else {
      setState(() {
        type = 'senegal';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.grey.withOpacity(.2),
          ),
          Positioned(
              child: Container(
            height: size.height * .05,
            width: size.width,
            color: colorPrimaire,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .1,
                ),
                GestureDetector(
                  onTap: () {
                    appState.setState(() {
                      appState.screen = 0;
                    });
                  },
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/logo221_blanc.png'))),
                  ),
                ),
                Spacer(),
                Container(
                  height: size.height * .05,
                  width: size.height * .05,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/tweet_galsen.png'))),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  appState.titreCategorie,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Spacer(),
                // Spacer(),
              ],
            ),
          )),
          Positioned(
              top: size.height * .05,
              child: Container(
                height: size.height * .95,
                width: size.width,
                // color: Colors.red,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      width: size.width * .3,
                      // color: colorPrimaire,
                    ),
                    Spacer(),
                    Container(
                      width: size.width * .4,
                      child: ListView(
                        children: getList(),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: size.width * .3,
                      // color: Colors.blue,
                    ),
                    Spacer(),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> listes = [];

    for (var item in appState.listePost
        .where((element) => element.keyWors.contains(type))) {
      listes.add(TwitterWidgetLaptop(
        article: item,
      ));
    }

    return listes;
  }
}

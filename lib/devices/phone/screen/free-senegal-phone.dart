import 'package:actu/devices/phone/widget/twitter-widget-phone.dart';
import 'package:actu/main.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class FreeSenegal extends StatefulWidget {
  @override
  _FreeSenegalState createState() => _FreeSenegalState();
}

class _FreeSenegalState extends State<FreeSenegal> {
  String type = '';
  @override
  void initState() {
    super.initState();
    if (appState.titreCategorie.toLowerCase() == '#FreeSénégal') {
      setState(() {
        type = 'freeSenegal';
      });
    } else {
      setState(() {
        type = 'senegal';
      });
    }
  }

  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colorPrimaire,
        shadowColor: colorPrimaire,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.grey.withOpacity(.2),
          ),
          Positioned(
              // top: size.height * .01,
              child: Container(
            height: size.height * .07,
            width: size.width,
            color: colorPrimaire,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .02,
                ),
                GestureDetector(
                  onTap: () {
                    appState.setState(() {
                      appState.screen = 0;
                    });
                  },
                  child: Container(
                    height: size.height * .05,
                    width: size.width * .3,
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
                      fontSize: 20,
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
              // left: size.width * .1,
              top: size.height * .07,
              child: Container(
                width: size.width,
                height: size.height * .93,
                child: ListView(
                  children: getList(),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  physics: BouncingScrollPhysics(),
                ),
              )),
        ],
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> listes = [];

    for (var item in appState.listePost
        .where((element) => element.keyWors.contains('freeSenegal'))) {
      listes.add(TwitterWidgetPhone(
        article: item,
      ));
    }

    return listes;
  }
}

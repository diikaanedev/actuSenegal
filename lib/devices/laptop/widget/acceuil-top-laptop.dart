import 'package:actu/devices/laptop/widget/card-new-other-not-une.dart';
import 'package:actu/devices/laptop/widget/card-new-une-laptop.dart';
import 'package:actu/main.dart';
import 'package:flutter/material.dart';

class AcceuilTopLaptop extends StatefulWidget {
  @override
  _AcceuilTopLaptopState createState() => _AcceuilTopLaptopState();
}

class _AcceuilTopLaptopState extends State<AcceuilTopLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .6,
      width: size.width,
      // color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          Container(
            width: size.width * .2,

            // color: Colors.red,
            child: Column(
              children: [
                Container(
                  width: size.width * .2,
                  height: size.height * .3,
                  child: CardNewOtherNotUne(
                    article: appState.listeTopPage
                        .where((element) =>
                            element.isAlaUne && element.positionUne == 2)
                        .first,
                  ),
                ),
                Spacer(),
                Container(
                  width: size.width * .2,
                  height: size.height * .3,
                  child: CardNewOtherNotUne(
                    article: appState.listeTopPage
                        .where((element) =>
                            element.isAlaUne && element.positionUne == 3)
                        .first,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: size.width * .4,
            // color: Colors.red,
            child: CardNewUneLaptop(
              article: appState.listeTopPage
                  .where(
                      (element) => element.isAlaUne && element.positionUne == 1)
                  .first,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: size.width * .2,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * .2,
                  height: size.height * .3,
                  child: CardNewOtherNotUne(
                    article: appState.listeTopPage
                        .where((element) =>
                            element.isAlaUne && element.positionUne == 4)
                        .first,
                  ),
                ),
                Spacer(),
                Container(
                  width: size.width * .2,
                  height: size.height * .3,
                  child: CardNewOtherNotUne(
                    article: appState.listeTopPage
                        .where((element) =>
                            element.isAlaUne && element.positionUne == 5)
                        .first,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

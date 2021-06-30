import 'package:flutter/material.dart';

class FooterPhone extends StatefulWidget {
  @override
  _FooterPhoneState createState() => _FooterPhoneState();
}

class _FooterPhoneState extends State<FooterPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width,
      color: Colors.grey[800],
      child: Row(
        children: [
          Spacer(),
          Container(
            width: size.width * .3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo221_blanc.png'))),
          ),
          Spacer(),
          Container(
            width: size.width * .6,
            child: Row(
              children: [
                Spacer(),
                Spacer(),
                Container(
                  width: size.width * .07,
                  child: Image.asset('assets/images/facebook.png'),
                ),
                Spacer(),
                Container(
                  width: size.width * .07,
                  child: Image.asset('assets/images/instagram.png'),
                ),
                Spacer(),
                Container(
                  width: size.width * .07,
                  child: Image.asset('assets/images/twitter.png'),
                ),
                Spacer(),
                Container(
                  width: size.width * .07,
                  child: Image.asset('assets/images/youtube.png'),
                ),
                SizedBox(
                  width: 10,
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

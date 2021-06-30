import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class TitreTextLaptop extends StatefulWidget {
  final String titre;
  final double fontSize;

  const TitreTextLaptop({Key? key, required this.titre, this.fontSize = 18})
      : super(key: key);
  @override
  _TitreTextLaptopState createState() => _TitreTextLaptopState();
}

class _TitreTextLaptopState extends State<TitreTextLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
        width: size.width * .3,
        //color: Colors.black,
        child: Center(
            child: Text(widget.titre.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    // decoration: TextDecoration.underline,
                    fontSize: widget.fontSize,
                    color: colorPrimaire,
                    fontWeight: FontWeight.w900))));
  }
}

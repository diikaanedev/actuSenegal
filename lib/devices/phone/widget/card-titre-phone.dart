import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CardTitrePhone extends StatefulWidget {
  final String titre;

  const CardTitrePhone({Key? key, required this.titre}) : super(key: key);
  @override
  _CardTitrePhoneState createState() => _CardTitrePhoneState();
}

class _CardTitrePhoneState extends State<CardTitrePhone> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .05,
      width: size.width,
      color: colorPrimaire,
      child: Row(
        children: [
          SizedBox(
            width: size.width * .05,
          ),
          Text(
            widget.titre.toUpperCase(),
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey[300],
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

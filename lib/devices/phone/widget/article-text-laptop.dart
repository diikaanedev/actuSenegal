import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ArticeTextLaptop extends StatefulWidget {
  final String titre;

  const ArticeTextLaptop({Key? key, required this.titre}) : super(key: key);
  @override
  _ArticeTextLaptopState createState() => _ArticeTextLaptopState();
}

class _ArticeTextLaptopState extends State<ArticeTextLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .43,
      decoration: BoxDecoration(
          //border: Border.all(color: colorPrimaire , width: .2)
          ),
      //color: Colors.black,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HtmlWidget(
            widget.titre,
            textStyle: TextStyle(fontWeight: FontWeight.w300),
          )),
    );
  }
}

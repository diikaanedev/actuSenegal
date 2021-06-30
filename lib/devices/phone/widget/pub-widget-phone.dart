import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class PubWidgetPhone extends StatefulWidget {
  final String url;
  const PubWidgetPhone({Key? key, required this.url}) : super(key: key);

  @override
  _PubWidgetPhoneState createState() => _PubWidgetPhoneState();
}

class _PubWidgetPhoneState extends State<PubWidgetPhone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.url), fit: BoxFit.fill)),
    );
  }
}

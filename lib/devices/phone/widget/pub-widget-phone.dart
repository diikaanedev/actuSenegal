import 'package:actu/main.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class PubWidgetPhone extends StatefulWidget {
  final PubActu pub;
  const PubWidgetPhone({Key? key, required this.pub}) : super(key: key);

  @override
  _PubWidgetPhoneState createState() => _PubWidgetPhoneState();
}

class _PubWidgetPhoneState extends State<PubWidgetPhone> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => launch(widget.pub.urlSite),
      onTap: () => showDialog(
          context: context,
          builder: (_) => new AlertDialog(
                content: new Text(" Rendez-vous trés prochainement ..."),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Fermer'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )),
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Spacer(),
            Text(
              'Ênquete',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .025,
                  fontWeight: FontWeight.bold,
                  color: colorPrimaire),
            ),
            Spacer(),
            Container(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(appState.listeEnquetes.first.urlPhoto),
                      fit: BoxFit.fill)),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

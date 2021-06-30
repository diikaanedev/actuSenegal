import 'package:actu/models/pub-actu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PubWidgetLaptop extends StatefulWidget {
  final PubActu pub;

  const PubWidgetLaptop({
    Key? key,
    required this.pub,
  }) : super(key: key);

  @override
  _PubWidgetLaptopState createState() => _PubWidgetLaptopState();
}

class _PubWidgetLaptopState extends State<PubWidgetLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () async => launch(widget.pub.urlSite),
      child: Container(
        height: size.height * .25,
        width: size.width,
        // color: colorPrimaire,
        child: Row(
          children: [
            Spacer(),
            Container(
              width: size.width * .82,
              // color: colorPrimaire,
              child: Row(
                children: [
                  Spacer(),
                  Container(
                    width: size.width * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        widget.pub.url1,
                      ),
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    )),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * .4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        widget.pub.url2,
                      ),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    )),
                  ),
                  Spacer(),
                  Container(
                    width: size.width * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        widget.pub.url3,
                      ),
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    )),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

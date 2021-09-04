import 'package:actu/devices/phone/widget/titre-text-laptop.dart';
import 'package:actu/main.dart';
// import 'package:actu/models/pub-actu.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class PubWidgetLaptop extends StatefulWidget {
  // final PubActu pub;

  final String url1;
  final String url2;

  final int position;

  const PubWidgetLaptop({
    Key? key,
    required this.url1,
    required this.url2,
    required this.position,
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
      // onTap: () async => launch(widget.pub.urlSite),
      child: Container(
        height: size.height * .25,
        width: size.width,
        // color: colorPrimaire,
        child: Row(
          children: [
            Spacer(),
            Container(
              width: size.width,
              // color: colorPrimaire,
              child: Row(
                children: [
                  Spacer(),
                  widget.position == 0
                      ? Container(
                          width: size.width * .15,
                          // child: Column(
                          //   children: [
                          //     Spacer(),
                          //     Text(
                          //       'Service Commercial ',
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: size.height * .015,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 4,
                          //     ),
                          //     Text(
                          //       'Tel : 33 820 84 24 / 77 686 61 59',
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: size.height * .015,
                          //       ),
                          //     ),
                          //     Spacer(),
                          //   ],
                          // ),
                          // color: Colors.yellow,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                              widget.url2,
                            ),
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter,
                          )),
                        )
                      : Container(
                          width: size.width * .15,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                'Service Commercial ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * .015,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Tel : 33 820 84 24 / 77 686 61 59',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * .015,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          color: Colors.yellow,
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //   image: NetworkImage(
                          //     widget.url2,
                          //   ),
                          //   fit: BoxFit.contain,
                          //   alignment: Alignment.topCenter,
                          // )),
                        ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      width: size.width * .45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          widget.url1,
                        ),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      )),
                    ),
                  ),
                  Spacer(),
                  widget.position == 0
                      ? Container(
                          width: size.width * .15,
                          child: Column(
                            children: [
                              Spacer(),
                              Text(
                                'Service Commercial ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * .015,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Tel : 33 820 84 24 / 77 686 61 59',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * .015,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          color: Colors.yellow,
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //   image: NetworkImage(
                          //     widget.url2,
                          //   ),
                          //   fit: BoxFit.contain,
                          //   alignment: Alignment.topCenter,
                          // )),
                        )
                      : Container(
                          width: size.width * .15,
                          // child: Column(
                          //   children: [
                          //     Spacer(),
                          //     Text(
                          //       'Service Commercial ',
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: size.height * .015,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       height: 4,
                          //     ),
                          //     Text(
                          //       'Tel : 33 820 84 24 / 77 686 61 59',
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: size.height * .015,
                          //       ),
                          //     ),
                          //     Spacer(),
                          //   ],
                          // ),
                          // color: Colors.yellow,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                              widget.url2,
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

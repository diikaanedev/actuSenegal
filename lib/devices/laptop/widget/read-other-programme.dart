import 'package:actu/devices/laptop/widget/card-dialog-programme.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

readOtherProgramme(BuildContext context, Article article) => showDialog(
    context: context,
    builder: (_) => new AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: colorPrimaire,
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        height: MediaQuery.of(context).size.height * .6,
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .25,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    'Service Commercial ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          'Tel : 33 820 84 24 / 77 686 61 59',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.yellow,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .25,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    'Service Commercial ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          'Tel : 33 820 84 24 / 77 686 61 59',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.yellow,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: MediaQuery.of(context).size.height * .6,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: HtmlWidget(
                          article.body,
                          webView: true,
                          webViewJs: true,
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width * .2,
                        height: MediaQuery.of(context).size.height * .6,
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .25,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    'Service Commercial ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          'Tel : 33 820 84 24 / 77 686 61 59',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.yellow,
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: MediaQuery.of(context).size.height * .25,
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    'Service Commercial ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .02,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Spacer(),
                                        Text(
                                          'Tel : 33 820 84 24 / 77 686 61 59',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.yellow,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  child: Center(
                    child: Text('Autres Programes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // decoration: TextDecoration.underline,
                            fontSize: MediaQuery.of(context).size.height * .02,
                            color: colorPrimaire,
                            fontWeight: FontWeight.w900)),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * .4,
                    child: Carousel(
                      arrowColor: Colors.black,
                      unActiveIndicatorColor: Colors.blueGrey,
                      showIndicator: true,
                      axis: Axis.horizontal,
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .4,
                      initialPage: 0,
                      allowWrap: false,
                      type: Types.slideSwiper,
                      indicatorType: IndicatorTypes.bar,
                      activeIndicatorColor: colorPrimaire,
                      indicatorBackgroundColor: Colors.white,
                      showArrow: true,
                      children: appState.listeProgrammes.reversed
                          .map((item) => Container(
                              height: MediaQuery.of(context).size.height * .35,
                              child: CardDialogProgrammeLaptop(article: item)))
                          .toList(),
                    )),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));

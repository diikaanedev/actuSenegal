import 'package:actu/devices/laptop/widget/card-dialog-reportage.dart';
import 'package:actu/main.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

readReportage(BuildContext context, Article article) => showDialog(
    context: context,
    builder: (_) => new AlertDialog(
          content: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        'Service Commercial ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * .04,
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
                                fontSize:
                                    MediaQuery.of(context).size.height * .04,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.yellow),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        height: MediaQuery.of(context).size.height * .7,
                        width: MediaQuery.of(context).size.width * .7,
                        // color: Colors.black,
                        child: HtmlWidget(
                          article.body,
                          webView: true,
                          webViewJs: true,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  child: Text('Autres Reportages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // decoration: TextDecoration.underline,
                          fontSize: MediaQuery.of(context).size.height * .03,
                          color: colorPrimaire,
                          fontWeight: FontWeight.w900)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
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
                      children: appState.listeReportages.reversed
                          .map((item) => Container(
                              height: MediaQuery.of(context).size.height * .35,
                              child: CardDialogREportageLaptop(article: item)))
                          .toList(),
                    )),
              ])),
          actions: <Widget>[
            FlatButton(
              child: Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));

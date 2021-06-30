import 'package:actu/models/article-model.dart';
import 'package:flutter/material.dart';

class TwitterWidgetPhone extends StatefulWidget {
  final Article article;

  const TwitterWidgetPhone({Key? key, required this.article}) : super(key: key);
  @override
  _TwitterWidgetPhoneState createState() => _TwitterWidgetPhoneState();
}

class _TwitterWidgetPhoneState extends State<TwitterWidgetPhone> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: size.height * .5,
            width: size.width,
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            )),
        Positioned(
            // left: size.width * .05,
            top: 10,
            child: Container(
              height: size.height * .3,
              width: size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(widget.article.urlPhoto),
                      fit: BoxFit.cover)),
            )),
        Positioned(
            top: size.height * .3,
            // left: size.width * .05,
            child: Container(
                height: size.height * .2,
                width: size.width,
                child: Column(
                  children: [
                    Container(
                      height: size.height * .05,
                      width: size.width,

                      // color: colorSecondaire,
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            // width: size.width * .25,
                            height: size.height * .05,
                            child: Center(
                              child: Text(
                                '${widget.article.tag}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Container(
                        height: size.height * .1,
                        width: size.width * .8,

                        // color: colorSecondaire,
                        child: Center(
                          child: Text(
                            '${widget.article.titre}',
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                    Container(
                      height: size.height * .04,
                      width: size.width,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            height: size.height * .03,
                            width: size.height * .03,
                            child: Image.asset(
                              'assets/images/facebook.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: size.height * .03,
                            width: size.height * .03,
                            child: Image.asset(
                              'assets/images/instagram.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: size.height * .03,
                            width: size.height * .03,
                            child: Image.asset(
                              'assets/images/twitter.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ))),
        Positioned(
            right: size.width * .05,
            top: 15,
            child: Container(
              height: size.height * .05,
              width: size.height * .05,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/tweet_galsen.png'))),
            ))
      ],
    );
  }
}

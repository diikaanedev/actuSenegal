import 'package:flutter/material.dart';

class FooterLaptop extends StatefulWidget {
  @override
  _FooterLaptopState createState() => _FooterLaptopState();
}

class _FooterLaptopState extends State<FooterLaptop> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      child: Column(
        children: [
          Container(
            height: size.height * .07,
            width: size.width,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * .05,
                ),
                Container(
                  width: size.width * .2,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_solgan.png'))),
                ),
                SizedBox(
                  width: size.width * .2,
                ),
                Text(
                  'Nos Partenaires '.toUpperCase(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 1,
                  height: size.height * .04,
                  color: Colors.grey,
                ),
                Container(
                  width: size.width * .4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: size.width * .05,
                        // color: Colors.black,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/logo221_rouge.png'))),
                      ),
                      Container(
                        width: size.width * .05,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/actu logo 222.png'))),
                      ),
                      Container(
                        width: size.width * .05,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/actu logo 223.png'))),
                      ),
                      Container(
                        width: size.width * .05,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/actu logo 224.png'))),
                      ),
                      Container(
                        width: size.width * .05,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/actu logo225.png'))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: size.height * .05,
          // ),
          // Container(
          //   height: size.height * .4,
          //   width: size.width,
          //   color: Color.fromRGBO(51, 51, 51, 1),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: size.width * .27,
          //         height: size.height * .4,
          //         // color: Colors.red,
          //         child: Stack(
          //           children: [
          //             Positioned(
          //                 top: size.height * .07,
          //                 left: size.width * .04,
          //                 child: Container(
          //                   height: size.height * .08,
          //                   width: size.width * .17,
          //                   child: Row(
          //                     children: [
          //                       SizedBox(width: size.width * .045),
          //                       Container(
          //                         child: Column(
          //                           children: [
          //                             SizedBox(
          //                               height: 10,
          //                             ),
          //                             Container(
          //                               child: Row(
          //                                 children: [
          //                                   Text(
          //                                     'Mamadou',
          //                                     style: TextStyle(
          //                                         fontSize: 24,
          //                                         fontWeight: FontWeight.w200,
          //                                         color: Colors.white),
          //                                   ),
          //                                   SizedBox(
          //                                     width: 5,
          //                                   ),
          //                                   Text(
          //                                     'Sembere'.toUpperCase(),
          //                                     style: TextStyle(
          //                                         fontSize: 24,
          //                                         fontWeight: FontWeight.bold,
          //                                         color: Colors.white),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ),
          //                             SizedBox(
          //                               width: 5,
          //                             ),
          //                             Text(
          //                               'Directeur',
          //                               style: TextStyle(
          //                                   fontSize: 26,
          //                                   fontWeight: FontWeight.bold,
          //                                   color: Colors.white),
          //                             )
          //                           ],
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                   decoration: BoxDecoration(
          //                     border:
          //                         Border.all(color: Colors.white, width: .1),
          //                     boxShadow: [
          //                       BoxShadow(
          //                           blurRadius: .5,
          //                           // offset: Offset(-10, -10),
          //                           color: Colors.black)
          //                     ],
          //                     borderRadius: BorderRadius.only(
          //                         topLeft: Radius.circular(size.width),
          //                         bottomLeft: Radius.circular(size.width),
          //                         topRight: Radius.circular(5),
          //                         bottomRight: Radius.circular(5)),
          //                     color: Colors.black.withOpacity(.39),
          //                   ),
          //                 )),
          //             Positioned(
          //                 top: size.height * .07,
          //                 left: size.width * .04,
          //                 child: Container(
          //                   height: size.height * .08,
          //                   width: size.width * .04,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(size.width),
          //                       // color: Colors.black,
          //                       image: DecorationImage(
          //                           image:
          //                               AssetImage('assets/images/sport.jpg'),
          //                           fit: BoxFit.cover)),
          //                 )),
          //             Positioned(
          //                 top: size.height * .17,
          //                 left: size.width * .01,
          //                 child: Container(
          //                   height: size.height * .1,
          //                   width: size.width * .25,
          //                   // color: Colors.amberAccent,
          //                   child: Column(
          //                     children: [
          //                       SizedBox(
          //                         height: 10,
          //                       ),
          //                       Text(
          //                         '"L\'information est l\'oxygene des temps modernes"',
          //                         textAlign: TextAlign.center,
          //                         style: TextStyle(
          //                             fontSize: 22,
          //                             fontStyle: FontStyle.italic,
          //                             color: Colors.white),
          //                       ),
          //                       SizedBox(
          //                         height: 10,
          //                       ),
          //                       Text(
          //                         'Vous etes au bon endroit'.toUpperCase(),
          //                         style: TextStyle(
          //                             fontSize: 18,
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.white),
          //                       )
          //                     ],
          //                   ),
          //                 )),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: 2,
          //         color: Colors.grey,
          //       ),
          //       Container(
          //         width: size.width * .43,
          //         // color: Colors.green,
          //         child: Column(
          //           children: [
          //             Container(
          //               height: size.height * .12,
          //               // color: Colors.red,
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     width: size.width * .03,
          //                   ),
          //                   Container(
          //                     width: 2,
          //                     height: size.height * .12,
          //                     // color: Colors.yellow,
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         SizedBox(
          //                           height: size.height * .06,
          //                         ),
          //                         Container(
          //                           height: size.height * .04,
          //                           color: Colors.grey,
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   Container(
          //                     width: size.width * .02,
          //                     height: 2,
          //                     color: Colors.grey,
          //                   ),
          //                   Container(
          //                     width: size.width * .07,
          //                     height: size.hashCode * .07,
          //                     child: Center(
          //                         child: Text(
          //                       'MOTS CLES',
          //                       style: TextStyle(
          //                           fontSize: 20, color: Colors.white),
          //                     )),
          //                     // color: Colors.blue,
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               height: size.height * .25,
          //               // color: Colors.brown,
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     height: size.height * .07,
          //                     // color: Colors.red,
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceAround,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Youssou Ndour',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Dictature',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Text(
          //                             'souveraineté',
          //                             style: TextStyle(
          //                                 fontSize: 20,
          //                                 fontWeight: FontWeight.w300,
          //                                 color: Colors.grey),
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' KFC',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   Container(
          //                     height: size.height * .07,
          //                     // color: Colors.red,
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceAround,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Djolof band',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Bombardement',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Militaires',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Enlevement',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   Container(
          //                     height: size.height * .07,
          //                     // color: Colors.red,
          //                     child: Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceAround,
          //                       children: [
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Covid-19',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Pastef',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' 3e Mandat',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 8.0),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.panorama_fish_eye_outlined,
          //                                 size: 8,
          //                                 color: Colors.grey,
          //                               ),
          //                               Text(
          //                                 ' Legislative 2021',
          //                                 style: TextStyle(
          //                                     fontSize: 20,
          //                                     fontWeight: FontWeight.w300,
          //                                     color: Colors.grey),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       Container(
          //         width: 2,
          //         color: Colors.grey,
          //       ),
          //       Container(
          //         width: size.width * .27,
          //         child: Column(
          //           children: [
          //             Container(
          //               height: size.height * .12,
          //               // color: Colors.red,
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     width: size.width * .05,
          //                   ),
          //                   Container(
          //                     width: 2,
          //                     height: size.height * .12,
          //                     // color: Colors.yellow,
          //                     child: Column(
          //                       mainAxisAlignment: MainAxisAlignment.start,
          //                       children: [
          //                         SizedBox(
          //                           height: size.height * .06,
          //                         ),
          //                         Container(
          //                           height: size.height * .04,
          //                           color: Colors.grey,
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   Container(
          //                     width: size.width * .02,
          //                     height: 2,
          //                     color: Colors.grey,
          //                   ),
          //                   Container(
          //                     width: size.width * .07,
          //                     height: size.hashCode * .07,
          //                     child: Center(
          //                         child: Text(
          //                       'CONTACT',
          //                       style: TextStyle(
          //                           fontSize: 20, color: Colors.white),
          //                     )),
          //                     // color: Colors.blue,
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               height: size.height * .07,
          //               // color: Colors.red,
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     width: size.width * .027,
          //                   ),
          //                   Container(
          //                     width: size.width * .05,
          //                     // color: Colors.yellow,
          //                     child: Center(
          //                       child: Icon(
          //                         Icons.home_rounded,
          //                         size: size.width * .03,
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 15,
          //                   ),
          //                   Text(
          //                     'Ngor , Rue 53x45 face Philips Moris',
          //                     style: TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w300,
          //                         color: Colors.grey),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               height: size.height * .07,
          //               // color: Colors.blue,
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     width: size.width * .027,
          //                   ),
          //                   Container(
          //                     width: size.width * .05,
          //                     // color: Colors.yellow,
          //                     child: Center(
          //                       child: Icon(
          //                         Icons.contact_mail_outlined,
          //                         size: size.width * .02,
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 15,
          //                   ),
          //                   Text(
          //                     'Adresseemail@email.com',
          //                     style: TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w300,
          //                         color: Colors.grey),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               height: size.height * .07,
          //               // color: Colors.green,
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     width: size.width * .027,
          //                   ),
          //                   Container(
          //                     width: size.width * .05,
          //                     // color: Colors.yellow,
          //                     child: Center(
          //                       child: Icon(
          //                         Icons.phone_callback_rounded,
          //                         size: size.width * .02,
          //                       ),
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: 15,
          //                   ),
          //                   Text(
          //                     '+221 77 222 22 22',
          //                     style: TextStyle(
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w300,
          //                         color: Colors.grey),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Container(
          //               height: size.height * .05,
          //               // color: Colors.green,
          //               child: Row(
          //                 children: [
          //                   SizedBox(
          //                     width: size.width * .17,
          //                   ),
          //                   Container(
          //                     width: size.width * .02,
          //                     height: size.height * .03,
          //                     // color: Colors.red,
          //                     decoration: BoxDecoration(
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/twitter.png'))),
          //                   ),
          //                   SizedBox(
          //                     width: 5,
          //                   ),
          //                   Container(
          //                     width: size.width * .02,
          //                     height: size.height * .03,
          //                     decoration: BoxDecoration(
          //                         image: DecorationImage(
          //                             image: AssetImage(
          //                                 'assets/images/youtube.png'))),
          //                   ),
          //                   SizedBox(
          //                     width: 5,
          //                   ),
          //                   Container(
          //                       width: size.width * .02,
          //                       height: size.height * .03,
          //                       decoration: BoxDecoration(
          //                           image: DecorationImage(
          //                               image: AssetImage(
          //                                   'assets/images/instagram.png')))),
          //                   SizedBox(
          //                     width: 5,
          //                   ),
          //                   Container(
          //                       width: size.width * .02,
          //                       height: size.height * .03,
          //                       decoration: BoxDecoration(
          //                           image: DecorationImage(
          //                               image: AssetImage(
          //                                   'assets/images/facebook.png')))),
          //                   SizedBox(
          //                     width: 5,
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

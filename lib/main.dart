import 'package:actu/devices/laptop/mainLaptop.dart';
import 'package:actu/devices/phone/main.phone.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/get-type-device.dart';
import 'package:actu/utils/type-devices.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

double width = window.physicalSize.width / window.devicePixelRatio;

void main() {
  runApp(MyApp());
}

late _MyAppState appState;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() {
    appState = _MyAppState();
    return appState;
  }
}

class _MyAppState extends State<MyApp> {
  late DeviceType deviceType;
  late List<Article> listePost = [];

  Article article = Article(
      id: "v",
      date: '',
      titre: '',
      body: '',
      isAlaUne: false,
      positionUne: 1,
      tag: '',
      urlPhoto: '',
      allFichier: [],
      idCategorie: 1,
      keyWors: [],
      categorie: '',
      nameAuthor: '',
      roleAuthor: '');

  late List<Article> listeTopPage = [];
  late List<Article> listePolitique;

  late List<Article> listeDecouvertes;
  late List<Article> listeRedaction;
  late List<Article> listeSport;
  late List<Article> listeEconomie;
  late List<Article> listeInternational;
  late List<Article> listeInvestigations;
  late List<Article> listeEntreprenariats;
  late List<Article> listeBreakingNews;
  late List<Article> listeRessourceDuSenegal;
  late List<Article> listeEnquetes;
  late List<Article> listeReportages;
  late List<Article> listeProgrammes;

  late List<PubActu> listePub = [
    PubActu(
        url1:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBNNEc1oiJsPpbDIw2zvbJUOLaJCj_MESIMQ&usqp=CAU",
        url2:
            "https://firebasestorage.googleapis.com/v0/b/actu221.appspot.com/o/djamil-logistique%2Ftransport-et-logistique-1.jpg?alt=media&token=fb1a59e2-f812-48fc-83dc-4cdec32c369c",
        urlSite: "www.google.com",
        url3:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBNNEc1oiJsPpbDIw2zvbJUOLaJCj_MESIMQ&usqp=CAU",
        name: "google")
  ];
  int screen = 0;

  String titreCategorie = 'Politique';

  @override
  void initState() {
    deviceType = getTypeDevice(width);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(width);
    if (deviceType == DeviceType.Laptop) return mainLatop();

    return mainPhone();
  }
}

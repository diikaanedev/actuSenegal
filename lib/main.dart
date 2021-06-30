import 'package:actu/devices/laptop/mainLaptop.dart';
import 'package:actu/devices/phone/main.phone.dart';
import 'package:actu/models/article-model.dart';
import 'package:actu/models/pub-actu.dart';
import 'package:actu/utils/get-type-device.dart';
import 'package:actu/utils/type-devices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

double width = window.physicalSize.width / window.devicePixelRatio;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  late List<Article> listePost;

  Article article = Article(
      id: 'v',
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

  late List<Article> listeTopPage;
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

  late List<PubActu> listePub;

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

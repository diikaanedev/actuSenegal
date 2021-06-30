import 'package:cloud_firestore/cloud_firestore.dart';

class PubActu {
  late String url1, url2, url3, urlSite, name;
  PubActu(
      {required this.url1,
      required this.url2,
      required this.urlSite,
      required this.url3,
      required this.name});

  static fromFireBase(List<QueryDocumentSnapshot<Map<String, dynamic>>> liste) {
    List<PubActu> listePub = [];
    liste.forEach((element) {
      listePub.add(PubActu(
          url1: element.get('url1'),
          url2: element.get('url2'),
          urlSite: element.get('urlSite'),
          url3: element.get('url3'),
          name: element.get('nomEntreprise')));
    });
    return listePub;
  }
}

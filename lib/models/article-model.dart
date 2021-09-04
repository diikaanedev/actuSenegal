import 'package:actu/utils/helper-by-dii.dart';
import 'package:actu/utils/web-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Article {
  late String id;

  late int idCategorie;

  late String tag;

  late String titre;

  late String body;

  late String urlPhoto;

  late bool isAlaUne;

  late int positionUne;

  late String categorie;

  late String nameAuthor;
  late String roleAuthor;

  late List<String> keyWors;

  late List<String> allFichier;

  late String date;

  Article(
      {required this.id,
      required this.titre,
      required this.body,
      required this.isAlaUne,
      required this.positionUne,
      required this.tag,
      required this.urlPhoto,
      required this.categorie,
      required this.nameAuthor,
      required this.roleAuthor,
      required this.allFichier,
      required this.idCategorie,
      required this.date,
      required this.keyWors});

  static fromJson(Map<dynamic, dynamic> l) {
    List<Article> liste = [];
    int i = 0;
    for (var item in l['data']) {
      // print(item['attributes']['mots'].length);
      List<String> keyArticle = [];
      for (var i in item['attributes']['mots']) {
        keyArticle.add(i['libelle']);
      }
      // print(item['attributes']['libelle']);

      liste.add(Article(
          id: item['id'],
          titre: item['attributes']['libelle'] ?? "",
          categorie: item['attributes']['category']['libelle'] ?? "",
          idCategorie: item['attributes']['category']['id'] ?? "",
          nameAuthor: item['attributes']['author']['name'] ?? "",
          roleAuthor: item['attributes']['author']['poste'] ?? "",
          body: item['attributes']['description'] ?? "",
          isAlaUne: item['attributes']['isUne'] == "1" ? true : false,
          positionUne: item['attributes']['position'] == null
              ? 0
              : int.parse(item['attributes']['position']),
          tag: item['attributes']['tag']['libelle'] ?? "",
          keyWors: keyArticle,
          date: dateFormatter(
            DateTime.parse(item['attributes']['created-at']),
          ),
          allFichier: [],
          urlPhoto: BASE_URL_FILE + item['attributes']['photo']));
      keyArticle = [];
    }
    return liste;
  }

  static fromJsonOne(Map<dynamic, dynamic> l) {
    Article article = Article(
        id: l['data']['id'],
        titre: l['data']['attributes']['libelle'],
        categorie: l['data']['attributes']['category']['libelle'],
        idCategorie: l['data']['attributes']['category']['id'],
        nameAuthor: l['data']['attributes']['author']['name'],
        roleAuthor: l['data']['attributes']['author']['poste'],
        body: l['data']['attributes']['description'],
        isAlaUne: l['data']['attributes']['isUne'] == "1" ? true : false,
        positionUne: l['data']['attributes']['position'] == null
            ? 0
            : int.parse(l['data']['attributes']['position']),
        tag: l['data']['attributes']['tag']['libelle'],
        date: "",
        keyWors: [],
        allFichier: [],
        urlPhoto: BASE_URL_FILE + l['data']['attributes']['photo']);

    return article;
  }
}

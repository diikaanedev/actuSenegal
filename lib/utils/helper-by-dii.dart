import 'dart:convert';

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Lundi", "2" : "Mardi", "3" : "Mercredi", "4" : "Jeudi", "5" : "Vendredi", "6" : "Samedi", "7" : "Dimanche" }';

  dynamic monthData =
      '{ "1" : "Janvier", "2" : "Fevrier", "3" : "Mars", "4" : "Avril", "5" : "Mai", "6" : "Juin", "7" : "Julliet", "8" : "Aout", "9" : "Septembre", "10" : "Octobre", "11" : "Novembre", "12" : "Décembre" }';

  // return date.toString();
  return json.decode(dayData)['${date.weekday}'] +
      " " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString() +
      " à " +
      date.hour.toString() +
      "h:" +
      date.minute.toString() +
      "min";
  // return [
  //   json.decode(monthData)['${date.month}'],
  //   date.day.toString(),
  //   date.year.toString(),
  //   json.decode(dayData)['${date.weekday}'],
  // ];
}

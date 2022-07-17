//listes de couleurs pour le gradient
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizz_app/pages/api/quizzmodel.dart';

List<Color> colors = [
  Color.fromARGB(255, 35, 128, 205),
  Color.fromARGB(255, 6, 108, 192),
  Color.fromARGB(255, 42, 123, 190)
];

List<Color> beginnerColor = [
  Color.fromARGB(255, 227, 78, 127),
  Color.fromARGB(255, 236, 113, 154),
  Color.fromARGB(228, 246, 119, 90)
];

List<Color> advancedColor = [
  Color.fromARGB(255, 5, 99, 176),
  Color.fromARGB(255, 6, 108, 192),
  Color.fromARGB(255, 42, 123, 190)
];
List<Color> expertColor = [
  Color.fromARGB(255, 199, 105, 240),
  Color.fromARGB(255, 200, 120, 234),
  Color.fromARGB(255, 213, 154, 238),
];

List<Quizz> beginnerQuizz = [
  Quizz("Quel est l'actuel president du TOGO", ["Talon", "Faure", "Macron"], 1),
  Quizz("Quel est le fleuve le plus long d'Afrique",
      ["NIL", "Mississipi", "Congo"], 0),
  Quizz("Quel est la femelle du lion", ["Lionne", "Guepard", "Poussin"], 0)
];
//
List<Quizz> advancedQuizz = [
  Quizz("La Therie de la relativite a ete pense par?",
      ["A. EINSTEIN", "H. PointCarre", "LAVOISIER"], 0),
  Quizz("Je Pense donc je suis vient de?",
      ["Rene DESCARTES", "SOCRATE", "KARL MARX"], 0),
  Quizz("La FRANCE Actuel est a la ... republique", ["2e", "8e", "5e"], 2)
];
List<Quizz> expertQuizz = [
  Quizz("Quel est l'animal le plus feroce", [
    "Lion",
    "Ratel",
    "Hippopotame"
  ], 1),
  Quizz("Quel est la premiere paire du FOREX a explose pendant le conflit RUSSO-UKRAINIEN", [
    "USD/XOF",
    "USD/RUB",
    "EUR/USD"
  ], 1),
  Quizz("A Quand a eu lieu le bombardement de NAGASAKI?", [
    "1925",
    "1944",
    "1945"
  ], 1)
];

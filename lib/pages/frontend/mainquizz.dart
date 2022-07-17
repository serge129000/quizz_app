// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/pages/animation/mainanimation.dart';
import 'package:quizz_app/pages/api/quizzmodel.dart';
import 'package:quizz_app/pages/frontend/onfinish.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'dart:math';

class MainQuizz extends StatefulWidget {
  List<Color> gColors;
  List<Quizz> quizzs;
  MainQuizz(this.gColors, this.quizzs, {Key? key}) : super(key: key);

  @override
  State<MainQuizz> createState() => _MainQuizzState();
}

String? name;
List<Quizz> quizz = [];
int question = 0;
double circularPId = 0;
Random rd = Random();
int score = 0;
//index evitant le out of bond
int index = 0;
bool? repTrouve;
int nulPressed = 1;
Color containerBasedColor = Colors.transparent;
Color onfailColor = Colors.red;
Color onWon = Colors.green;
//fonction de modification des couleurs
Color changeColour(
    Color onWon, Color onfailColor, String answer, String correctAnswer) {
  if (answer == correctAnswer) {
    return onWon;
  } else {
    return onfailColor;
  }
}

class _MainQuizzState extends State<MainQuizz> {
  //recuperation du nom du joueur
  getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString("username");
    });
  }

//fonction de gain ou de perte
  void winOrLoose(String answer, String correctAnswer) {
    if (answer == correctAnswer) {
      setState(() {
        score += 10;
        repTrouve = null;
        question++;
        index++;
        circularPId = index / quizz.length;
      });
    } else {
      setState(() {
        repTrouve = null;
        question++;
        index++;
        circularPId = index / quizz.length;
      });
    }
  }

  @override
  void initState() {
    getName();
    setState(() {
      circularPId = 0;
      index = 0;
      score = 0;
      //beug de correction des couleurs des container non mis a jour
      repTrouve = null;
      question = rd.nextInt(3);
      quizz = widget.quizzs;
      //permutation variables en fonction du random question
      Quizz pm1 = quizz[question];
      Quizz pm2 = quizz[0];
      quizz[question] = pm2;
      quizz[0] = pm1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textscale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        body: index < quizz.length
            ? Container(
                height: height,
                width: width,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 70,
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: widget.gColors,
                )),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DelayedAnimation(
                        delay: 500,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                      ),
                      DelayedAnimation(
                        delay: 600,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          value: circularPId,
                        ),
                      ),
                      DelayedAnimation(
                          delay: 700,
                          child: Column(
                            children: [
                              Text(
                                "Score",
                                style: GoogleFonts.poppins(
                                    fontSize: textscale * 18,
                                    color: Colors.white),
                              ),
                              Text(
                                score.toString(),
                                style: GoogleFonts.poppins(
                                    fontSize: textscale * 15,
                                    color: Colors.white),
                              )
                            ],
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: DelayedAnimation(
                      delay: 1000,
                      child: Container(
                        height: height / 3,
                        width: width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            quizz[index].question,
                            style: GoogleFonts.poppins(
                                fontSize: textscale * 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  DelayedAnimation(
                    delay: 1200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: SizedBox(
                        height: height / 3.5,
                        child: Column(
                            //enlever le .map et mettre des containers avec des index bien precis
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: quizz[index]
                                .suggestions
                                .map((e) => GestureDetector(
                                      onTap: repTrouve == null
                                          ? () {
                                              setState(() {
                                                repTrouve = false;
                                              });
                                              Timer(Duration(seconds: 2), () {
                                                //ne rien faire pendant 2s
                                              });
                                              winOrLoose(e,
                                                  quizz[index].reponseQuizz());
                                            }
                                          : null,
                                      child: Container(
                                        height: height / 13,
                                        width: width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border:
                                                Border.all(color: Colors.white),
                                            color: repTrouve != false
                                                ? containerBasedColor
                                                : changeColour(
                                                    onWon,
                                                    onfailColor,
                                                    e,
                                                    quizz[index]
                                                        .reponseQuizz())),
                                        child: Center(
                                          child: Text(
                                            e,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList()),
                      ),
                    ),
                  ),
                ]),
              )
            : onFinish(height, width, textscale, score, name!, widget.gColors,
                context));
  }
}

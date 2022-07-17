// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/constants.dart';
import 'package:quizz_app/pages/frontend/mainquizz.dart';

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textscale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromARGB(255, 86, 158, 216))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Color.fromARGB(255, 86, 158, 216))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "JOUONS!",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 29,
                    color: Color.fromARGB(255, 230, 78, 129),
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Sois le premier",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70, bottom: 30),
                child: Stack(clipBehavior: Clip.none, children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainQuizz(beginnerColor, beginnerQuizz)));
                    },
                    child: Container(
                      height: height / 5,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: beginnerColor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Niveau 1",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            Text(
                              "Debutant",
                              style: GoogleFonts.poppins(
                                  fontSize: textscale * 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 120,
                      left: 260,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            width: width / 4,
                            child: Image.asset(
                              "images/debutant.png",
                              fit: BoxFit.cover,
                            )),
                      ))
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainQuizz(advancedColor, advancedQuizz)));
                  },
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: height / 5,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: advancedColor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Niveau 2",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            Text(
                              "Avance",
                              style: GoogleFonts.poppins(
                                  fontSize: textscale * 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 120,
                        left: 260,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: width / 5,
                              child: Image.asset(
                                "images/advanced.png",
                                fit: BoxFit.cover,
                              )),
                        ))
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainQuizz(expertColor, expertQuizz)));
                  },
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: height / 5,
                      width: width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: expertColor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent),
                              child: Padding(
                                padding: EdgeInsets.all(4),
                                child: Icon(
                                  Icons.lock_open,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Niveau 3",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            Text(
                              "Expert",
                              style: GoogleFonts.poppins(
                                  fontSize: textscale * 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 120,
                        left: 260,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                              width: width / 5,
                              child: Image.asset(
                                "images/expert.png",
                                fit: BoxFit.cover,
                              )),
                        ))
                  ]),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

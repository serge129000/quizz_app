// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/constants.dart';
import 'package:quizz_app/pages/frontend/quizzui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

//textfield controller
TextEditingController username = TextEditingController();
TextEditingController age = TextEditingController();

class _IndexState extends State<Index> {
  saveUserInfo(String username, int age) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("username", username);
    sharedPreferences.setString("age", age.toString());
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textscale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height / 4, bottom: 30),
              child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    "images/quizz.png",
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Text(
                "Le Quizz qui augmente vos connaissances",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Text(
                "en cultures generales",
                style: GoogleFonts.poppins(
                    fontSize: textscale * 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 3.5),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 80, left: 30, right: 30),
                            child: ListView(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextField(
                                  controller: username,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      hintText: "ENTREZ VOTRE NOM",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)))),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: TextField(
                                    controller: age,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.pin,
                                          color: Colors.blue,
                                        ),
                                        hintText: "ENTREZ VOTRE AGE",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30)))),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 50, bottom: 15, left: 40, right: 40),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.blue)),
                                      onPressed: () {
                                        if (username.text == "" ||
                                            age.text == "") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                    "Completer tous les champs requis",
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white),
                                                  )));
                                        } else {
                                          saveUserInfo(username.text,
                                              int.parse(age.text));
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Quizz()));
                                        }
                                      },
                                      child: Text(
                                        "Debuter le QUIZZ",
                                        style: GoogleFonts.poppins(
                                            fontSize: textscale * 15,
                                            color: Colors.white),
                                      )),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    "Commencer",
                    style: GoogleFonts.poppins(
                        fontSize: textscale * 15, color: Colors.blue),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

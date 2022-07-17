// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget onFinish(double height, double width, double textscale, int score,
    String name, List<Color> colors, _) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: colors)),
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: SizedBox(
              width: width,
              height: height / 4,
              child: Center(
                  child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 10)),
                padding: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Score",
                      style: GoogleFonts.poppins(
                          fontSize: textscale * 20, color: Colors.white),
                    ),
                    Text(score.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: textscale * 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 50
            ),
            width: width,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(_);
                  },
                  child: Text(
                    "retour",
                    style: GoogleFonts.poppins(
                        fontSize: textscale * 15, color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    ),
  );
}

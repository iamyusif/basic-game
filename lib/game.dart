import 'package:flutter/material.dart';
import 'package:sayt_tahmin/gameOver.dart';
import 'package:sayt_tahmin/levelTwo.dart';
import 'package:sayt_tahmin/named.dart';
// import math library
import 'dart:math';

import 'package:sayt_tahmin/win.dart';

class game extends StatefulWidget {

  Named named = Named(name: "name");
  game({required this.named});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  int randomNumber = Random().nextInt(30);
  var tfNumber = TextEditingController();
  String number = "";
  int guess = 5;
  @override
  Widget build(BuildContext context) {

    var ekranBoyut = MediaQuery.of(context).size;
    final double genislik = ekranBoyut.width;
    final double yukseklik = ekranBoyut.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Level 1"),
        // add right button
        actions: [
          Padding(
            padding:  EdgeInsets.only(top:genislik / 35, right: genislik / 100),
            child: Text ("$guess", style: TextStyle(fontSize: genislik / 15, fontFamily: "Times New Roman")),
          ),
          Padding(
            padding:  EdgeInsets.only(right: genislik / 100),
            child: Image.asset(
              "photos/heart.png",
              width: genislik / 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: genislik / 10,
                  left: genislik / 100,
                  right: genislik / 100,
                  bottom: genislik / 10),
              child: Center(
                child: Text(
                  "Hello ${widget.named.name}!",
                  style: TextStyle(
                    fontSize: genislik / 15,
                    fontFamily: "Times New Roman",
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "Guess the number between 1 and 30",
                style: TextStyle(
                  fontSize: genislik / 20,
                  fontFamily: "Times New Roman",
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: genislik / 10,
                  left: genislik / 100,
                  right: genislik / 100,
                  bottom: genislik / 10),
              child: TextField(
                controller: tfNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter your number",
                  hintStyle: TextStyle(
                    fontSize: genislik / 30,
                    fontFamily: "Times New Roman",
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: genislik / 10,
                  left: genislik / 100,
                  right: genislik / 100,
                  bottom: genislik / 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    number = tfNumber.text;
                    if (number != randomNumber.toString()) {
                      guess = guess - 1;
                      print("random number: $randomNumber");
                      if (guess == 0) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => gameOver()),
                        );
                      } else {
                        if (int.parse(number) > randomNumber) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                  size: genislik / 10,
                                ),
                                content: Text("Your number is too big"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.red,
                                  size: genislik / 10,
                                ),
                                content: Text("Your number is too small"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => levelTwo()),
                      );
                    }
                  });
                },
                child: Text(
                  "Guess",
                  style: TextStyle(
                    fontSize: genislik / 20,
                    fontFamily: "Times New Roman",
                    color: Colors.red,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


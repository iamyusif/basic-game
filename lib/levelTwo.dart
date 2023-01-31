import 'package:flutter/material.dart';
import 'package:sayt_tahmin/win.dart';

import 'gameOver.dart';

class levelTwo extends StatefulWidget {
  const levelTwo({Key? key}) : super(key: key);

  @override
  State<levelTwo> createState() => _levelTwoState();
}

class _levelTwoState extends State<levelTwo> {
  @override
  int degisken = 0;
  Widget build(BuildContext context) {
    var ekranBoyut = MediaQuery.of(context).size;
    final double genislik = ekranBoyut.width;
    final double yukseklik = ekranBoyut.height;
    int guess = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Level 2"),
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                Icons.category_sharp,
                size: genislik / 5,
                color: Colors.red,
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 50),
                child: Text("Answer the question", style: TextStyle(fontSize: genislik / 15,
                color: Colors.red,
                  fontFamily: "Times New Roman",),),
              ),
              Padding(
                padding: EdgeInsets.only(top: genislik / 10),
                child: Text("What Is The Capital Of The USA?", style: TextStyle(fontSize: genislik / 20,
                  color: Colors.black,
                  fontFamily: "Times New Roman",),),
              ),
             Padding(
               padding: EdgeInsets.only(top: genislik / 10,left: genislik / 100,right: genislik / 100),
               child: Column(
                 children: [
                   RadioListTile(
                     title : Text("A) New York"),
                     value: 1,
                      groupValue: degisken,
                      onChanged: (int? value){
                        setState(() {
                          degisken = value!;
                        });
                      },

                   ),
                    RadioListTile(
                      title : Text("B) Washington"),
                      value: 2,
                      groupValue: degisken,
                      onChanged: (int? value){
                        setState(() {
                          degisken = value!;
                        });
                      },

                    ),
                    RadioListTile(
                      title : Text("C) Los Angeles"),
                      value: 3,
                      groupValue: degisken,
                      onChanged: (int? value){
                        setState(() {
                          degisken = value!;
                        });
                      },

                    ),
                    RadioListTile(
                      title : Text("D) Chicago"),
                      value: 4,
                      groupValue: degisken,
                      onChanged: (int? value){
                        setState(() {
                          degisken = value!;
                        });
                      },
                    ),
                   ElevatedButton(
                        onPressed: () {
                         if (degisken != 2){
                           guess = guess - 1;
                           if (guess == 0){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => gameOver()));
                           }
                         }
                         else{
                           Navigator.push(context, MaterialPageRoute(builder: (context) => win()));
                         }
                        },
                        child: Text("Check")
                   )
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}

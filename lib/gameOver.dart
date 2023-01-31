import 'package:flutter/material.dart';
import 'package:sayt_tahmin/main.dart';

class gameOver extends StatefulWidget {
  const gameOver({Key? key}) : super(key: key);

  @override
  State<gameOver> createState() => _gameOverState();
}

class _gameOverState extends State<gameOver> {
  @override
  Widget build(BuildContext context) {
    var ekranBoyut = MediaQuery.of(context).size;
    final double genislik = ekranBoyut.width;
    final double yukseklik = ekranBoyut.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Over"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            Icon(Icons.sentiment_very_dissatisfied, size: genislik/2,
            color: Colors.red,),
            Text("Game Over", style: TextStyle(fontSize: genislik / 15 ,
            color: Colors.red ),),
            Padding(
              padding: EdgeInsets.only(top : genislik / 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text("Play Again"),
              ),
            )
          ]
        ),
      )
    );
  }
}

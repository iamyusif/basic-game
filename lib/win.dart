import 'package:flutter/material.dart';
import 'package:sayt_tahmin/main.dart';

class win extends StatefulWidget {
  const win({Key? key}) : super(key: key);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    var ekranBoyut = MediaQuery.of(context).size;
    final double genislik = ekranBoyut.width;
    final double yukseklik = ekranBoyut.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("You Win"),
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: genislik / 10),
              child: Icon(Icons.sentiment_very_satisfied, size: 200,
              color: Colors.green,),
            ),
            Text("You Win", style: TextStyle(fontSize: 30,
            color: Colors.green ),),
            Padding(
              padding: EdgeInsets.only(top : 50),
              child: ElevatedButton(

                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text("Play Again"),
              ),
            )
          ],
        ),
      )
    );
  }
}

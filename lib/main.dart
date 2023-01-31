import 'package:flutter/material.dart';
import 'package:sayt_tahmin/game.dart';
import 'package:sayt_tahmin/named.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tfName = TextEditingController();
  var user = "";

  @override
  Widget build(BuildContext context) {
    var ekranBoyut = MediaQuery.of(context).size;
    final double genislik = ekranBoyut.width;
    final double yukseklik = ekranBoyut.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "photos/zer.png",
                  width: genislik / 2.1,
                ),
                Text(
                  "Welcome to the game!",
                  style: TextStyle(
                    fontSize: genislik / 15,
                    fontFamily: "Times New Roman",
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: genislik / 10,
                      bottom: genislik / 10,
                      left: genislik / 100,
                      right: genislik / 100),
                  child: TextField(
                    controller: tfName,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
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
                ElevatedButton(
                  onPressed: () {
                    if (tfName.text != "") {
                      user = tfName.text;
                      Named named = Named(name: user);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => game(named: named)));
                    }
                  },
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: genislik / 25,
                      fontFamily: "Times New Roman",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

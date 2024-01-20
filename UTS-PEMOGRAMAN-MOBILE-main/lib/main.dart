import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile.dart';
import 'package:flutter_application_1/Regis.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: 300,
                margin: EdgeInsets.only(top: 50),
                child: Image(image: AssetImage('assets/images/doctor.png'))),
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 25, right: 10, left: 10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.orangeAccent,
                          filled: true,
                          border: OutlineInputBorder(),
                          labelText: 'Username'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      /*...*/
                      decoration: InputDecoration(
                        fillColor: Colors.orangeAccent,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 25,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: Raisedbutton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't Have Account ?",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5,
                right: 20,
                left: 25,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Regis()));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton({required Null Function() onPressed, required Text child, required Color color, required RoundedRectangleBorder shape}) {}
}

Raisedbutton({required Null Function() onPressed, required Text child, required Color color, required RoundedRectangleBorder shape}) {
}

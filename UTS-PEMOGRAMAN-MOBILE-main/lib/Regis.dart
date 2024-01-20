import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile.dart';

class Regis extends StatefulWidget {
  const Regis({Key? key}) : super(key: key);

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50, right: 50, left: 50),
            child: Text(
              'Create Your Account!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
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
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.orangeAccent,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Email'),
                ),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.only(
              top: 20,
              right: 20,
              left: 25,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
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
    );
  }
}

RaisedButton({required Null Function() onPressed, required Text child, required Color color, required RoundedRectangleBorder shape}) {
}

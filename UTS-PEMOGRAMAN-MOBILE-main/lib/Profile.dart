import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        children: <Widget>[
          Container(
            width: 300,
            margin: EdgeInsets.only(top: 50, left: 50, right: 50),
          ),
          Container(
              child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/images/maul.JPG'),
          )),
          SizedBox(height: 20),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Hello, \n\ This my Profile',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Maulana Aris Irawan',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Nim : 20190801372',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Maulanairawan129@gmail.com',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Container()
        ],
      ),
    );
  }
}

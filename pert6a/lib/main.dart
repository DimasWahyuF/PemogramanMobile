import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return ListTile(
                    title: Text('Name: ${user.name}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${user.email}'),
                        Text('Password: ${user.password}'),
                        Text('created_at: ${user.createdAt}'),
                        Text('updated_at: ${user.updatedAt}'),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Text('No data found.');
            }
          },
        ),
      ),
    );
  }
}

Future<List<User>> fetchUserData() async {
  final response = await http.get(Uri.parse('https://uts.djambred.my.id/api/student'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    List<User> users = jsonResponse.map((data) => User.fromJson(data)).toList();
    return users;
  } else {
    throw Exception('Failed to load data');
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
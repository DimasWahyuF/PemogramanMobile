import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Yogyakarta',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Jawa Tengah, Indonesia',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Wisata Yogyakarta', style: TextStyle(fontSize: 20)),
            ],
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu, color: Colors.white),
                ),
              );
            },
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Option 1'),
                    value: 'option1',
                  ),
                  PopupMenuItem(
                    child: Text('Option 2'),
                    value: 'option2',
                  ),
                  PopupMenuItem(
                    child: Text('Option 3'),
                    value: 'option3',
                  ),
                ];
              },
              onSelected: (value) {
                // Handle the selected option
                print('Selected: $value');
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://cdn3.vectorstock.com/i/1000x1000/24/77/yogyakarta-indonesia-map-grey-vector-23602477.jpg',
                      width: 200,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Wisata Jogja',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Maps'),
                onTap: () {
                  // Handle item 1 click
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Website'),
                onTap: () {
                  // Handle item 2 click
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Image.network(
              'https://img.freepik.com/premium-vector/yogyakarta-indonesia-skyline-landmarks_281368-211.jpg?w=2000',
              width: 800,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            Container(
              padding: const EdgeInsets.all(32),
              child: const Text(
                'Letak Kota Yogyakarta dilalui oleh tiga sungai, yaitu Sungai Winongo, Sungai Gajahwong dan Sungai Code. Sungai Winongo berada di bagian barat Kota Yogyakarta, sedangkan Sungai Gajahwong berada di bagian timur. Sementara Sungai Code berada di tengah Kota Yogyakarta.[18] Keberadaan Sungai Code membelah Kota Yogyakarta menjadi dua bagian. Kota ini terletak pada jarak 600 KM dari Jakarta, 116 KM dari Semarang, dan 65 KM dari Surakarta, pada jalur persimpangan Bandung–Semarang–Surabaya–Pacitan. Kota ini memiliki ketinggian sekitar 112 m dpl.',
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

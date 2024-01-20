import 'package:flutter/material.dart';
import 'package:uaspemogramanmobile/datamodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ShopPage(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart), // Icon untuk Shop
              label: const Text('Shop'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingProductPage()),
                );
              },
              icon: const Icon(Icons.settings), // Icon untuk Setting Product
              label: const Text('Setting Product'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const UserPage()), // Ganti dengan UserPage
                );
              },
              icon: const Icon(Icons.person), // Icon untuk User
              label: const Text('User'), // Ganti dengan 'User'
            ),
          ],
        ),
      ),
    );
  }
}

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<DataModel> data = [];

  void _addProduct(DataModel newdata) {
    setState(() {
      data.add(newdata);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = data.length <= 0
        ? Center(child: Text('data product masih kosong, silahkan add product!'))
        : Column(
      children: [
        ...data
            .map(
              (e) => Column(
            children: [
              ProductCard(e.name, e.deskripsi),
            ],
          ),
        )
            .toList(),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Daftar Produk:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              content,
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => AddProductPage(addProduct: _addProduct),
                    ),
                  );
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key, required this.addProduct});
  final void Function(DataModel) addProduct;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final formKey = GlobalKey<FormState>();

  var name = '';
  var price = 0;
  var deskripsi = '';

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
    widget
        .addProduct(DataModel(name: name, deskripsi: deskripsi, price: price));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product Page"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 30,
                      decoration: const InputDecoration(
                        label: Text("Name"),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().length <= 0) {
                          return 'name tidak boleh kosong!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 30,
                      decoration: const InputDecoration(
                        label: Text("Price"),
                      ),
                      validator: (value) {
                        if (value == null ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be valid, positive number.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        price = int.parse(value!);
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                maxLength: 30,
                decoration: const InputDecoration(
                  label: Text("Deskripsi"),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.trim().length <= 0) {
                    return 'deskripsi tidak boleh kosong';
                  }
                  ;
                  return null;
                },
                onSaved: (value) {
                  deskripsi = value!;
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: onSubmit,
                    child: const Text("Add Product"),
                  ),
                  TextButton(
                    onPressed: () {
                      formKey.currentState!.reset();
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productDescription;

  const ProductCard(this.productName, this.productDescription, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: const Icon(Icons.shopping_basket), // Icon untuk Produk
        title: Text(productName),
        subtitle: Text(productDescription),
        onTap: () {
          // Tambahkan logika untuk menangani ketika pengguna mengklik produk
        },
      ),
    );
  }
}

class SettingProductPage extends StatelessWidget {
  const SettingProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Product'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CategoryTile('Category 1'),
          CategoryTile('Category 2'),
          CategoryTile('Category 3'),
          // Tambahkan lebih banyak CategoryTile sesuai kebutuhan

          SizedBox(height: 20),

          Text(
            'Tags:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TagTile('Tag 1'),
          TagTile('Tag 2'),
          TagTile('Tag 3'),
          // Tambahkan lebih banyak TagTile sesuai kebutuhan
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName;

  const CategoryTile(this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.category), // Icon untuk Kategori
      title: Text(categoryName),
      onTap: () {
        // Tambahkan logika untuk menangani ketika pengguna mengklik kategori
      },
    );
  }
}

class TagTile extends StatelessWidget {
  final String tagName;

  const TagTile(this.tagName, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.tag), // Icon untuk Tag
      title: Text(tagName),
      onTap: () {
        // Tambahkan logika untuk menangani ketika pengguna mengklik tag
      },
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  // Halaman User
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: const Center(
        child: Text('Ini adalah halaman User'),
      ),
    );
  }
}
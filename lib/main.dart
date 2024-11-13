import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manhaj Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xF1F3C2)),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'EagleLake',
          ),
        )
      ),
      home: const HomePage(title: 'Manhaj Books'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Fungsi untuk menampilkan Snackbar dengan tampilan lebih menarik
  void showSnackbar(BuildContext context, String message, IconData icon) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          // Icon(icon, color: Colors.white), // Ikon dalam snackbar
          SizedBox(width: 10), // Jarak antara ikon dan teks
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFE8B86D), // Warna latar belakang snackbar
      behavior: SnackBarBehavior.floating, // Agar snackbar melayang
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Radius agar terlihat lebih modern
      ),
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.green,
        onPressed: () {
          // Tindakan ketika tombol OK pada Snackbar ditekan
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA1D6B2),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFA1D6B2),
              ),
              child: Text('Menu', style: TextStyle(
                  color: Colors.white, fontSize: 24
                ),
              ),
            ),
            ListTile(
              title: Text('Halaman Utama'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tambah Item'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItemPage()));
              },
            ),
          ],
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                showSnackbar(context, 'Kamu telah menekan tombol Lihat Daftar Produk', Icons.list);
              },
              icon: Icon(Icons.list),
              label: Text('Lihat Daftar Produk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE8B86D),
                minimumSize: Size(200, 40),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItemPage()));
              },
              icon: Icon(Icons.add),
              label: Text('Tambah Produk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFCEDF9F),
                minimumSize: Size(200, 40),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () {
                showSnackbar(context, 'Kamu telah menekan tombol Logout', Icons.logout);
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8080),
                minimumSize: Size(200, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _bookTitleController = TextEditingController();
  // final _amountController = TextEditingController();
  double _amount = 1;
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Item'),
        backgroundColor: Color(0xFFA1D6B2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name(Customer)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'nama pelanggan tidak boleh kosong';
                  }
                  else if(RegExp(r'[0-9]').hasMatch(value)){
                    return 'Nama harus tidak mengandung angka';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bookTitleController,
                decoration: InputDecoration(labelText: 'Book title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'judul buku boleh kosong';
                  }
                  else if(RegExp(r'[0-9]').hasMatch(value)){
                    return 'Nama harus tidak mengandung angka';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   controller: _amountController,
              //   decoration: InputDecoration(labelText: 'Amount'),
              //   keyboardType: TextInputType.number,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Amount tidak boleh kosong';
              //     }
              //     final n = num.tryParse(value);
              //     if (RegExp(r'[A-Z, a-z]').hasMatch(value)){
              //       return 'input harus berupa angka';
              //     }
              //     if (n == null || n <= 0) {
              //       return 'Amount harus angka positif';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Text('Amount: ${_amount.round()}'),
              Slider(
                value: _amount,
                min: 1,
                max: 10,
                divisions: 9,
                label: _amount.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _amount = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Item Detail'),
                          content: Text(
                            'Name: ${_nameController.text}\n'
                            'Book title: ${_bookTitleController.text}\n'
                            'Amount: ${_amount.round()}\n'
                            'Description: ${_descriptionController.text}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFCEDF9F)
                ),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bookTitleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

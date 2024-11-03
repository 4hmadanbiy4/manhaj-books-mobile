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
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xF1F3C2)),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white, // Warna teks pada navbar
            fontSize: 20, // Ukuran font
            fontWeight: FontWeight.bold, // Ketebalan font
            fontFamily: 'EagleLake', // Ganti dengan font yang Anda inginkan
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
  // Fungsi untuk menampilkan Snackbar dengan pesan yang sesuai tombol
  void showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                // Snackbar untuk tombol Lihat Daftar Produk
                showSnackbar(context, 'Kamu telah menekan tombol Lihat Daftar Produk');
              },
              icon: Icon(Icons.list),
              label: Text('Lihat Daftar Produk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE8B86D), // Warna tombol Lihat Daftar Produk
                minimumSize: Size(200, 40), // Panjang dan tinggi tombol
              ),
            ),
            SizedBox(height: 16.0), // Jarak antar tombol
            ElevatedButton.icon(
              onPressed: () {
                // Snackbar untuk tombol Tambah Produk
                showSnackbar(context, 'Kamu telah menekan tombol Tambah Produk');
              },
              icon: Icon(Icons.add),
              label: Text('Tambah Produk'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFCEDF9F), // Warna tombol Tambah Produk
                minimumSize: Size(200, 40), // Panjang dan tinggi tombol
              ),
            ),
            SizedBox(height: 16.0), // Jarak antar tombol
            ElevatedButton.icon(
              onPressed: () {
                // Snackbar untuk tombol Logout
                showSnackbar(context, 'Kamu telah menekan tombol Logout');
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8080), // Warna tombol Logout
                minimumSize: Size(200, 40), // Panjang dan tinggi tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}

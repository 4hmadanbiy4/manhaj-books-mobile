import 'package:flutter/material.dart';
import 'package:manhaj_books/screens/list_reservation.dart';
import 'package:manhaj_books/screens/login.dart';
import 'package:manhaj_books/screens/res_form.dart';
import 'package:manhaj_books/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
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
      home: const LoginPage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
        title: Text('Manhaj Books'),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'EagleLake',
          ),
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReservationPage()),
                  );
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationFormPage()));
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

// class _HomePageState extends State<HomePage> {
//   // Fungsi untuk menampilkan Snackbar dengan tampilan lebih menarik
// }

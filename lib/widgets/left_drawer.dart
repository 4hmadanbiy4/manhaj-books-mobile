import 'package:flutter/material.dart';
import 'package:manhaj_books/main.dart';
import 'package:manhaj_books/screens/list_reservation.dart';
import 'package:manhaj_books/screens/res_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
              },
            ),
            ListTile(
              title: Text('Tambah Item'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReservationFormPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text('Daftar Pesanan'),
              onTap: () {
                  // Route menu ke halaman mood
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReservationPage()),
                  );
              },
          ),
          ],
        )
      );
  }
}
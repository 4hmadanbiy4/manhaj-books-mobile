import 'package:flutter/material.dart';
import 'package:manhaj_books/models/reservation.dart';
import 'package:manhaj_books/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  Future<List<Reservation>> fetchReservations(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;

    String loggedInUser = request.jsonData['username'] ?? '';

    List<Reservation> listReservations = [];
    for (var d in data) {
      if (d != null && d['fields']['pemesan'] == loggedInUser) {
        listReservations.add(Reservation.fromJson(d));
      }
    }
    return listReservations;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    // Check if the user is logged in
    if (request.jsonData['username'] == null) {
      return const Center(
        child: Text('You must log in to view reservations.'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reservation List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFA1D6B2),
      ),
      drawer: const LeftDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F3C2), Color(0xFFCEDF9F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: fetchReservations(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No reservations found.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF59A5D8),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8B86D),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person_rounded,
                                color: Colors.white),
                            Text(
                              "${snapshot.data![index].fields.pemesan}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ]
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.menu_book_rounded,
                                color: Colors.white),
                            const SizedBox(height: 8),
                            Text(
                              "${snapshot.data![index].fields.buku}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.shopping_bag_outlined,
                                color: Colors.white),
                            const SizedBox(width: 8),
                            Text(
                              "${snapshot.data![index].fields.pcs}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

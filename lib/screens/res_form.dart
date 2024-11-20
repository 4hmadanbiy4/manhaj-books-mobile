

import 'package:flutter/material.dart';

class ReservationFormPage extends StatefulWidget {
  const ReservationFormPage({super.key});

  @override
  State<ReservationFormPage> createState() => _ReservationFormPageState();
}

class _ReservationFormPageState extends State<ReservationFormPage> {
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
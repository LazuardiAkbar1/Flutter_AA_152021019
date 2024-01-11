import 'package:flutter/material.dart';
import 'package:flutter_todo_app/halamanketiga.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanBaru(),
    );
  }
}

class HalamanBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Diri'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: BiodataCard(),
      ),
    );
  }
}

class BiodataCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/images/ardi.jpeg'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lazuardi Akbar Sopian',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Umur: 20 Tahun',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Alamat: Pesona Cibereum Permai Blok U no.15',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi yang diinginkan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Halamanketiga()),
                );
              },
              child: Text('Hubungi Saya'),
            ),
          ],
        ),
      ),
    );
  }
}

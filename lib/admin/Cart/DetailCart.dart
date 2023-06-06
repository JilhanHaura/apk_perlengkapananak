import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailCart extends StatefulWidget {
  const DetailCart({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<DetailCart> createState() => _DetailCartState();
}

class _DetailCartState extends State<DetailCart> {
  Map<String, dynamic>? data;

  Future<void> getDataPesanan() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getdetailpemesanan.php?id=${widget.id}'));
    setState(() {
      data = jsonDecode(response.body);
    });
    debugPrint("$data");
  }

  @override
  void initState() {
    super.initState();
    getDataPesanan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ID User: ${data?['id_user'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ID Product: ${data?['id_product'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Full Name: ${data?['fullname'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tanggal: ${data?['tanggal'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Phone: ${data?['phone'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Informasi: ${data?['informasi'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Alamat: ${data?['alamat'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'image: ${data?['image'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Kurir: ${data?['kurir'] ?? ''}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

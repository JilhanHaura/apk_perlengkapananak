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
  var images = "";
  var url = "https://jilhan.000webhostapp.com/uploads/";

  Future<void> getDataPesanan() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getdetailPesanan.php?id=${widget.id}'));
    setState(() {
      data = jsonDecode(response.body);
    });
    if (data != null && data!['image'] != null) {
      images = url + data!['image'];
      print(images);
    }
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
                'ID User: ${(data?['id_user'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tittle Product: ${(data?['title_product'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Full Name: ${(data?['fullname'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tanggal: ${(data?['tanggal'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Phone: ${(data?['phone'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Informasi: ${(data?['informasi'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Alamat: ${(data?['alamat'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: images.isNotEmpty
                  ? Image.network(images, width: 250, height: 250)
                  : Text('No image available'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Kurir: ${(data?['kurir'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'quantity: ${(data?['quantity'] ?? '') as String}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

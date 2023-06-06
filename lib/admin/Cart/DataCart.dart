import 'dart:convert';
import 'package:cobayangbaru/admin/Cart/DetailCart.dart';
import 'package:cobayangbaru/admin/Sidebar/Sidebar.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DataCart extends StatefulWidget {
  const DataCart({super.key});

  @override
  State<DataCart> createState() => _DataCartState();
}

class _DataCartState extends State<DataCart> {
  List user = [];

  void getDataUser() async {
    String Url = "https://jilhan.000webhostapp.com/viewpemesanan.php";
    var response = await http.get(Uri.parse(Url));
    setState(() {
      user = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    getDataUser();
    super.initState();
  }

  void delete(String id) async {
    String Url = "https://jilhan.000webhostapp.com/deletepemesan.php";
    await http.post(Uri.parse(Url), body: {'id': id});
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebarAdmin(),
      appBar: AppBar(
        title: Text("Welcome Admin!!"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromARGB(255, 224, 206, 8),
                Color.fromARGB(255, 237, 164, 29)
              ])),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black),
                ),
              ),
              DataColumn(
                label: Text(
                  'Nama Pembeli',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black),
                ),
              ),
              DataColumn(
                label: Text(
                  'No Handphone',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black),
                ),
              ),
              DataColumn(
                label: Text(
                  'Action',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black),
                ),
              ),
            ],
            rows: user.map((data) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(data['id'])),
                  DataCell(Text(data['fullname'])),
                  DataCell(Text(data['phone'])),
                  DataCell(
                    Row(
                      children: [
                        ElevatedButton(
                          // icon: Icon(Icons.details),
                          onPressed: () async {
                            var inserted = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailCart(
                                          id: data['id'],
                                        )));
                          },
                          child: Text("Details"),
                        ),
                        IconButton(
                            onPressed: () {
                              delete(data['id']);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

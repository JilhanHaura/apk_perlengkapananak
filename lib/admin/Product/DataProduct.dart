import 'dart:convert';

import 'package:cobayangbaru/admin/Product/EditProduct.dart';
import 'package:cobayangbaru/admin/Product/FormProduct.dart';
import 'package:cobayangbaru/admin/Sidebar/Sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class dataproduct extends StatefulWidget {
  const dataproduct({super.key});

  @override
  State<dataproduct> createState() => _dataproductState();
}

class _dataproductState extends State<dataproduct> {
  List product = [];

  void getdataproduct() async {
    String Url = "https://jilhan.000webhostapp.com/viewproduct.php";
    var response = await http.get(Uri.parse(Url));
    setState(() {
      product = jsonDecode(response.body);
    });
  }

  void delete(String id) async {
    String url = "https://jilhan.000webhostapp.com/deleteproduct.php";
    await http.post(Uri.parse(url), body: {'id': id});
    getdataproduct();
  }

  @override
  void initState() {
    getdataproduct();
    super.initState();
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
                    'Title',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Description',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Price',
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
              rows: product.map((data) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data['id'])),
                    DataCell(Text(data['tittle'])),
                    DataCell(Text(data['description'])),
                    DataCell(Text(data['price'].toString())),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.update),
                            onPressed: () async {
                              var inserted = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProduct(
                                            id: data['id'],
                                          )));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              delete(data["id"]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var inserted = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddFormProduct()));
            },
            child: const Icon(CupertinoIcons.add_circled)));
  }
}

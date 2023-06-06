import 'dart:convert';
import 'package:cobayangbaru/admin/Categorie/EditCategorie.dart';
import 'package:cobayangbaru/admin/Categorie/FormCategorie.dart';
import 'package:cobayangbaru/admin/Sidebar/Sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DataCategorie extends StatefulWidget {
  const DataCategorie({super.key});

  @override
  State<DataCategorie> createState() => _DataCategorieState();
}

class _DataCategorieState extends State<DataCategorie> {
  List kategori = [];

  void getDataKategori() async {
    String Url = "https://jilhan.000webhostapp.com/viewkategori.php";
    var response = await http.get(Uri.parse(Url));
    setState(() {
      kategori = jsonDecode(response.body);
    });
  }

  void delete(String id) async {
    String Url = "https://jilhan.000webhostapp.com/deletekategori.php";
    await http.post(Uri.parse(Url), body: {'id': id});
    getDataKategori();
  }

  @override
  void initState() {
    getDataKategori();
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
          scrollDirection: Axis.vertical,
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
                    'Categorie',
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
              rows: kategori.map((data) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data['id'])),
                    DataCell(Text(data['categories'])),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.update),
                            onPressed: () async {
                              var inserted = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditCategorie(
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
                  MaterialPageRoute(builder: (context) => FormCategorie()));
            },
            child: const Icon(CupertinoIcons.add_circled)));
  }
}

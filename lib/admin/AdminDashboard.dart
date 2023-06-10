import 'dart:convert';

import 'package:cobayangbaru/admin/Cart/DataCart.dart';
import 'package:cobayangbaru/admin/Categorie/DataCategorie.dart';
import 'package:cobayangbaru/admin/Product/DataProduct.dart';
import 'package:cobayangbaru/admin/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int dataCount = 0;
  int dataCategorie = 0;
  int dataProduct = 0;
  int dataOrder = 0;
  Future<void> fetchDataCount() async {
    try {
      final response = await http.get(
        Uri.parse('https://jilhan.000webhostapp.com/getjumuser.php'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dataCount = int.parse(data['count']);
        });
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchCountCategories() async {
    try {
      final response = await http.get(
        Uri.parse('https://jilhan.000webhostapp.com/getjumCategorie.php'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dataCategorie = int.parse(data['count']);
        });
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchCountProduct() async {
    try {
      final Response = await http
          .get(Uri.parse('https://jilhan.000webhostapp.com/getjumProduct.php'));
      if (Response.statusCode == 200) {
        final data = json.decode(Response.body);
        setState(() {
          dataProduct = int.parse(data['count']);
        });
      } else {
        print('Failed : ${Response.body}');
      }
    } catch (e) {
      print('error: $e');
    }
  }

  Future<void> fetchCountOrder() async {
    try {
      final response = await http
          .get(Uri.parse('https://jilhan.000webhostapp.com/getjumorder.php'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dataOrder = int.parse(data['count']);
        });
      } else {
        print("failed : ${response.body}");
      }
    } catch (e) {
      print('error : $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataCount();
    fetchCountCategories();
    fetchCountProduct();
    fetchCountOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sidebarAdmin(),
        appBar: AppBar(
          title: Text("Welcome "),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "DASHBOARD",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: [
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: InkWell(
                          onTap: () {},
                          child: Card(
                            color: Colors.amberAccent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$dataCount',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Total User',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DataCategorie()),
                              );
                            },
                            child: Card(
                                child: Card(
                              color: Colors.amberAccent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$dataCategorie',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Total Categories",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          )),
                      SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DataProduct()),
                                );
                              },
                              child: Card(
                                child: Card(
                                  color: Colors.amberAccent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$dataProduct',
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(height: 10.0),
                                          Text(
                                            "Total Product",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ))),
                      SizedBox(
                        width: 160.0,
                        height: 160.0,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DataCart()));
                            },
                            child: Card(
                              color: Colors.amberAccent,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$dataOrder',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Total Pemesanan",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // const Padding(
              //   padding: EdgeInsets.all(18.0),
              //   child: Text(
              //     "PEMESANAN",
              //     style: TextStyle(
              //         fontSize: 28.0,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black),
              //     textAlign: TextAlign.start,
              //   ),
              // ),
              SizedBox(
                height: 10,
                // child: dataproduct(),
              ),
            ],
          )),
        ));
  }
}

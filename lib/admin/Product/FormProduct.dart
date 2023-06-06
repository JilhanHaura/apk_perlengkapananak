import 'dart:convert';

import 'package:cobayangbaru/admin/Product/DataProduct.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AddFormProduct extends StatefulWidget {
  const AddFormProduct({super.key});
  // const AddFormProduct({required this.username});
  // final String username;
  @override
  State<AddFormProduct> createState() => _AddFormProductState();
}

class _AddFormProductState extends State<AddFormProduct> {
  final _formKey = GlobalKey<FormState>();
  String tittle = "";
  String kategori_id = "";
  String description = "";
  String price = "";
  // String discount = "";
  // String time = "";
  List listData = [];

  Future<void> onSubmitPressed() async {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid == true) {
      String url = "https://jilhan.000webhostapp.com/addproduct.php";
      try {
        // DateTime now = DateTime.now();
        // time =
        //     "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}";
        await http.post(Uri.parse(url), body: {
          'tittle': tittle,
          'kategori_id': kategori_id,
          'description': description,
          'price': price,
          // 'time': time,
          // 'discount': discount,
        }).then((Response) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dataproduct()))
            });
      } catch (exc) {
        debugPrint(exc.toString());
      }
    }
  }

  void getKategori() async {
    var response = await http
        .get(Uri.parse('https://jilhan.000webhostapp.com/getkategori.php'));
    setState(() {
      listData = jsonDecode(response.body);
      kategori_id = listData.first['id'];
    });
    debugPrint("${listData}");
  }

  @override
  void initState() {
    super.initState();
    getKategori();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Text("Add Product",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  autocorrect: true,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "Tittle Product",
                    labelText: "Entri Tittle Product",
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: const Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: const Icon(Icons.title),
                    ),
                    filled: true,
                    fillColor: Colors.amberAccent,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the tittle field';
                    }
                    return null;
                  },
                  onChanged: ((value) => tittle = value),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: kategori_id!,
                hint: Text('kategori'),
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    kategori_id = value!;
                  });
                },
                items: [
                  for (var i = 0; i < listData.length; i++)
                    DropdownMenuItem<String>(
                      value: listData[i]['id'],
                      child: Text(listData[i]['categories']),
                    )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Description",
                    labelText: "Entri Description Product",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 5.0,
                      child: Icon(Icons.description),
                    ),
                    filled: true,
                    fillColor: Colors.amberAccent,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  // obscureText: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the description field';
                    }
                    return null;
                  },
                  onChanged: ((value) => description = value),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Price",
                    labelText: "Entri Your Price",
                    labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                    suffixIcon: Align(
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: Icon(Icons.price_change),
                    ),
                    filled: true,
                    fillColor: Colors.amberAccent,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please fill the price field';
                    }

                    return null;
                  },
                  onChanged: ((value) => price = value),
                )),
            const Divider(height: 30),
            ElevatedButton(
                child: const Text('SEND'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: onSubmitPressed),
          ],
        ),
      )),
    );
  }
}

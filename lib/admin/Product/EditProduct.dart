import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatefulWidget {
  const EditProduct({super.key, required this.id});
  final String id;
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final tittlController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  void loadDataProduct() async {
    String url =
        "https://jilhan.000webhostapp.com/addproduct.php?id=${widget.id}";
    try {
      var response = await http.get(Uri.parse(url));
      var result = jsonDecode(response.body);
      tittlController.text = result['tittle'];
      descriptionController.text = result['description'];
      priceController.text = result['price'];
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onUpdatePressed() async {
    String url = "https://jilhan.000webhostapp.com/editproduct.php";
    try {
      await http.post(Uri.parse(url), body: {
        'id': widget.id,
        'tittle': tittlController.text,
        'description': descriptionController.text,
        'price': priceController.text,
      }).then((value) => Navigator.pop(context));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Form(
        // key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Text("Edit Product",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  controller: tittlController,
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
                  // onChanged: ((value) => tittle = value),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  controller: descriptionController,
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
                  // onChanged: ((value) => description = value),
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  controller: priceController,
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
                  // onChanged: ((value) => price = value),
                )),
            const Divider(height: 30),
            ElevatedButton(
                child: const Text('Update'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: onUpdatePressed),
          ],
        ),
      )),
    );
  }
}

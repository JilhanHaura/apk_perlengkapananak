import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class EditCategorie extends StatefulWidget {
  const EditCategorie({super.key, required this.id});
  final String id;
  @override
  State<EditCategorie> createState() => _EditCategorieState();
}

class _EditCategorieState extends State<EditCategorie> {
  final categoriController = TextEditingController();

  void loadDataKategori() async {
    String Url =
        "https://jilhan.000webhostapp.com/addkategoriproduct.php?id=${widget.id}";
    try {
      var response = await http.get(Uri.parse(Url));
      var result = jsonDecode(response.body);
      categoriController.text = result['categories'];
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onUpdatePressed() async {
    String Url = "https://jilhan.000webhostapp.com/editkategori.php";
    try {
      await http.post(Uri.parse(Url), body: {
        'id': widget.id,
        'categories': categoriController.text
      }).then((value) => Navigator.pop(context));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Form(
        // key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Text("Update Categorie Product",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                child: TextFormField(
                  controller: categoriController,
                  autocorrect: true,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    hintText: "categorie Product",
                    labelText: "Entri categorie Product",
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
                      return 'Please fill the categories field';
                    }
                    return null;
                  },
                  // onChanged: ((value) => categories = value),
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

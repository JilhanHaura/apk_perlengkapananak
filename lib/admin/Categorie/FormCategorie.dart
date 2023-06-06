import 'package:cobayangbaru/admin/Categorie/DataCategorie.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FormCategorie extends StatefulWidget {
  const FormCategorie({super.key});

  @override
  State<FormCategorie> createState() => _FormCategorieState();
}

class _FormCategorieState extends State<FormCategorie> {
  final _formKey = GlobalKey<FormState>();
  String categories = "";

  Future<void> onSubmitPressed() async {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid == true) {
      String url = "https://jilhan.000webhostapp.com/addkategoriproduct.php";
      try {
        await http.post(Uri.parse(url), body: {
          'categories': categories,
        }).then((Response) => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataCategorie()))
            });
      } catch (exc) {
        debugPrint(exc.toString());
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Text("Add Categorie Product",
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
                  onChanged: ((value) => categories = value),
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

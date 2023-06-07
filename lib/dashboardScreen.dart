import 'package:cobayangbaru/main/Sidebar/sidebar.dart';
import 'package:cobayangbaru/main/product/bestProduct.dart';
import 'package:cobayangbaru/main/kategori/katgoriWidget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      drawer: sidebarUser(id: '1'),
      appBar: AppBar(title: Text("Welcome ${args['username']}")),
      body: ListView(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 60,
            child: kategori(),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Best Product",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: BestProduct(),
          )
        ],
      ),
    );
  }
}

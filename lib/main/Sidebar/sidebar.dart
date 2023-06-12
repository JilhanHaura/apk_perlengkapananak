import 'dart:convert';

import 'package:cobayangbaru/LOGIN/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sidebarUser extends StatefulWidget {
  const sidebarUser({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<sidebarUser> createState() => _sidebarUserState();
}

class _sidebarUserState extends State<sidebarUser> {
  Map<String, dynamic>? data;

  void getUser() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getnamauser.php?id=${widget.id}'));
    setState(() {
      data = jsonDecode(response.body);
    });
    debugPrint("$data");
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> logout(BuildContext context) async {
    final logoutUrl = 'https://jilhan.000webhostapp.com/logout.php';
    await http.post(Uri.parse(logoutUrl));

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/', // Gunakan nama rute login yang sesuai
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('customer'),
            accountEmail: Text('customer@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {},
          ),
          // ListTile(
          //   leading: Icon(Icons.ad_units),
          //   title: Text('Akun'),
          //   onTap: () {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.ac_unit_outlined),
          //   title: Text('Pemesanan'),
          //   onTap: () {},
          // ),
          Divider(),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => {
              logout(context)
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => LoginPage()))
            },
          ),
        ],
      ),
    );
  }
}

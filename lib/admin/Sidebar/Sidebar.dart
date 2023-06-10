import 'package:cobayangbaru/admin/AdminDashboard.dart';
import 'package:cobayangbaru/admin/Cart/DataCart.dart';
import 'package:cobayangbaru/admin/Categorie/DataCategorie.dart';
import 'package:cobayangbaru/admin/Product/DataProduct.dart';
import 'package:cobayangbaru/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sidebarAdmin extends StatefulWidget {
  const sidebarAdmin({Key? key}) : super(key: key);

  @override
  State<sidebarAdmin> createState() => _sidebarAdminState();
}

class _sidebarAdminState extends State<sidebarAdmin> {
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
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('jilhan'),
            accountEmail: Text('jilhan@gmail.com'),
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
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AdminDashboard()))
            },
          ),
          ListTile(
            leading: Icon(Icons.ad_units),
            title: Text('Product'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DataProduct()))
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit_outlined),
            title: Text('Categories'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DataCategorie()))
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Pemesanan'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => DataCart()))
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('customer page'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
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

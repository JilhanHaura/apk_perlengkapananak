import 'package:cobayangbaru/LOGIN/login.dart';
import 'package:cobayangbaru/admin/AdminDashboard.dart';
import 'package:cobayangbaru/dashboardScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      // home: const DashboardScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/admin_home': (context) => AdminDashboard(),
        '/customer_home': (context) => DashboardScreen(),
      },
    );
  }
}

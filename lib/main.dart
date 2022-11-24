import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:balance/screens/balance.dart';
import 'package:balance/screens/create.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.teal,
        backgroundColor: Colors.white70,
      ),
      home: MyBalancePage(),
      routes: {
        '/create-bill': (context) => CreateBill(),
      },
    );
  }
}

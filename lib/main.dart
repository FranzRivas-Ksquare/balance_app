import 'package:balance/providers/bill.provider.dart';
import 'package:flutter/material.dart';
import 'package:balance/screens/balance.dart';
import 'package:balance/screens/create.dart';
import 'package:provider/provider.dart';
import 'package:balance/custom_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BillProvider()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: customColor,
          backgroundColor: const Color(0xFFFAF8F4),
        ),
        home: const MyBalancePage(),
        routes: {
          '/create-bill': (context) => CreateBill(),
        },
      ),
    );
  }
}

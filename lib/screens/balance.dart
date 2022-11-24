import 'package:flutter/material.dart';

class MyBalancePage extends StatefulWidget {
  const MyBalancePage({super.key});
  @override
  State<MyBalancePage> createState() => _MyBalancePageState();
}

class _MyBalancePageState extends State<MyBalancePage> {
  late String balance = '\$10,000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.fromLTRB(0, 90, 0, 50),
              color: Colors.teal,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'BALANCE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500
                    )
                  ),
                  Text(
                    '$balance USD',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 37,
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 1)),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
            Bill(),
          ],
        ),
      ),
    );
  }
}

// padding: const EdgeInsets.all(10),

class Bill extends StatelessWidget {
  Bill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 70,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ),
              ),
              Text(
                'Date',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 11,
                ),
              ),
            ],
          ),
          Text(
            '\$5,000',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
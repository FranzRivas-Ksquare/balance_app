import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:balance/providers/bill.provider.dart';

class MyBalancePage extends StatefulWidget {
  const MyBalancePage({super.key});
  @override
  State<MyBalancePage> createState() => _MyBalancePageState();
}

class _MyBalancePageState extends State<MyBalancePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
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
                  Consumer<BillProvider>(
                    builder: ((context, obj, child) {
                      var total = obj.total;
                    return Text(
                      '\$$total USD',
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          fontSize: 37,
                      ),
                    );}
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 1)),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/create-bill');
                        },
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
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              height: 400,
              child: Consumer<BillProvider>(
                builder: ((context, obj, child) {
                  var balance = obj.balance;
                  return ListView.builder(
                      itemCount: balance.length,
                      itemBuilder: ((context, index) {
                        return Dismissible(
                          key: ValueKey(balance[index]),
                          onDismissed: (direction) {
                            Provider.of<BillProvider>(
                                context,
                                listen: false)
                                .removeBill(index);
                            Provider.of<BillProvider>(
                                context,
                                listen: false)
                                .getTotal();
                          },
                          child: Bill(
                            title: balance[index].title,
                            type: balance[index].type,
                            amount: balance[index].amount,
                            date: balance[index].date,
                          ),
                        );
                      })
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// padding: const EdgeInsets.all(10),

class Bill extends StatelessWidget {
  final String? title;
  final String type;
  final num amount;
  final String date;

  const Bill({
    super.key,
    this.title,
    required this.type,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 70,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 10),
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
                title ?? '',
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 11,
                ),
              ),
            ],
          ),
          Text(
            '\$$amount',
            style: TextStyle(
              color: type == 'TypeBill.income'
                  ? Colors.green
                  : Colors.red,
              fontFamily: 'Montserrat',
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
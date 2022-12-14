import 'package:balance/providers/bill.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:balance/models/bill.model.dart';

enum TypeBill { income, expense }

class CreateBill extends StatefulWidget {
  CreateBill({super.key});

  @override
  State<CreateBill> createState() => _CreateBillState();
}

class _CreateBillState extends State<CreateBill> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController _titleCtrl = TextEditingController();

  TextEditingController _amountCtrl = TextEditingController();

  TextEditingController _descriptionCtrl = TextEditingController();

  // DateTime.now()

  TypeBill? _typeBill = TypeBill.income;

  @override
  Widget build(BuildContext context){

    return GestureDetector(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAF8F4),
        appBar: AppBar(
            key: const Key('appbar'),
            foregroundColor: const Color(0xFFFFFFFF)),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Radio<TypeBill>(
                          key: const Key('income'),
                          value: TypeBill.income,
                          groupValue: _typeBill,
                          onChanged: (TypeBill? value) {
                            setState(() {
                              _typeBill = value;
                            });
                          },
                        ),
                        const Text('Income', style: TextStyle(fontSize: 17)),
                        const SizedBox(width: 50),
                        Radio<TypeBill>(
                          key: const Key('expense'),
                          value: TypeBill.expense,
                          groupValue: _typeBill,
                          onChanged: (TypeBill? value) {
                            setState(() {
                              _typeBill = value;
                            });
                          },
                        ),
                        const Text('Expense', style: TextStyle(fontSize: 17)),
                        const SizedBox(width: 45),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextFormField(
                        key: const Key('title'),
                        controller: _titleCtrl,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                            prefixIcon: Icon(Icons.title, color: Color(0xFF56B38F),)
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextFormField(
                        key: const Key('amount'),
                        controller: _amountCtrl,
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'This is required';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                            prefixIcon: Icon(Icons.money, color: Color(0xFF56B38F),)
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: TextFormField(
                        controller: _descriptionCtrl,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                            prefixIcon: Icon(Icons.description, color: Color(0xFF56B38F),)
                        ),
                      ),
                    ),
                    Container(
                      key: const Key('submit'),
                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                      child: ElevatedButton(
                          onPressed: () {
                            // try to unfocused the keyboard
                            FocusManager.instance.primaryFocus?.unfocus();

                            if(_formKey.currentState!.validate()) {

                              Bill register = Bill(
                                title: _titleCtrl.text,
                                type: _typeBill.toString(),
                                amount: _typeBill == TypeBill.expense
                                    ? num.tryParse(_amountCtrl.text)! * -1
                                    : num.tryParse(_amountCtrl.text)!,
                                date: DateTime.now().toIso8601String(),
                                description: _descriptionCtrl.text,
                              );

                              Provider.of<BillProvider>(
                                  context,
                                  listen: false)
                                  .addBill(register);

                              Provider.of<BillProvider>(
                                  context,
                                  listen: false)
                                  .getTotal();

                              Navigator.pop(context);

                            }
                          },
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
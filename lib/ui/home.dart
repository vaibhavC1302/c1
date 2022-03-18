import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

class Mortgage extends StatefulWidget {
  @override
  State<Mortgage> createState() => _MortgageState();
}

class _MortgageState extends State<Mortgage> {
  double _interest = 0.0;
  int _lenOfLoan = 0;
  double _homePrice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Mortgage Payment"),
      ),
      body: ListView(
        children: [
          Container(
            height: 130,
            child: Card(
              elevation: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Monthly payments"),
                  Text(
                      "${(_homePrice > 0 && _interest > 0) ? "\$${calculateMonthlyPayments(_homePrice, _lenOfLoan, _interest)}" : ""}")
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                        prefixText: "home loan", prefixIcon: Icon(Icons.home)),
                    onChanged: (String value) {
                      try {
                        _homePrice = double.parse(value);
                      } catch (exceptions) {
                        _homePrice = 0.0;
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("length of loan(years)"),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_lenOfLoan > 0) {
                                _lenOfLoan -= 1;
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.red),
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            child: Text("-"),
                          ),
                        ),
                        Text("$_lenOfLoan"),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _lenOfLoan += 1;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.red),
                            child: Text("+"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Interest"), Text("$_interest %")],
                ),
                Slider(
                    min: 0,
                    max: 10,
                    divisions: 10,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    value: _interest,
                    onChanged: (double Newvalue) {
                      setState(() {
                        _interest = Newvalue;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  calculateMonthlyPayments(double homeprice, int lenofloan, double interest) {
    int n = 12 * lenofloan;
    double c = interest / 12.0 / 100.0;
    double monthlypayment = 0.0;
    if (homeprice < 0 || homeprice.toString().isEmpty || homeprice == null) {
    } else {
      monthlypayment = homeprice * c * pow(c + 1, n) / (pow(1 + c, n) - 1);
    }
    return monthlypayment.toStringAsFixed(2);
  }
}

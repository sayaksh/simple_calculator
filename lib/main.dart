// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorDesign(),
    );
  }
}

class CalculatorDesign extends StatefulWidget {
  const CalculatorDesign({Key? key}) : super(key: key);

  @override
  State<CalculatorDesign> createState() => _CalculatorDesignState();
}

class _CalculatorDesignState extends State<CalculatorDesign> {
  var userInput = TextEditingController();

  String values = '0';
  String valController = '';
  double oper1 = 0;
  double oper2 = 0;
  bool isOper1 = false;
  String operator = '';
  bool isOperator = false;
  double result = 0;
  bool isFirst = true;

  clearText() {
    isOper1 = false;
    isOperator = false;
    operator = '';
    isFirst = true;
    result = 0;
    setState(() {
      values = '0';
      valController = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 239, 238),
        shadowColor: Colors.amber,
        title: const Text(
          'Calculator',
          style:
              TextStyle(color: Color.fromARGB(255, 47, 72, 84), fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                            height: 80,
                            width: 30,
                            child: const Text(
                              "Hello there !!! Its simple calculator that developed by Ksh. Saya Devi, try it once and take the taste....Hehe",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 14),
                            )),
                      );
                    });
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Color.fromARGB(255, 47, 72, 84),
              ))
        ],
      ),
      backgroundColor: Color.fromARGB(255, 231, 225, 225),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 245, 241, 241),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Text(
                    values,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 4,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            clearText();
                          },
                          child: const Text(
                            'C',
                            style: TextStyle(fontSize: 30, color: Colors.red),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            onBackSpace();
                          },
                          child: const Icon(Icons.backspace,
                              size: 30, color: Colors.amber),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('%');
                          },
                          child: const Text('%',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.amber)),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('/');
                          },
                          child: const Text(
                            '/',
                            style: TextStyle(fontSize: 30, color: Colors.amber),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: (() {
                            calculation('7');
                          }),
                          child: const Text(
                            '7',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: (() {
                            calculation('8');
                          }),
                          child: const Text(
                            '8',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('9');
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text(
                            '9',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('*');
                          },
                          child: const Text(
                            '*',
                            style: TextStyle(fontSize: 30, color: Colors.amber),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('4');
                          },
                          child: const Text(
                            '4',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: (() {
                            calculation('5');
                          }),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text(
                            '5',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              calculation('6');
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text('6',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 48, 86, 105)))),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('-');
                          },
                          child: const Text('-',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.amber)),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('1');
                          },
                          child: const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('2');
                          },
                          child: const Text(
                            '2',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              calculation('3');
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text('3',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 48, 86, 105)))),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              calculation('+');
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text('+',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.amber))),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('');
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Icon(Icons.settings,
                              size: 30, color: Colors.amber),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('0');
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text(
                            '0',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            calculation('.');
                          },
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          child: const Text(
                            '.',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 48, 86, 105)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              calculation('=');
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: const Text('=',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.amber))),
                      ),
                    ],
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 4,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  updateText(String val) {
    setState(() {
      //if no value is not yet added
      if (isFirst) {
        isFirst = false;
        values = val;
      } else {
        values += val;
      }
    });
  }

  calculation(String val) {
    try {
      double d = double.parse(val);
      valController += '$d';
      updateText('$d');
    } on FormatException {
      calculationCheck(val);
    }
  }

  onBackSpace() {
    String s;
    if (values != '' || values.length > 0) {
      setState(() {
        values = values.substring(0, values.length - 1);
      });
    }
  }

  calculationCheck(String val) {
    try {
      ('add result = $oper1  $oper2}');
      if (!isFirst) {
        if (isOperator) {
          oper2 = double.parse(valController);
          valController = '';
          (oper2.toString());
        } else {
          oper1 = double.parse(valController);
          valController = '';
          (oper1.toString());
        }
        isOperator = true;
      }
    } on FormatException {
      ('Enter a number');
    }
    if (val == 'clear') {
      clearText();
    }
    if (val == '+') {
      operator = '+';
      updateText('+');
      result = oper1 + oper2;
    }
    if (val == '-') {
      operator = '-';
      updateText('-');
      result = oper1 - oper2;
    }
    if (val == '/') {
      operator = '/';
      updateText('/');
      oper2 = 1;
      result = oper1 / oper2;
    }
    if (val == '*') {
      operator = '*';
      updateText('*');
      oper2 = 1;
      result = oper1 * oper2;
    }

    if (val == '%') {
      operator = '%';
      updateText('%');

      result = oper1 % oper2;

      if (result.isNaN) {
        result = 0;
      }
    }
    if (val == '=') {
      updateText('\n=');
      if (operator == '+') {
        result = oper1 + oper2;
      }
      if (operator == '-') {
        result = oper1 - oper2;
      }
      if (operator == '*') {
        result = oper1 * oper2;
      }
      if (operator == '%') {
        result = oper1 % oper2;
      }
      if (operator == '/') {
        if (oper2 == 0) {
          result = 0;
        } else {
          result = oper1 / oper2;
        }
      }

      updateText('$result');
    }

    oper1 = result;
    oper2 = 0;
    ('{Operand1 = $oper1\nOperand2 = $oper2}');
  }
}

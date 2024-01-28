import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "0";
  String input = "Input";
  String equation = "";
  double tempOut = 0;
  String temp = "0";
  String operator = "";
  double operand1 = 0, operand2 = 0;

  final List<String> _buttons = [
    "C",
    "%",
    "000",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "00",
    "0",
    ".",
    "="
  ];

  Widget buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () => onButtonPressed(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: const Text(
            'Calculator',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.black26,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                input,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                equation,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
              child: Text(
                output,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                    child: Row(
                      children: [
                        buildButton(_buttons[0]),
                        buildButton(_buttons[1]),
                        buildButton(_buttons[2]),
                        buildButton(_buttons[3]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                    child: Row(
                      children: [
                        buildButton(_buttons[4]),
                        buildButton(_buttons[5]),
                        buildButton(_buttons[6]),
                        buildButton(_buttons[7]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                    child: Row(
                      children: [
                        buildButton(_buttons[8]),
                        buildButton(_buttons[9]),
                        buildButton(_buttons[10]),
                        buildButton(_buttons[11]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                    child: Row(
                      children: [
                        buildButton(_buttons[12]),
                        buildButton(_buttons[13]),
                        buildButton(_buttons[14]),
                        buildButton(_buttons[15]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                    child: Row(
                      children: [
                        buildButton(_buttons[16]),
                        buildButton(_buttons[17]),
                        buildButton(_buttons[18]),
                        buildButton(_buttons[19]),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  onButtonPressed(String text) {
    print(text);
    setState(() {
      if (text == "C") {
        operand1 = 0;
        operand2 = 0;
        output = "0";
        equation = "";
        tempOut = 0;
        operator = "";
        input = "Input";
        temp = "";
      } else if (isOperator(text)) {
        operator = text;
        operand1 = double.parse(temp);
        equation = equation + operator;
        temp = "0";
      } else if (text == ".") {
        if (temp.contains(".")) {
          print("!! Can't use more than one decimal ");
          return;
        }
        temp = temp + text;
      } else if (text == "=") {
        double res = 0;

        operand2 = double.parse(temp);
        if (operator == "+") {
          res = operand1 + operand2;
        } else if (operator == "-") {
          res = operand1 - operand2;
        } else if (operator == "*") {
          res = operand1 * operand2;
        } else if (operator == "/") {
          if (operand2 == 0) {
            print("oops !! can't divide by 0");
            return;
          }
          res = operand1 / operand2;
        }
        temp = res.toString();

        output = "=" + temp;
        temp = operand1.toString() + operator + operand2.toString();
        operand1 = 0;
        operand2 = 0;
        operator = "";
      } else {
        if (temp == "0") {
          temp = text;
        } else {
          temp = temp + text;
        }
        input = temp;
        equation = equation + text;
      }
    });
  }

  bool isOperator(String text) {
    if (text == "/" ||
        text == "*" ||
        text == "-" ||
        text == "+" ||
        text == "%") {
      return true;
    }
    return false;
  }
}

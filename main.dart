// Creator: Sami Anttalainen
// Date: 18.3.2023

import 'package:flutter/material.dart';

void main() {

  runApp(const MyApp());
  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  num numberOne = 0;
  num numberTwo = 0;
  num result = 0;
  dynamic resultText = 'Result...';
  dynamic operand = '';

  calculatorOperations(buttonTxt) {

    setState(() {
      if (resultText == "Result...") {
      resultText = '';
    }
    
    // Set number 1 and operand
    if (buttonTxt == '+' || buttonTxt == '-' || buttonTxt == '×' || buttonTxt == '÷') {
      if (numberOne == 0 && numberTwo == 0) {
        numberOne =  num.parse(resultText);
      }
      else {
        numberOne = result;
      }
      resultText = "";
      operand = buttonTxt;
    }

    // Calculation
    if (buttonTxt == '=') {

      numberTwo = num.parse(resultText);
      
      if (operand == '+') {
        result = numberOne + numberTwo;
      }
      else if (operand == '-') {
        result = numberOne - numberTwo;
      }
      else if (operand == '×') {
        result = numberOne * numberTwo;
      }
      else if (operand == '÷') {
        result = numberOne / numberTwo;
      }
      resultText = result.toString();
    }

    // Number input
    if (buttonTxt == '0' || buttonTxt == '1' || buttonTxt == '2' || buttonTxt == '3' || buttonTxt == '4' || buttonTxt == '5' || buttonTxt == '6' || buttonTxt == '7' || buttonTxt == '8' || buttonTxt == '9' || buttonTxt == '.') {
      resultText = resultText + buttonTxt;
    }

    // Reset
    if (resultText == '.') {
      numberOne = 0;
      numberTwo = 0;
      result = 0;
      resultText = '';
      operand = '';
    }
 
  });
}

  // ignore: non_constant_identifier_names
  Widget button(String buttonTxt, Color buttonColor, Color buttonTxtColor, OutlinedBorder buttonShape) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(75, 75),
          textStyle: TextStyle(fontSize: 28, color: buttonTxtColor),
          shape: buttonShape,
          padding: const EdgeInsets.all(10),
            ),
            child: Text(buttonTxt,
            style: TextStyle(fontSize: 35,
            color: buttonTxtColor
            ),
            ),
            onPressed: () => {
              calculatorOperations(buttonTxt)
            },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen[100],
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Calculator',),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 300,
                        width: 650,
                        padding: const EdgeInsets.all(25.0),
                        // ignore: prefer_const_constructors
                        decoration: (BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.teal,
                          
                      )
                      ),
                        alignment: Alignment.center,
                        child: Text(resultText,
                        style: const TextStyle(fontSize: 35),
                        ),
                      ) 
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button('7', Colors.teal, Colors.black, const CircleBorder()),
                  button('8', Colors.teal, Colors.black, const CircleBorder()),
                  button('9', Colors.teal, Colors.black, const CircleBorder()),
                  button('÷', Colors.teal, Colors.black, const RoundedRectangleBorder()),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button('4',Colors.teal,Colors.black, const CircleBorder()),
                  button('5',Colors.teal,Colors.black, const CircleBorder()),
                  button('6',Colors.teal,Colors.black, const CircleBorder()),
                  button('×',Colors.teal,Colors.black, const RoundedRectangleBorder()),
              ],
            ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button('1',Colors.teal,Colors.black, const CircleBorder()),
                  button('2',Colors.teal,Colors.black, const CircleBorder()),
                  button('3',Colors.teal,Colors.black, const CircleBorder()),
                  button('+',Colors.teal,Colors.black, const RoundedRectangleBorder()),
              ],
            ),
            const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button('0',Colors.teal,Colors.black, const CircleBorder()),
                  button('.',Colors.teal,Colors.black, const CircleBorder()),
                  button('=',Colors.teal,Colors.black, const RoundedRectangleBorder()),
                  button('-',Colors.teal,Colors.black, const RoundedRectangleBorder()),
              ],
            ),
            const SizedBox(height: 20),
            ],
          ),
          ),
        // Extra buttons that are not needed
        /*bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.clear),
              label: 'Clear',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.undo),
              label: 'Undo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
        ),*/
      ),
    );
  }
}
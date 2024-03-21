import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String display = '';
  List total = [];
  String result = '';

  buttonPressed(String value) {
    if (total.isEmpty) {
      setState(() {
        total.add(value);
      });
    } else {
      if (total.last != '+' &&
          total.last != '-' &&
          total.last != '/' &&
          total.last != '*') {
        if (value != '+' && value != '-' && value != '/' && value != '*') {
          if (total.last != '0') {
            setState(() {
              total[total.length - 1] = '${total.last}$value';
            });
          } else {
            setState(() {
              total[total.length - 1] = '$value';
            });
          }
        } else {
          setState(() {
            total.add(value);
          });
        }
      } else {
        if (value != '+' && value != '-' && value != '/' && value != '*') {
          setState(() {
            total.add(value);
          });
        } else {
          setState(() {
            total[total.length - 1] = value;
          });
        }
      }
    }
    result = total.join(' ');
  }

  cal() {
    if (total.last == '+' &&
        total.last == '-' &&
        total.last == '/' &&
        total.last == '*') {
      total.removeLast();
      setState(() {});
    }
    result = calculateExpression(total);

    print("PPPPPPPPPPPPPPPPPPPPPP");
    print(result);
    setState(() {});
  }

  String calculateExpression(List expression) {
    double finalResult = 0.0;
    List<List> resultList = [];
    for (int i = 0; i <= expression.length; i++) {
      if (finalResult == 0.0 ) {
        String firstNumber = expression[i];
        String secondNumber = expression[i + 1];
        String thirdNumber = expression[i + 2];

        switch (secondNumber) {
          case '+':
            finalResult = double.parse(firstNumber) + double.parse(thirdNumber);
            break;
          case '-':
            finalResult = double.parse(firstNumber) - double.parse(thirdNumber);
            break;
          case '*':
            finalResult = double.parse(firstNumber) * double.parse(thirdNumber);
            break;
          case '/':
            finalResult = double.parse(firstNumber) / double.parse(thirdNumber);
            break;
          default:
            print('Invalid operator: $secondNumber');
            break;
        }
      }
      else{
        if(i == 1){
          for (int i = 3; i < expression.length; i += 2) {
            List<dynamic> sublist = [expression[i], expression[i - 1]];
            resultList.add(sublist);
          }
        }
      }

    }

    List<List<dynamic>> resultListCount = [];

    resultListCount.addAll(resultList.reversed.toList());

    for(var count = 0 ; count < resultListCount.length ; count++){
      String sign = resultListCount[count][0];
      String number = resultListCount[count][1];

      switch (sign) {
        case '+':
          finalResult = finalResult + double.parse(number);
          break;
        case '-':
          finalResult = finalResult - double.parse(number);
          break;
        case '*':   
          finalResult = finalResult * double.parse(number);
          break;
        case '/':
          finalResult = finalResult / double.parse(number);
          break;
        default:
          print('Invalid operator: $number');
          break;
      }
    }
    return finalResult.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[300],
                child: Center(
                    child: Text(
                  result,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
            CustomButton(
              buttonName1: "0",
              buttonName2: "1",
              buttonClick1: (value) {
                buttonPressed(value);
              },
              buttonClick2: (value) {
                buttonPressed(value);
              },
            ),
            CustomButton(
              buttonName1: "2",
              buttonName2: "3",
              buttonClick1: (value) {
                buttonPressed(value);
              },
              buttonClick2: (value) {
                buttonPressed(value);
              },
            ),
            CustomButton(
              buttonName1: "4",
              buttonName2: "5",
              buttonClick1: (value) {
                buttonPressed(value);
              },
              buttonClick2: (value) {
                buttonPressed(value);
              },
            ),
            CustomButton(
                buttonName1: "6",
                buttonName2: "7",
                buttonClick1: (value) {
                  buttonPressed(value);
                },
                buttonClick2: (value) {
                  buttonPressed(value);
                }),
            CustomButton(
              buttonName1: "8",
              buttonName2: "9",
              buttonClick1: (value) {
                buttonPressed(value);
              },
              buttonClick2: (value) {
                buttonPressed(value);
              },
            ),
            CustomButton(
              buttonName1: "+",
              buttonName2: "-",
              buttonClick1: (value) {
                buttonPressed(value);
              },
              buttonClick2: (value) {
                buttonPressed(value);
              },
            ),
            CustomButton(
              buttonName1: "/",
              buttonName2: "*",
              buttonClick1: (value) {
                buttonPressed(value);
              },
              buttonClick2: (value) {
                buttonPressed(value);
              },
            ),
            CustomButton(
              buttonName1: "=",
              buttonName2: "C",
              buttonClick1: (value) {
                cal();
              },
              buttonClick2: (value) {
                setState(() {
                  total.clear();
                  result = '';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final String buttonName1, buttonName2;
  final Function(String) buttonClick1;
  final Function(String) buttonClick2;

  const CustomButton(
      {super.key,
      required this.buttonName1,
      required this.buttonName2,
      required this.buttonClick1,
      required this.buttonClick2});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                widget.buttonClick1(widget.buttonName1);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.buttonName1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: () {
                widget.buttonClick2(widget.buttonName2);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.buttonName2,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

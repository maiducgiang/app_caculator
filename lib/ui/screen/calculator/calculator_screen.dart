import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:mubaha/icons/assets.gen.dart';
import 'package:mubaha/ui/theme/constant.dart';
import '../../../foundatation/constant.dart';
import 'dart:math' as math;

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = '';
  String answer = '';
  final ScrollController _scrollController = ScrollController();

  void handleClick(String value) {
    switch (value.toLowerCase()) {
      case 'c':
        setState(() {
          userInput = '';
          answer = '';
        });
        break;
      case '+/-':
        break;
      case '=':
        setState(() {
          equalPressed();
        });
        break;
      default:
        setState(() {
          _scrollController.animateTo(
              _scrollController.position.maxScrollExtent + 100,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease);
          userInput = userInput + value;
        });
        break;
    }
  }

   List<String> fx = [
    '(',
    ')',
    '\u221A', //sqrt
    '\u03C0', // pi
    'log',
    'sin',
    'cos',
    'tan',
    'sin\u207B\u00B9', // sin^-1
    'cos\u207B\u00B9',
    'tan\u207B\u00B9'
  ];

  void equalPressed() {
    try {
      String finaluserinput = userInput
          .replaceAll(String.fromCharCode(0x00D7), '*')
          .replaceAll(String.fromCharCode(0x00F7), '/')
          .replaceAll(String.fromCharCode(0x2212), '-')
          .replaceAll(',', '.')
          .replaceAll('%', '*(1/100)')
          .replaceAll('π', '(${math.pi})')
          .replaceAll('√', 'sqrt')
          .replaceAll('sin⁻¹', 'arcsin')
          .replaceAll('cos⁻¹', 'arccos')
          .replaceAll('tan⁻¹', 'arctan');
      Parser p = Parser();
      log(finaluserinput);
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
    } catch (e) {
      log(e.toString());
      answer = 'Lỗi';
    }
  }

  Widget buildNumberButton(displayValue) {
    return Expanded(
      child: InkWell(
        onTap: () => handleClick(displayValue),
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(right: 13, bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text(displayValue,
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: textColor)),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildZeroButton() {
    return Expanded(
      flex: 2,
      child: InkWell(
        onTap: () => handleClick('0'),
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(right: 13, bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text('0',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: textColor)),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOperatorButton(displayValue) {
    return Expanded(
      child: InkWell(
        onTap: () => handleClick(displayValue),
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
              color: displayValue == '='
                  ? const Color(0xFFFBC531)
                  : const Color(0xffFF6B6B),
              borderRadius:
                  displayValue == '=' ? null : BorderRadius.circular(20),
              shape:
                  displayValue == '=' ? BoxShape.circle : BoxShape.rectangle),
          margin: const EdgeInsets.only(bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text(displayValue,
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: textColor)),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSpecialButton(displayValue) {
    return Expanded(
      child: InkWell(
        onTap: () => handleClick(displayValue),
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(right: 13, bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text(displayValue,
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: textColor)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: backgroundColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Text(
                  userInput,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                )),
          ),
          SizedBox(height: 54.h),
          Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Text(
                  answer,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _showDialog();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: buttonColor, shape: BoxShape.circle),
                  child: Image.asset(Assets.images.icFx.path,
                      height: 24, width: 24, color: textColor),
                ),
              ),
              InkWell(
                onTap: () {
                  if (userInput.isNotEmpty) {
                    setState(() {
                      userInput = userInput.substring(0, userInput.length - 1);
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: buttonColor, shape: BoxShape.circle),
                  child: Image.asset(Assets.images.icBackspace.path,
                      height: 24, width: 24, color: textColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildSpecialButton(CalculatorConstants.CLEAR),
                  buildSpecialButton(CalculatorConstants.PLUS_MINUS),
                  buildSpecialButton(CalculatorConstants.PERCENTAGE),
                  buildOperatorButton(CalculatorConstants.DIVISION),
                ],
              ),
              Row(
                children: <Widget>[
                  buildNumberButton("7"),
                  buildNumberButton("8"),
                  buildNumberButton("9"),
                  buildOperatorButton(CalculatorConstants.MULTIPLICATION),
                ],
              ),
              Row(
                children: <Widget>[
                  buildNumberButton("4"),
                  buildNumberButton("5"),
                  buildNumberButton("6"),
                  buildOperatorButton(CalculatorConstants.SUBTRACTION),
                ],
              ),
              Row(
                children: <Widget>[
                  buildNumberButton("1"),
                  buildNumberButton("2"),
                  buildNumberButton("3"),
                  buildOperatorButton(CalculatorConstants.ADDITION),
                ],
              ),
              Row(
                children: <Widget>[
                  buildZeroButton(),
                  buildNumberButton(CalculatorConstants.DECIMAL_POINT),
                  buildOperatorButton(CalculatorConstants.EQUALS),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }

  Future<void> _showDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: backgroundColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Assets.images.icFx.path, height: 22, width: 18, color: const Color(0xFFFF6B6B),),
                    const SizedBox(height: 10),
                    Flexible(
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 6,
                                  crossAxisSpacing: 6),
                          itemCount: fx.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pop(context, fx[index]);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                      child: Text(
                                    fx[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: textColor),
                                  ))),
                            );
                          }),
                    ),
                  ],
                )));
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          userInput = userInput + (value as String);
        });
      }
    });
  }
}

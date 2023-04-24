import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:mubaha/icons/assets.gen.dart';
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

  void equalPressed() {
    try {
      String finaluserinput = userInput
          .replaceAll(String.fromCharCode(0x00D7), '*')
          .replaceAll(String.fromCharCode(0x00F7), '/')
          .replaceAll(String.fromCharCode(0x2212), '-')
          .replaceAll(',', '.')
          .replaceAll('%', '*(1/100)')
          .replaceAll('π', '(${math.pi})');
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
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(right: 13, bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text(displayValue,
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
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
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(right: 13, bottom: 13),
          child: const Center(
            child: FittedBox(
              child: Text('0',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
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
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text(displayValue,
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
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
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(right: 13, bottom: 13),
          child: Center(
            child: FittedBox(
              child: Text(displayValue,
                  style: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
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
        color: Colors.black,
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
                  style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w400),
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
                  style: const TextStyle(
                      color: Color(0xFFAFAFAF),
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
                  setState(() {
                    userInput = 'π';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color(0xFFF3F3F3), shape: BoxShape.circle),
                  child:
                      Image.asset(Assets.images.icFx.path, height: 24, width: 24),
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
                  decoration: const BoxDecoration(
                      color: Color(0xFFF3F3F3), shape: BoxShape.circle),
                  child: Image.asset(Assets.images.icBackspace.path,
                      height: 24, width: 24),
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
}

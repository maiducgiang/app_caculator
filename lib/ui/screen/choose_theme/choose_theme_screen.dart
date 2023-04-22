import 'package:flutter/material.dart';

class ChooseThemeScreen extends StatefulWidget {
  const ChooseThemeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      )
    );
  }
}

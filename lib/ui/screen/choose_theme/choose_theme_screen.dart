import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mubaha/ui/screen/choose_theme/cubit/choose_theme_cubit.dart';
import 'package:mubaha/ui/screen/choose_theme/cubit/choose_theme_state.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/theme/constant.dart';
import 'package:mubaha/ui/theme/theme.dart';

class ChooseThemeScreen extends StatefulWidget {
  const ChooseThemeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseThemeScreen> createState() => _ChooseThemeScreenState();
}

class _ChooseThemeScreenState extends State<ChooseThemeScreen> {
  late List<String> items = [];
  String value = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChooseThemeCubit()..init(),
      child: BlocConsumer<ChooseThemeCubit, ChooseThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (items.isEmpty) {
            state.listTheme.forEach(
              (key, value) {
                items.add(key);
              },
            );
          }
          value = state.currentTheme;
          if (items.isNotEmpty) {
            return Scaffold(
                backgroundColor: backgroundColor,
                body: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      buildRadios(context),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                )));
          }
          return LoadingScreen();
        },
      ),
    );
  }

  Widget buildRadios(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: titleColor,
        ),
        child: Column(
          children: items.map(
            (value) {
              final selected = this.value == value;
              final color = selected ? primaryColor : Color(0xffBDBDBD);

              return Column(
                children: [
                  RadioListTile<String>(
                    value: value,
                    groupValue: this.value,
                    title: Text(
                      value,
                      style: titleStyle.copyWith(fontSize: 18.sp, height: 0),
                    ),
                    activeColor: primaryColor,
                    onChanged: (val) => setState(() {
                      this.value = val!;

                      context
                          .read<ChooseThemeCubit>()
                          .selectTheme(this.value)
                          .then((value) {
                        showDialog1(context);
                      });
                    }),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xffD9D9D9),
                  )
                ],
              );
            },
          ).toList(),
        ),
      );

  void showDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          backgroundColor: backgroundColor,
          child: Container(
            height: 180.h,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Thông báo",
                  textAlign: TextAlign.center,
                  style: titleStyle.copyWith(
                      fontSize: 23, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Mở lại ứng dụng để sử dụng chủ đề mới",
                  textAlign: TextAlign.center,
                  style: titleStyle.copyWith(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: titleStyle.copyWith(color: Colors.grey),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        exit(0);
                        // Navigator.of(ctx).pop();
                      },
                      child: Text(
                        "Ok",
                        style: titleStyle.copyWith(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  // void showDialog1(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: const Text(
  //         "Thông báo",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(fontSize: 23),
  //       ),
  //       content: const
  //       actions: <Widget>[

  //       ],
  //     ),
  //   );
  // }
}

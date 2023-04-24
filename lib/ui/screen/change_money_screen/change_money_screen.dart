import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mubaha/ui/screen/change_money_screen/cubit/change_money_cubit.dart';
import 'package:mubaha/ui/screen/change_money_screen/cubit/change_money_state.dart';
import 'package:mubaha/ui/screen/change_money_screen/widget/dropdown.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/utils/functions.dart';
import 'package:mubaha/ui/theme/theme.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ChangeMoneyScreen extends StatefulWidget {
  const ChangeMoneyScreen({Key? key}) : super(key: key);

  @override
  State<ChangeMoneyScreen> createState() => _ChangeMoneyScreenState();
}

class _ChangeMoneyScreenState extends State<ChangeMoneyScreen> {
  final TextEditingController moneyFirstController =
      TextEditingController(text: "0");
  late String? dropdownValueFirst = null;
  final TextEditingController moneySecondController =
      TextEditingController(text: "0");
  late String? dropdownValueSecond = null;
  final Map<String, String> dataDefine = {
    "giang1": "giangvalue",
    "giang2": "giangvalue",
    "giang3": "giangvalue",
    "giang4": "giangvalue",
    "giang5": "giangvalue",
    "": ""
  };
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeMoneyCubit()..fetchData(),
      child: BlocConsumer<ChangeMoneyCubit, ChangeMoneyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.listMoney == null) {
            return LoadingScreen();
          }
          if (dropdownValueFirst == null &&
              dropdownValueSecond == null &&
              state.listMoney != null) {
            state.listMoney!.availableCurrencies.forEach((key, value) {
              dropdownValueFirst = value;
              dropdownValueSecond = value;
              //return;
            });
          }
          return GestureDetector(
            onTap: () {
              unfocus(context);
            },
            child: Scaffold(
              backgroundColor: Color(0xff22252D),
              body: Container(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    customeText(moneyFirstController, dropdownValueFirst!,
                        (value) {
                      setState(
                        () {
                          dropdownValueFirst = value;
                        },
                      );
                    }, state.listMoney!.availableCurrencies),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/icons/vector.svg",
                            width: 12.w,
                          ),
                          SvgPicture.asset(
                            "assets/images/icons/vector1.svg",
                            width: 12.w,
                          ),
                        ],
                      ),
                    ),
                    customeText(moneySecondController, dropdownValueSecond!,
                        (value) {
                      setState(
                        () {
                          dropdownValueSecond = value;
                        },
                      );
                    }, state.listMoney!.availableCurrencies),
                    Expanded(
                      child: Container(),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                                context: context,
                                icon: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                icon: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                icon: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                              context: context,
                              icon: SvgPicture.asset(
                                "assets/images/icons/delete_cacu.svg",
                                width: 26.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                                context: context,
                                icon: Text(
                                  "4",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                icon: Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                icon: Text(
                                  "6",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                col: Color(0xffFF6B6B),
                                icon: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/icons/cacu_up.svg",
                                      width: 10.w,
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/icons/cacu_down.svg",
                                      width: 10.w,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                                context: context,
                                icon: Text(
                                  "7",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                icon: Text(
                                  "8",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                icon: Text(
                                  "9",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                              context: context,
                              col: Color(0xffFF6B6B),
                              icon: SvgPicture.asset(
                                "assets/images/icons/cacu_congtru.svg",
                                width: 26.w,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                                context: context,
                                wi: 76.w + 76.w + 8.w,
                                icon: Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                              context: context,
                              icon: Text(
                                ",",
                                style: TextStyle(
                                    fontSize: 28.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            button(
                                context: context,
                                col: Color(0xffFF6B6B),
                                icon: Text(
                                  "C",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget button(
      {required BuildContext context,
      double? wi,
      double? he,
      required Widget icon,
      Color? col,
      Function? onTap}) {
    //final double sizeHeight = MediaQuery.of(context).size.width - ;
    final double width = wi ?? 76.w;
    final double height = he ?? 76.w;
    final Color color = col ?? const Color(0xff2A2D37);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13.r),
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }

  Widget customeText(TextEditingController textController, String dropdownValue,
      Function(String) onChange, Map<String, String> data) {
    // List of items in our dropdown menu
    List<String> items = [];
    data.forEach(
      (key, value) {
        items.add(value);
      },
    );
    final controller = MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ',', initialValue: 0);
    return Container(
      height: 52,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: Row(children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: TextFormField(
            autofocus: false,
            enabled: false,
            //textAlign: TextAlign.start,
            cursorColor: Colors.grey[100],
            controller: textController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value) {
              value;
            },
            style: titleStyle.copyWith(
                height: 1.h,
                wordSpacing: 0.2.w,
                letterSpacing: 0.5.w,
                fontSize: 12.sp,
                color: const Color(0xff1C2433)),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        )),
        Container(
          // padding: ,
          width: 1,
          height: 25.h,
          color: Colors.grey,
        ),
        Expanded(
            child: DropdowCom(
          comPorts: items,
          callback: (value) {
            onChange(value);
          },
        )),
      ]),
    );
  }
}

class CurrencyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text == '.') {
      return newValue.copyWith(text: '0.');
    } else if (newValue.text.contains('.') &&
        newValue.text.substring(newValue.text.indexOf('.')).length > 2) {
      return oldValue;
    }

    double value = double.parse(newValue.text);
    String newText = '\$${value.toStringAsFixed(2)}';

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

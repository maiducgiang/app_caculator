import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mubaha/ui/theme/app_path.dart';
import 'package:provider/src/provider.dart';

import '../widget/edit_popup.dart';

unfocus(BuildContext context) {
  FocusScope.of(context).unfocus();
  TextEditingController().clear();
}

addToCart(
    {required BuildContext context,
    required int amount,
    required int variantIndex,
    required int attributeIndex}) {
  // context.read<VariantCubit>().selectVariant(
  //     productId: productDetail.id,
  //     amount: amount,
  //     selectedVariant: productDetail.variants![variantIndex].id,
  //     enableAdd: true,
  //     variantIndex: attributeIndex);
}

showPopup(
    {String? title,
    bool? chooseGender,
    bool? chooseMyGender,
    required BuildContext context,
    TextEditingController? textEditingController,
    void Function(String)? onChanged,
    Function()? onTapCancel,
    Function()? onTapConfirm}) {
  showGeneralDialog(
    context: context,
    barrierColor: Colors.black12.withOpacity(0.6),
    barrierDismissible: false,
    barrierLabel: 'Dialog',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return EditPopup(
        title: title,
        onChanged: onChanged,
        textEditingController: textEditingController,
        onTapSave: onTapConfirm,
        onTapCancel: onTapCancel,
        chooseMyGender: chooseMyGender ?? true,
        chooseGender: chooseGender ?? false,
      );
    },
  );
}

enum ZodiacSign {
  aquarius,
  pisces,
  aries,
  taurus,
  gemini,
  cancer,
  leo,
  virgo,
  libra,
  scorpio,
  sagittarius,
  capricorn,
}

ZodiacSign getZodiacSign(DateTime birthday) {
  int month = birthday.month;
  int day = birthday.day;
  switch (month) {
    case 1: // January
      return day < 20 ? ZodiacSign.capricorn : ZodiacSign.aquarius;
    case 2: // February
      return day < 19 ? ZodiacSign.aquarius : ZodiacSign.pisces;
    case 3: // March
      return day < 21 ? ZodiacSign.pisces : ZodiacSign.aries;
    case 4: // April
      return day < 20 ? ZodiacSign.aries : ZodiacSign.taurus;
    case 5: // May
      return day < 21 ? ZodiacSign.taurus : ZodiacSign.gemini;
    case 6: // June
      return day < 21 ? ZodiacSign.gemini : ZodiacSign.cancer;
    case 7: // July
      return day < 23 ? ZodiacSign.cancer : ZodiacSign.leo;
    case 8: // August
      return day < 23 ? ZodiacSign.leo : ZodiacSign.virgo;
    case 9: // September
      return day < 23 ? ZodiacSign.virgo : ZodiacSign.libra;
    case 10: // October
      return day < 23 ? ZodiacSign.libra : ZodiacSign.scorpio;
    case 11: // November
      return day < 22 ? ZodiacSign.scorpio : ZodiacSign.sagittarius;
    case 12: // December
      return day < 22 ? ZodiacSign.sagittarius : ZodiacSign.capricorn;
    default:
      throw ArgumentError(
          'Invalid month: $month. Month must be between 1 and 12');
  }
}

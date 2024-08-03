import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_expense/src/theme_manager/color_manager.dart';
import 'package:money_expense/src/theme_manager/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.poppins().copyWith(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getWhiteTextStyle({
  double fontSize = FontSizeManager.f14,
  FontWeight fontWeight = FontWeighManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.sourceSansPro,
    fontWeight,
    ColorManager.white,
  );
}

TextStyle getBlackTextStyle({
  double fontSize = FontSizeManager.f14,
  FontWeight fontWeight = FontWeighManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.sourceSansPro,
    fontWeight,
    ColorManager.black,
  );
}

TextStyle getBlack2TextStyle({
  double fontSize = FontSizeManager.f14,
  FontWeight fontWeight = FontWeighManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.openSans,
    fontWeight,
    ColorManager.black,
  );
}

TextStyle getGrayTextStyle({
  double fontSize = FontSizeManager.f14,
  FontWeight fontWeight = FontWeighManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.sourceSansPro,
    fontWeight,
    ColorManager.gray,
  );
}

InputDecoration getInputDecoration({
  required String hintText,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: getGrayTextStyle(),
    contentPadding: const EdgeInsets.all(15),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          6,
        ),
      ),
      borderSide: BorderSide(color: ColorManager.gray2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(6),
      ),
      borderSide: BorderSide(color: ColorManager.primary),
    ),
  );
}

final ButtonStyle btnPrimaryStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  backgroundColor: ColorManager.primary,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
);

final ButtonStyle btnDisabledStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
  backgroundColor: ColorManager.gray2,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6),
    ),
  ),
);

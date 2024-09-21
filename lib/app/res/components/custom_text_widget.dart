import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget displayNormal(
    {required String text,
    required EdgeInsetsGeometry padding,
    required TextAlign? textAlign,
    TextDecoration? decoration,
    Color? color,
    double? fontSize}) {
  return Padding(
    padding: padding,
    child: Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontFamily: 'TiroBangla-Italic',
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: Colors.black.withOpacity(0.5),
      ),
    ),
  );
}

Widget displayMedium(
    {required String text,
    required Color? color,
    required double? fontSize,
    required TextAlign? textAlign,
    FontWeight? fontWeight,
    TextDecoration? decoration}) {
  return AutoSizeText(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      fontFamily: 'TiroBangla-Italic',
      decoration: decoration,
      decorationColor: Colors.black.withOpacity(0.5),
    ),
  );
}

Widget customLoginText(
    {required String text,
    Color? color,
    double? fontSize,
      FontWeight? fontWeight,
      TextOverflow? overflow,
    TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      overflow: overflow,
      fontFamily: 'TiroBangla-Italic',
    ),
  );
}

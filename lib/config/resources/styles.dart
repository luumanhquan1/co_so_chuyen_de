import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

const emptyView = SizedBox(width: 0, height: 0);

/// height and width space

/// height and width space
final spaceH2 = const SizedBox(height: 2);
final spaceH3 = const SizedBox(height: 3);
final spaceH4 = const SizedBox(height: 4);
final spaceH5 = const SizedBox(height: 5);
final spaceH6 = const SizedBox(height: 6);
final spaceH8 = const SizedBox(height: 8);
final spaceH10 = const SizedBox(height: 10);
final spaceH12 = const SizedBox(height: 12);
final spaceH15 = const SizedBox(height: 15);
final spaceH16 = const SizedBox(height: 16);
final spaceH20 = const SizedBox(height: 20);
final spaceH24 = const SizedBox(height: 24);
final spaceH25 = const SizedBox(height: 25);
final spaceH28 = const SizedBox(height: 28);
final spaceH30 = const SizedBox(height: 30);
final spaceH35 = const SizedBox(height: 35);
final spaceH38 = const SizedBox(height: 38);
final spaceH40 = const SizedBox(height: 40);
final spaceH46 = const SizedBox(height: 46);
final spaceH50 = const SizedBox(height: 50);
final spaceH60 = const SizedBox(height: 60);
final spaceH70 = const SizedBox(height: 70);

///W
final spaceW2 = const SizedBox(width: 2);
final spaceW3 = const SizedBox(width: 3);
final spaceW4 = const SizedBox(width: 4);
final spaceW5 = const SizedBox(width: 5);
final spaceW6 = const SizedBox(width: 6);
final spaceW8 = const SizedBox(width: 8);
final spaceW10 = const SizedBox(width: 10);
final spaceW12 = const SizedBox(width: 12);
final spaceW15 = const SizedBox(width: 15);
final spaceW16 = const SizedBox(width: 16);
final spaceW18 = const SizedBox(width: 18);
final spaceW20 = const SizedBox(width: 20);
final spaceW25 = const SizedBox(width: 25);
final spaceW30 = const SizedBox(width: 30);
final spaceW56 = const SizedBox(width: 56);
final spaceW60 = const SizedBox(width: 60);
final spaceW100 = const SizedBox(width: 100);

TextStyle textNormal(Color? color, double? fontSize) {
  return GoogleFonts.roboto(
    color: color ?? Colors.white,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: fontSize ?? 14,
  );
}

TextStyle tokenDetailAmount({
  Color color = Colors.white,
  double fontSize = 24,
  FontWeight weight = FontWeight.w400,
}) {
  return GoogleFonts.roboto(
    color: color,
    fontWeight: weight,
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
  );
}

TextStyle titleText({Color color = Colors.white, double fontSize = 20}) {
  return GoogleFonts.roboto(
    color: color,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
  );
}

TextStyle textNormalCustom({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.roboto(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: fontSize ?? 14,
  );
}

TextStyle titleAppbar({Color color = titleColor, double fontSize = 18}) {
  return GoogleFonts.roboto(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
    fontStyle: FontStyle.normal,
  );
}

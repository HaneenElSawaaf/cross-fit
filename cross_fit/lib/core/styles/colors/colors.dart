import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  static final kGreen = HexColor('#25AB75');
  static final kPurple = HexColor('#BE15A3');
  static final kGrey = HexColor('#767676');
  static final kMediumBlack = HexColor('#141111');
  static final kDarkBlack = HexColor('#181B1A');
  static final greenGradient = LinearGradient(
    colors: [
      HexColor('#209867'),
      HexColor('#25AB75'),

    ],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );
  static final pinkGradient = LinearGradient(
    colors: [
      HexColor('#AF17A5'),
      HexColor('#3900DB'),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

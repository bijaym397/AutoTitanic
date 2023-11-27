import 'package:auto_titanic/utils/extensions.dart';
import 'package:flutter/material.dart';

class Dimens {
  const Dimens._();

  static const double appbarHeight = hundred;

  static double get screenWidth => 0.7.pw;

  static EdgeInsets appbarPadding =
      EdgeInsets.symmetric(horizontal: 0.15.pw, vertical: thirtyTwo);

  static const double two = 2;
  static const double four = 4;
  static const double six = 6;
  static const double eight = 8;
  static const double ten = 10;
  static const double twelve = 12;
  static const double sixteen = 16;
  static const double twenty = 20;
  static const double twentyFour = 24;
  static const double thirtyTwo = 32;
  static const double forty = 40;
  static const double fortyEight = 48;
  static const double eighty = 80;
  static const double hundred = 100;
  static const double twoHundred = 200;
  static const double threeHundred = 300;
  static const double fourHundred = 400;
  static const double fourHundredFifty = 450;
  static const double fiveHundred = 500;

  static const Widget box0 = SizedBox.shrink();

  static const Widget boxHeight2 = SizedBox(height: two);
  static const Widget boxHeight4 = SizedBox(height: four);
  static const Widget boxHeight8 = SizedBox(height: eight);
  static const Widget boxHeight10 = SizedBox(height: ten);
  static const Widget boxHeight12 = SizedBox(height: twelve);
  static const Widget boxHeight16 = SizedBox(height: sixteen);
  static const Widget boxHeight20 = SizedBox(height: twenty);
  static const Widget boxHeight24 = SizedBox(height: twentyFour);
  static const Widget boxHeight32 = SizedBox(height: thirtyTwo);
  static const Widget boxHeight48 = SizedBox(height: fortyEight);
  static const Widget boxHeight200 = SizedBox(height: twoHundred);

  static const Widget boxWidth2 = SizedBox(width: two);
  static const Widget boxWidth4 = SizedBox(width: four);
  static const Widget boxWidth8 = SizedBox(width: eight);
  static const Widget boxWidth10 = SizedBox(width: ten);
  static const Widget boxWidth12 = SizedBox(width: twelve);
  static const Widget boxWidth16 = SizedBox(width: sixteen);
  static const Widget boxWidth20 = SizedBox(width: twenty);
  static const Widget boxWidth24 = SizedBox(width: twentyFour);
  static const Widget boxWidth32 = SizedBox(width: thirtyTwo);
  static const Widget boxWidth48 = SizedBox(width: fortyEight);

  static const EdgeInsets edgeInsets0 = EdgeInsets.zero;
  static const EdgeInsets edgeInsets4 = EdgeInsets.all(four);
  static const EdgeInsets edgeInsets6 = EdgeInsets.all(six);
  static const EdgeInsets edgeInsets8 = EdgeInsets.all(eight);
  static const EdgeInsets edgeInsets10 = EdgeInsets.all(ten);
  static const EdgeInsets edgeInsets12 = EdgeInsets.all(twelve);
  static const EdgeInsets edgeInsets16 = EdgeInsets.all(sixteen);
  static const EdgeInsets edgeInsets20 = EdgeInsets.all(twenty);
  static const EdgeInsets edgeInsets40 = EdgeInsets.all(forty);

  static const EdgeInsets edgeInsetsL2 = EdgeInsets.only(left: two);

  static const EdgeInsets edgeInsetsL4 = EdgeInsets.only(left: four);
  static const EdgeInsets edgeInsetsR4 = EdgeInsets.only(right: four);
  static const EdgeInsets edgeInsetsR200 = EdgeInsets.only(right: twoHundred);

  static const EdgeInsets edgeInsets2_0 = EdgeInsets.symmetric(horizontal: two);
  static const EdgeInsets edgeInsets4_0 =
      EdgeInsets.symmetric(horizontal: four);
  static const EdgeInsets edgeInsets8_0 =
      EdgeInsets.symmetric(horizontal: eight);
  static EdgeInsets edgeInsets10_0 =
      const EdgeInsets.symmetric(horizontal: ten);
  static EdgeInsets edgeInsets16_0 =
      const EdgeInsets.symmetric(horizontal: sixteen);

  static const EdgeInsets edgeInsets0_4 = EdgeInsets.symmetric(vertical: four);
  static const EdgeInsets edgeInsets0_8 = EdgeInsets.symmetric(vertical: eight);
  static const EdgeInsets edgeInsets0_16 =
      EdgeInsets.symmetric(vertical: sixteen);
  static const EdgeInsets edgeInsets0_40 =
      EdgeInsets.symmetric(vertical: forty);

  static const EdgeInsets edgeInsets4_8 =
      EdgeInsets.symmetric(horizontal: four, vertical: eight);
  static const EdgeInsets edgeInsets8_4 =
      EdgeInsets.symmetric(horizontal: eight, vertical: four);
  static const EdgeInsets edgeInsets16_4 =
      EdgeInsets.symmetric(horizontal: sixteen, vertical: four);
  static const EdgeInsets edgeInsets16_20 =
      EdgeInsets.symmetric(horizontal: sixteen, vertical: twenty);
  static const EdgeInsets edgeInsets12_8 =
      EdgeInsets.symmetric(horizontal: twelve, vertical: eight);
  static const EdgeInsets edgeInsets8_32 =
      EdgeInsets.symmetric(horizontal: eight, vertical: thirtyTwo);
}

/**
 2. Add min and max price drop down on main filter box
 4. Row hover button and delay on scroll
 6. Sign In button
 */
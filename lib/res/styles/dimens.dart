import 'package:auto_titanic/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  const Dimens._();

  static final double appbarHeight = sixtyFour;

  static double get screenWidth => 0.7.pw;

  static EdgeInsets appbarPadding = EdgeInsets.symmetric(horizontal: 0.15.pw, vertical: thirtyTwo);

  static final double two = 2.sp;
  static final double four = 4.sp;
  static final double six = 6.sp;
  static final double eight = 8.sp;
  static final double ten = 10.sp;
  static final double twelve = 12.sp;
  static final double sixteen = 16.sp;
  static final double twenty = 20.sp;
  static final double twentyFour = 24.sp;
  static final double twentyEight = 28.sp;
  static final double thirtyTwo = 32.sp;
  static final double forty = 40.sp;
  static final double fortyEight = 48.sp;
  static final double sixtyFour = 64.sp;
  static final double eighty = 80.sp;
  static final double hundred = 100.sp;
  static final double twoHundred = 200.sp;
  static final double twoHundredFifty = 250.sp;
  static final double threeHundred = 300.sp;
  static final double threeFifty = 350.sp;
  static final double fourHundred = 400.sp;
  static final double fourTwentyFive = 400.sp;
  static final double fourFifty = 450.sp;
  static final double fiveHundred = 500.sp;
  static final double fiveFifty = 550.sp;

  static const Widget box0 = SizedBox.shrink();

  static final Widget boxHeight2 = SizedBox(height: two);
  static final Widget boxHeight4 = SizedBox(height: four);
  static final Widget boxHeight8 = SizedBox(height: eight);
  static final Widget boxHeight10 = SizedBox(height: ten);
  static final Widget boxHeight12 = SizedBox(height: twelve);
  static final Widget boxHeight16 = SizedBox(height: sixteen);
  static final Widget boxHeight20 = SizedBox(height: twenty);
  static final Widget boxHeight24 = SizedBox(height: twentyFour);
  static final Widget boxHeight32 = SizedBox(height: thirtyTwo);
  static final Widget boxHeight48 = SizedBox(height: fortyEight);
  static final Widget boxHeight200 = SizedBox(height: twoHundred);

  static final Widget boxWidth2 = SizedBox(width: two);
  static final Widget boxWidth4 = SizedBox(width: four);
  static final Widget boxWidth8 = SizedBox(width: eight);
  static final Widget boxWidth10 = SizedBox(width: ten);
  static final Widget boxWidth12 = SizedBox(width: twelve);
  static final Widget boxWidth16 = SizedBox(width: sixteen);
  static final Widget boxWidth20 = SizedBox(width: twenty);
  static final Widget boxWidth24 = SizedBox(width: twentyFour);
  static final Widget boxWidth32 = SizedBox(width: thirtyTwo);
  static final Widget boxWidth48 = SizedBox(width: fortyEight);

  static const EdgeInsets edgeInsets0 = EdgeInsets.zero;
  static final EdgeInsets edgeInsets4 = EdgeInsets.all(four);
  static final EdgeInsets edgeInsets6 = EdgeInsets.all(six);
  static final EdgeInsets edgeInsets8 = EdgeInsets.all(eight);
  static final EdgeInsets edgeInsets10 = EdgeInsets.all(ten);
  static final EdgeInsets edgeInsets12 = EdgeInsets.all(twelve);
  static final EdgeInsets edgeInsets16 = EdgeInsets.all(sixteen);
  static final EdgeInsets edgeInsets20 = EdgeInsets.all(twenty);
  static final EdgeInsets edgeInsets40 = EdgeInsets.all(forty);

  static final EdgeInsets edgeInsetsL2 = EdgeInsets.only(left: two);

  static final EdgeInsets edgeInsetsL4 = EdgeInsets.only(left: four);
  static final EdgeInsets edgeInsetsR4 = EdgeInsets.only(right: four);
  static final EdgeInsets edgeInsetsR8 = EdgeInsets.only(right: eight);
  static final EdgeInsets edgeInsetsR200 = EdgeInsets.only(right: twoHundred);

  static final EdgeInsets edgeInsets2_0 = EdgeInsets.symmetric(horizontal: two);
  static final EdgeInsets edgeInsets4_0 = EdgeInsets.symmetric(horizontal: four);
  static final EdgeInsets edgeInsets8_0 = EdgeInsets.symmetric(horizontal: eight);
  static final EdgeInsets edgeInsets10_0 = EdgeInsets.symmetric(horizontal: ten);
  static final EdgeInsets edgeInsets16_0 = EdgeInsets.symmetric(horizontal: sixteen);

  static final EdgeInsets edgeInsets0_4 = EdgeInsets.symmetric(vertical: four);
  static final EdgeInsets edgeInsets0_8 = EdgeInsets.symmetric(vertical: eight);
  static final EdgeInsets edgeInsets0_16 = EdgeInsets.symmetric(vertical: sixteen);
  static final EdgeInsets edgeInsets0_20 = EdgeInsets.symmetric(vertical: twenty);
  static final EdgeInsets edgeInsets0_40 = EdgeInsets.symmetric(vertical: forty);

  static final EdgeInsets edgeInsets4_8 = EdgeInsets.symmetric(horizontal: four, vertical: eight);
  static final EdgeInsets edgeInsets8_4 = EdgeInsets.symmetric(horizontal: eight, vertical: four);
  static final EdgeInsets edgeInsets16_4 = EdgeInsets.symmetric(horizontal: sixteen, vertical: four);
  static final EdgeInsets edgeInsets16_8 = EdgeInsets.symmetric(horizontal: sixteen, vertical: eight);
  static final EdgeInsets edgeInsets16_12 = EdgeInsets.symmetric(horizontal: sixteen, vertical: twelve);
  static final EdgeInsets edgeInsets16_20 = EdgeInsets.symmetric(horizontal: sixteen, vertical: twenty);
  static final EdgeInsets edgeInsets24_16 = EdgeInsets.symmetric(horizontal: twentyFour, vertical: sixteen);
  static final EdgeInsets edgeInsets24_32 = EdgeInsets.symmetric(horizontal: twentyFour, vertical: thirtyTwo);
  static final EdgeInsets edgeInsets12_8 = EdgeInsets.symmetric(horizontal: twelve, vertical: eight);
  static final EdgeInsets edgeInsets8_32 = EdgeInsets.symmetric(horizontal: eight, vertical: thirtyTwo);
}

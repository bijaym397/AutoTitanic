import 'package:auto_titanic/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  const Dimens._();

  static double get appbarHeight => sixtyFour;

  static double get screenWidth => 0.7.pw;

  static EdgeInsets appbarPadding = EdgeInsets.symmetric(horizontal: 0.15.pw, vertical: thirtyTwo);

  static double get two => 2.sp;
  static double get four => 4.sp;
  static double get six => 6.sp;
  static double get eight => 8.sp;
  static double get ten => 10.sp;
  static double get twelve => 12.sp;
  static double get sixteen => 16.sp;
  static double get twenty => 20.sp;
  static double get twentyFour => 24.sp;
  static double get twentyEight => 28.sp;
  static double get thirtyTwo => 32.sp;
  static double get forty => 40.sp;
  static double get fortyEight => 48.sp;
  static double get sixtyFour => 64.sp;
  static double get eighty => 80.sp;
  static double get hundred => 100.sp;
  static double get twoHundred => 200.sp;
  static double get twoHundredFifty => 250.sp;
  static double get twoHundredSeventyFive => 275.sp;
  static double get threeHundred => 300.sp;
  static double get threeFifty => 350.sp;
  static double get fourHundred => 400.sp;
  static double get fourTwentyFive => 400.sp;
  static double get fourFifty => 450.sp;
  static double get fiveHundred => 500.sp;
  static double get fiveFifty => 550.sp;

  static const Widget box0 = SizedBox.shrink();

  static Widget get boxHeight2 => SizedBox(height: two);
  static Widget get boxHeight4 => SizedBox(height: four);
  static Widget get boxHeight8 => SizedBox(height: eight);
  static Widget get boxHeight10 => SizedBox(height: ten);
  static Widget get boxHeight12 => SizedBox(height: twelve);
  static Widget get boxHeight16 => SizedBox(height: sixteen);
  static Widget get boxHeight20 => SizedBox(height: twenty);
  static Widget get boxHeight24 => SizedBox(height: twentyFour);
  static Widget get boxHeight32 => SizedBox(height: thirtyTwo);
  static Widget get boxHeight48 => SizedBox(height: fortyEight);
  static Widget get boxHeight200 => SizedBox(height: twoHundred);

  static Widget get boxWidth2 => SizedBox(width: two);
  static Widget get boxWidth4 => SizedBox(width: four);
  static Widget get boxWidth8 => SizedBox(width: eight);
  static Widget get boxWidth10 => SizedBox(width: ten);
  static Widget get boxWidth12 => SizedBox(width: twelve);
  static Widget get boxWidth16 => SizedBox(width: sixteen);
  static Widget get boxWidth20 => SizedBox(width: twenty);
  static Widget get boxWidth24 => SizedBox(width: twentyFour);
  static Widget get boxWidth32 => SizedBox(width: thirtyTwo);
  static Widget get boxWidth48 => SizedBox(width: fortyEight);

  static const EdgeInsets edgeInsets0 = EdgeInsets.zero;
  static EdgeInsets get edgeInsets4 => EdgeInsets.all(four);
  static EdgeInsets get edgeInsets6 => EdgeInsets.all(six);
  static EdgeInsets get edgeInsets8 => EdgeInsets.all(eight);
  static EdgeInsets get edgeInsets10 => EdgeInsets.all(ten);
  static EdgeInsets get edgeInsets12 => EdgeInsets.all(twelve);
  static EdgeInsets get edgeInsets16 => EdgeInsets.all(sixteen);
  static EdgeInsets get edgeInsets20 => EdgeInsets.all(twenty);
  static EdgeInsets get edgeInsets40 => EdgeInsets.all(forty);

  static EdgeInsets get edgeInsetsL2 => EdgeInsets.only(left: two);

  static EdgeInsets get edgeInsetsL4 => EdgeInsets.only(left: four);
  static EdgeInsets get edgeInsetsR4 => EdgeInsets.only(right: four);
  static EdgeInsets get edgeInsetsR8 => EdgeInsets.only(right: eight);
  static EdgeInsets get edgeInsetsR200 => EdgeInsets.only(right: twoHundred);

  static EdgeInsets get edgeInsets2_0 => EdgeInsets.symmetric(horizontal: two);
  static EdgeInsets get edgeInsets4_0 => EdgeInsets.symmetric(horizontal: four);
  static EdgeInsets get edgeInsets4_2 => EdgeInsets.symmetric(horizontal: four, vertical: two);
  static EdgeInsets get edgeInsets8_0 => EdgeInsets.symmetric(horizontal: eight);
  static EdgeInsets get edgeInsets10_0 => EdgeInsets.symmetric(horizontal: ten);
  static EdgeInsets get edgeInsets16_0 => EdgeInsets.symmetric(horizontal: sixteen);

  static EdgeInsets get edgeInsets0_4 => EdgeInsets.symmetric(vertical: four);
  static EdgeInsets get edgeInsets0_8 => EdgeInsets.symmetric(vertical: eight);
  static EdgeInsets get edgeInsets0_16 => EdgeInsets.symmetric(vertical: sixteen);
  static EdgeInsets get edgeInsets0_20 => EdgeInsets.symmetric(vertical: twenty);
  static EdgeInsets get edgeInsets0_40 => EdgeInsets.symmetric(vertical: forty);

  static EdgeInsets get edgeInsets4_8 => EdgeInsets.symmetric(horizontal: four, vertical: eight);
  static EdgeInsets get edgeInsets8_4 => EdgeInsets.symmetric(horizontal: eight, vertical: four);
  static EdgeInsets get edgeInsets16_4 => EdgeInsets.symmetric(horizontal: sixteen, vertical: four);
  static EdgeInsets get edgeInsets16_8 => EdgeInsets.symmetric(horizontal: sixteen, vertical: eight);
  static EdgeInsets get edgeInsets16_12 => EdgeInsets.symmetric(horizontal: sixteen, vertical: twelve);
  static EdgeInsets get edgeInsets16_20 => EdgeInsets.symmetric(horizontal: sixteen, vertical: twenty);
  static EdgeInsets get edgeInsets24_16 => EdgeInsets.symmetric(horizontal: twentyFour, vertical: sixteen);
  static EdgeInsets get edgeInsets24_32 => EdgeInsets.symmetric(horizontal: twentyFour, vertical: thirtyTwo);
  static EdgeInsets get edgeInsets12_8 => EdgeInsets.symmetric(horizontal: twelve, vertical: eight);
  static EdgeInsets get edgeInsets8_32 => EdgeInsets.symmetric(horizontal: eight, vertical: thirtyTwo);
}

import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdCard extends StatelessWidget {
  const AdCard.horizontal({
    super.key,
    required this.length,
    required this.width,
  }) : _isHorizontal = true;

  const AdCard.verticle({
    super.key,
    required this.length,
    required this.width,
  }) : _isHorizontal = false;

  final double width;
  final double length;
  final bool _isHorizontal;

  @override
  Widget build(BuildContext context) => width == 0
      ? Dimens.box0
      : SizedBox(
          height: _isHorizontal ? width : length,
          width: _isHorizontal ? length : width,
          child: const ColoredBox(
            color: Colors.grey,
            child: Center(
              child: AppText('Ad'),
            ),
          ),
        );
}

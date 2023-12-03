import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputExpandedFilters extends StatelessWidget {
  const InputExpandedFilters({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Flexible(
            flex: 3,
            child: InputField(
              hint: 'eg: sunroof, seats',
            ),
          ),
          Dimens.boxWidth8,
          Flexible(
            flex: 1,
            child: Button(
              label: 'Add',
              onTap: () {},
            ),
          ),
        ],
      );
}

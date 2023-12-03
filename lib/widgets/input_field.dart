import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.isRequired = false,
    this.hint = '',
    this.minLines,
    this.maxLines,
  });

  final bool isRequired;
  final String hint;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Dimens.forty,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.grey,
            hintText: hint.isEmpty
                ? null
                : isRequired
                    ? '*$hint'
                    : hint,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Dimens.eight),
            ),
            isDense: true,
          ),
          minLines: minLines,
          maxLines: maxLines ?? 1,
        ),
      );
}

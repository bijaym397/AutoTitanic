import 'package:auto_titanic/res/res.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.required = false,
    this.hint = '',
    this.minLines,
    this.maxLines,
  });

  final bool required;
  final String hint;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: Dimens.fortyEight,
        child: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.grey,
            hintText: hint.isEmpty
                ? null
                : required
                    ? '*$hint'
                    : hint,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(Dimens.eight),
            ),
          ),
          minLines: minLines,
          maxLines: maxLines ?? 1,
        ),
      );
}

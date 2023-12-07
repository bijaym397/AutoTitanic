import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    this.controller,
    String? label,
    this.showLabel = false,
    this.isRequired = false,
    String hint = '',
    this.minLines,
    this.maxLines,
    this.onChanged,
  })  : _hint = 'Enter $hint',
        _label = label ?? hint;

  final TextEditingController? controller;
  final bool isRequired;
  final String _hint;
  final int? minLines;
  final int? maxLines;
  final String _label;
  final bool showLabel;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLabel)
            Padding(
              padding: Dimens.edgeInsets4,
              child: Row(
                children: [
                  if (isRequired)
                    AppText(
                      '*',
                      style: context.textTheme.titleLarge!.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  AppText(
                    _label,
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          SizedBox(
            height: Dimens.forty,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                filled: true,
                fillColor: AppColors.grey,
                hintText: _hint.isEmpty
                    ? null
                    : isRequired && !showLabel
                        ? '*$_hint'
                        : _hint,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                ),
                isDense: true,
              ),
              onChanged: onChanged,
              minLines: minLines,
              maxLines: maxLines ?? 1,
            ),
          ),
        ],
      );
}

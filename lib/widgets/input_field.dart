import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.textInputType,
    this.inputFormatters,
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
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

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
                      style: Styles.titleLarge.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  AppText(
                    _label,
                    style: Styles.titleMedium,
                  ),
                ],
              ),
            ),
          SizedBox(
            height: (minLines ?? 1) > 1 ? null : Dimens.forty,
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
                hintStyle: Styles.bodyMedium,
                hintMaxLines: 1,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                ),
                isDense: true,
                contentPadding: Dimens.edgeInsets16_12,
              ),
              cursorHeight: Dimens.sixteen,
              cursorWidth: Dimens.two,
              canRequestFocus: true,
              onChanged: onChanged,
              minLines: minLines,
              maxLines: maxLines ?? 1,
              keyboardType: textInputType,
              inputFormatters: inputFormatters ?? (textInputType == TextInputType.number ? Utility.numberFormatters : null),
            ),
          ),
        ],
      );
}

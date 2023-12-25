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
    this.floatingLabel = false,
    this.isRequired = false,
    String? hint,
    this.minLines,
    this.maxLines,
    this.onChanged,
    this.textInputType,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
  })  : _hint = 'Enter ${hint ?? label}',
        _label = label ?? '';

  final TextEditingController? controller;
  final bool isRequired;
  final String _hint;
  final int? minLines;
  final int? maxLines;
  final String _label;
  final bool showLabel;
  final bool floatingLabel;
  final void Function(String?)? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final AppValidator? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!floatingLabel && showLabel)
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
          TextFormField(
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
              labelText: showLabel && floatingLabel ? _label : null,
              labelStyle: Styles.bodyMedium,
              hintStyle: Styles.bodyMedium,
              hintMaxLines: 1,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(Dimens.eight),
              ),
              isDense: true,
              contentPadding: Dimens.edgeInsets16_12,
              suffixIcon: suffixIcon,
            ),
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorHeight: Dimens.sixteen,
            cursorWidth: Dimens.two,
            style: Styles.bodyMedium,
            canRequestFocus: true,
            onChanged: onChanged,
            minLines: minLines,
            maxLines: maxLines ?? 1,
            keyboardType: textInputType,
            inputFormatters: inputFormatters ?? (textInputType == TextInputType.number ? Utility.numberFormatters : null),
          ),
        ],
      );
}

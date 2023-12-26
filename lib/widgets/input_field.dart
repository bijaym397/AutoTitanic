import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

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

class InputEditor extends StatelessWidget {
  const InputEditor({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.isRequired = false,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final QuillEditorController controller;
  final String? label;
  final String? hint;
  final bool isRequired;
  final int minLines;
  final int maxLines;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
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
                    label!,
                    style: Styles.titleMedium,
                  ),
                ],
              ),
            ),
          ],
          ToolBar(
            controller: controller,
            direction: Axis.horizontal,
            activeIconColor: AppColors.primary,
            iconSize: Dimens.twenty,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.eight),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: Dimens.thirtyTwo * minLines,
                maxHeight: Dimens.thirtyTwo * maxLines,
              ),
              child: QuillHtmlEditor(
                controller: controller,
                minHeight: Dimens.thirtyTwo * minLines,
                backgroundColor: AppColors.grey,
                ensureVisible: true,
                padding: Dimens.edgeInsets8_4,
                textStyle: Styles.bodyMedium,
                hintText: hint,
                hintTextAlign: TextAlign.left,
                hintTextStyle: Styles.bodyMedium,
              ),
            ),
          ),
        ],
      );
}

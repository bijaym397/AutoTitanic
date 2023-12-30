import 'package:auto_titanic/res/res.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({
    super.key,
    this.showStates = false,
    this.currentCountry,
    this.currentState,
    this.onCountryChanged,
    this.onStateChanged,
    this.space,
    this.isRequired = false,
    this.showLabel = false,
  });

  final bool showStates;
  final String? currentCountry;
  final String? currentState;
  final void Function(String)? onCountryChanged;
  final void Function(String?)? onStateChanged;
  final double? space;
  final bool showLabel;
  final bool isRequired;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showLabel)
            Padding(
              padding: Dimens.edgeInsets4,
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    if (isRequired)
                      TextSpan(
                        text: '*',
                        style: Styles.titleLarge.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    TextSpan(
                      text: 'Country',
                      style: Styles.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          CSCPicker(
            showStates: showStates,
            showCities: false,
            dropdownDecoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(Dimens.eight),
            ),
            disabledDropdownDecoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Dimens.eight),
            ),
            space: space,
            dropdownHeadingStyle: Styles.bodyLarge,
            dropdownItemStyle: Styles.bodyLarge,
            selectedItemStyle: Styles.bodyLarge,
            countryFilter: AppConstants.allowedCountries,
            currentCountry: currentCountry,
            currentState: currentState,
            onCountryChanged: onCountryChanged ?? (_) {},
            onStateChanged: onStateChanged ?? (_) {},
            onCityChanged: (_) {},
          ),
        ],
      );
}

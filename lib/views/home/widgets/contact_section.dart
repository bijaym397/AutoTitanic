import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets0_40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(child: $ContactForm()),
            Dimens.boxWidth32,
            const $TimingCard(),
          ],
        ),
      );
}

class $ContactForm extends StatelessWidget {
  const $ContactForm({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                child: InputField(
                  hint: AppStrings.name,
                  isRequired: true,
                ),
              ),
              Dimens.boxWidth16,
              const Flexible(
                child: InputField(
                  hint: AppStrings.email,
                  isRequired: true,
                ),
              ),
              Dimens.boxWidth16,
              const Flexible(
                child: InputField(
                  hint: AppStrings.phone,
                  isRequired: true,
                ),
              ),
            ],
          ),
          Dimens.boxHeight16,
          const InputField(
            hint: AppStrings.comment,
            isRequired: true,
            maxLines: 4,
            minLines: 4,
          ),
          Dimens.boxHeight16,
          Flexible(
            child: Button(
              label: AppStrings.send,
              onTap: () {},
            ),
          ),
        ],
      );
}

class $TimingCard extends StatelessWidget {
  const $TimingCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.grey,
        padding: Dimens.edgeInsets20,
        width: 0.2.pw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText('OPENING HOURS'),
            Container(
              margin: Dimens.edgeInsets0_8,
              height: 2,
              width: Dimens.twenty,
              color: AppColors.red,
            ),
            Dimens.boxHeight16,
            const $TimingTile('MONDAY'),
            const $TimingTile('TUESDAY'),
            const $TimingTile('WEDNESDAY'),
            const $TimingTile('THURSDAY'),
            const $TimingTile('FRIDAY'),
            const $TimingTile('SATURDAY'),
            const $TimingTile('SUNDAY', isClosed: true),
          ],
        ),
      );
}

class $TimingTile extends StatelessWidget {
  const $TimingTile(
    this.day, {
    super.key,
    this.isClosed = false,
  });

  final String day;
  final bool isClosed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: Dimens.edgeInsets16_4,
        child: Row(
          children: [
            Expanded(
              child: AppText(
                day,
                style: Styles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: AppText(isClosed ? 'Closed' : '9:00 AM to 9:00 PM'),
            ),
          ],
        ),
      );
}

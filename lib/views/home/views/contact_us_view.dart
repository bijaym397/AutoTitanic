import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  static const String route = AppRoutes.contactUs;

  @override
  Widget build(BuildContext context) => ScreenWrapper(
        showAppBarImage: true,
        bodyBuilder: (_, isHovering) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dimens.boxHeight200,
            Text(
              'We\'d Love to Hear From You',
              style: context.textTheme.bodyMedium,
            ),
            Dimens.boxHeight16,
            Text(
              'LET\'S GET IN TOUCH!',
              style: context.textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Dimens.boxHeight24,
            AnimatedLines(
              isHovering: isHovering,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            Dimens.boxHeight32,
            const $ContactRow(),
            Dimens.boxHeight32,
            const ContactSection(),
            Dimens.boxHeight48,
            const $InformationRow(),
            Dimens.boxHeight32,
          ],
        ),
      );
}

class $ContactRow extends StatelessWidget {
  const $ContactRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (controller) => Row(
          children: controller.contactList
              .map<Widget>(
                (contact) => Expanded(
                  child: ObxValue<RxBool>(
                    (isHovering) => TapHandler(
                      showArrowCursor: true,
                      onHover: (value) {
                        isHovering.value = value;
                      },
                      child: AspectRatio(
                        aspectRatio: 8 / 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(Dimens.twelve),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                contact.icon,
                                color: isHovering.value ? AppColors.red : null,
                                size: Dimens.forty,
                              ),
                              Dimens.boxHeight8,
                              Text(
                                contact.label,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      isHovering.value ? AppColors.red : null,
                                ),
                              ),
                              Dimens.boxHeight12,
                              Text(contact.data),
                            ],
                          ),
                        ),
                      ),
                    ),
                    false.obs,
                  ),
                ),
              )
              .separate(context, (_, __) => Dimens.boxWidth20)
              .toList(),
        ),
      );
}

class $InformationRow extends StatelessWidget {
  const $InformationRow({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (controller) => Row(
          children: controller.informationList
              .map<Widget>(
                (contact) => Expanded(
                  child: ObxValue<RxBool>(
                    (isHovering) => TapHandler(
                      showArrowCursor: true,
                      onHover: (value) {
                        isHovering.value = value;
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isHovering.value
                                    ? AppColors.red
                                    : AppColors.grey,
                                width: 1,
                              ),
                            ),
                            child: Container(
                              padding: Dimens.edgeInsets12,
                              margin: Dimens.edgeInsets8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isHovering.value
                                    ? AppColors.red
                                    : AppColors.grey,
                              ),
                              child: Icon(
                                contact.icon,
                                color: isHovering.value
                                    ? AppColors.white
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          Dimens.boxWidth12,
                          Flexible(
                            child: Padding(
                              padding: Dimens.edgeInsets0_8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contact.label,
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Dimens.boxHeight12,
                                  Text(contact.data),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    false.obs,
                  ),
                ),
              )
              .separate(context, (_, __) => Dimens.boxWidth20)
              .toList(),
        ),
      );
}

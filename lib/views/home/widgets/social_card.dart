import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialCard extends StatelessWidget {
  const SocialCard(
    this.social, {
    super.key,
  });

  final Social social;

  @override
  Widget build(BuildContext context) => GetX<HomeController>(
        builder: (controller) {
          var isSelected = controller.selectedSocial == social;
          return Expanded(
            child: TapHandler(
              onHover: (isHovering) {
                if (isHovering) {
                  controller.selectedSocial = social;
                } else {
                  controller.selectedSocial = null;
                }
              },
              child: AnimatedContainer(
                key: ValueKey('Social-${social.name}'),
                duration: AppConstants.animationDuration,
                color: isSelected ? social.color : null,
                padding: Dimens.edgeInsets12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      social.label,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: isSelected ? AppColors.white : AppColors.black,
                      ),
                    ),
                    SvgImage(
                      social.icon,
                      dimensions: Dimens.forty,
                      color: isSelected ? AppColors.white : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

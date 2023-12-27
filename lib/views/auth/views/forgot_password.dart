import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  static const String route = AppRoutes.forgotPassword;

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        initState: (_) {
          Get.find<AuthController>().emailTEC.clear();
        },
        builder: (controller) => ScreenWrapper(
          body: Container(
            margin: Dimens.edgeInsets0_20,
            height: 0.7.ph,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(Dimens.sixteen),
            ),
            clipBehavior: Clip.antiAlias,
            child: Row(
              children: [
                const Expanded(
                  child: AppImage(
                    imageUrl: AssetConstants.forgotPasswordBG,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: Dimens.edgeInsets24_32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          'Reset Password',
                          style: Styles.headlineMedium,
                        ),
                        Dimens.boxHeight10,
                        const Divider(),
                        AppText(
                          AppStrings.lostPassword,
                          style: Styles.bodyMedium.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Dimens.boxHeight10,
                        InputField(
                          label: 'Username / Email',
                          isRequired: true,
                          controller: controller.emailTEC,
                          showLabel: true,
                        ),
                        Dimens.boxHeight32,
                        Button(
                          label: 'Send Reset Password Link',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

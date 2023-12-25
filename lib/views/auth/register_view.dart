import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/views/views.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const String route = AppRoutes.register;

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        initState: (_) {
          Get.find<AuthController>()
            ..emailTEC.clear()
            ..nameTEC.clear()
            ..phoneTEC.clear()
            ..passwordTEC.clear();
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
                    imageUrl: AssetConstants.signupBG,
                  ),
                ),
                Dimens.boxWidth16,
                Expanded(
                  child: SingleChildScrollView(
                    padding: Dimens.edgeInsets24_32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'Register',
                          style: Styles.headlineMedium,
                        ),
                        const Divider(),
                        Dimens.boxHeight10,
                        Row(
                          children: [
                            const AddImage(),
                            Dimens.boxWidth16,
                            Flexible(
                              child: InputField(
                                label: 'Full name',
                                isRequired: true,
                                controller: controller.nameTEC,
                                showLabel: true,
                              ),
                            ),
                          ],
                        ),
                        Dimens.boxHeight10,
                        Row(
                          children: [
                            Flexible(
                              child: InputField(
                                label: 'Email Address',
                                isRequired: true,
                                controller: controller.emailTEC,
                                showLabel: true,
                              ),
                            ),
                            Dimens.boxWidth16,
                            Flexible(
                              child: DropDown(
                                items: SellerType.values,
                                hint: 'User Type',
                                isRequired: true,
                                showTitle: true,
                                labelBuilder: (type) => type.label,
                                onChanged: (_) {},
                              ),
                            ),
                          ],
                        ),
                        Dimens.boxHeight10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Flexible(
                              child: CountryPicker(
                                showLabel: true,
                                isRequired: true,
                              ),
                            ),
                            Dimens.boxWidth16,
                            Flexible(
                              child: InputField(
                                label: 'Phone',
                                isRequired: true,
                                controller: controller.phoneTEC,
                                showLabel: true,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: InputField(
                                label: 'Password',
                                isRequired: true,
                                controller: controller.passwordTEC,
                                showLabel: true,
                              ),
                            ),
                            Dimens.boxWidth16,
                            Flexible(
                              child: InputField(
                                label: 'Confirm Password',
                                isRequired: true,
                                controller: controller.confirmPasswordTEC,
                                showLabel: true,
                              ),
                            ),
                          ],
                        ),
                        Dimens.boxHeight16,
                        RichText(
                          text: TextSpan(
                            text: AppStrings.policyStatement,
                            style: Styles.bodyMedium.copyWith(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: AppStrings.privacyPolicy.toLowerCase(),
                                style: Styles.bodyMedium.copyWith(
                                  color: AppColors.red,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(PrivacyView.route);
                                  },
                              ),
                            ],
                          ),
                        ),
                        Dimens.boxHeight32,
                        Button(
                          label: 'Register',
                          onTap: () {},
                        ),
                        Dimens.boxHeight20,
                        const LinkText(
                          'Existing User? Login',
                          onTap: RouteManagement.goToLogin,
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

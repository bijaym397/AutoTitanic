import 'package:auto_titanic/controllers/controllers.dart';
import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String route = AppRoutes.login;

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        initState: (_) {
          Get.find<AuthController>()
            ..emailTEC.clear()
            ..passwordTEC.clear()
            ..rememberMe = false;
        },
        builder: (controller) => ScreenWrapper(
          title: 'Login',
          body: LayoutBuilder(builder: (_, __) {
            if (context.isMobileView) {
              return Container(
                margin: Dimens.edgeInsets0_20,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(Dimens.sixteen),
                ),
                clipBehavior: Clip.antiAlias,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AspectRatio(
                        aspectRatio: 16 / 9,
                        child: AppImage(
                          imageUrl: AssetConstants.loginBG,
                        ),
                      ),
                      Padding(
                        padding: Dimens.edgeInsets24_32,
                        child: const _LoginForm(),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container(
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
                      imageUrl: AssetConstants.loginBG,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: Dimens.edgeInsets24_32,
                      child: const _LoginForm(),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Login',
              style: Styles.headlineMedium,
            ),
            const Divider(),
            InputField(
              label: 'Username / Email',
              isRequired: true,
              controller: controller.emailTEC,
              showLabel: true,
            ),
            Dimens.boxHeight10,
            InputField(
              label: 'Password',
              isRequired: true,
              controller: controller.passwordTEC,
              showLabel: true,
            ),
            Dimens.boxHeight10,
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Obx(
                    () => AppCheckBoxListTile(
                      value: controller.rememberMe,
                      onChanged: (value) {
                        controller.rememberMe = value!;
                      },
                      title: 'Remember Me?',
                    ),
                  ),
                ),
                const Spacer(),
                const LinkText(
                  'Forgot Password?',
                  onTap: RouteManagement.goToForgotPassword,
                )
              ],
            ),
            Dimens.boxHeight20,
            Button(
              label: 'Login',
              onTap: () {},
            ),
            Dimens.boxHeight20,
            const LinkText(
              'New to Autotitanic? Create an Account',
              onTap: RouteManagement.goToRegister,
            ),
          ],
        ),
      );
}

import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenDialog extends StatefulWidget {
  const FullScreenDialog({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<FullScreenDialog> createState() => _FullScreenDialogState();
}

class _FullScreenDialogState extends State<FullScreenDialog> {
  bool isFullScreen = false;

  void _toggleFullScreen() {
    if (isFullScreen) {
      PlatformHandler().exitFullScreen();
    } else {
      PlatformHandler().enterFullScreen();
    }
    isFullScreen = !isFullScreen;
  }

  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.black,
            ),
            child: Padding(
              padding: Dimens.edgeInsets20,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    widget.images.first,
                    height: 0.8.ph,
                    width: 0.8.pw,
                    fit: BoxFit.contain,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            '1 / ${widget.images.length}',
                            style: Styles.labelLarge.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: _toggleFullScreen,
                            icon: AppIcon(
                              isFullScreen ? Icons.fullscreen_exit_rounded : Icons.fullscreen_rounded,
                            ),
                          ),
                          IconButton(
                            onPressed: Get.back,
                            icon: const AppIcon(
                              Icons.close_rounded,
                            ),
                          ),
                        ],
                      ),
                      if (widget.images.length > 1)
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const AppIcon(
                                Icons.arrow_back_rounded,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const AppIcon(
                                Icons.arrow_forward_rounded,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

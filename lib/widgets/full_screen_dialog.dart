import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({
    super.key,
    required this.images,
  });

  final List<String> images;

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
                    images.first,
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
                            '1 / ${images.length}',
                            style: context.textTheme.labelLarge!.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.fullscreen_rounded,
                            ),
                          ),
                          IconButton(
                            onPressed: Get.back,
                            icon: const Icon(
                              Icons.close_rounded,
                            ),
                          ),
                        ],
                      ),
                      if (images.length > 1)
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
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

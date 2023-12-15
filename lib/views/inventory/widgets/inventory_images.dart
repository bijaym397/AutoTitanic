import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:auto_titanic/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InventoryImages extends StatelessWidget {
  const InventoryImages(this.images, {super.key});

  final List<String> images;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          var isRowLayout = true;
          // var isRowLayout = constraints.maxWidth > AppConstants.maxDesktopWidth;
          var children = [
            Expanded(
              flex: isRowLayout ? 3 : 2,
              child: AppImage(
                imageUrl: images.first,
                isNetworkImage: false,
              ),
            ),
            ColoredBox(
              color: AppColors.white,
              child: SizedBox(
                height: double.maxFinite,
                width: Dimens.two,
              ),
            ),
            _MoreImages(
              images,
              isRowLayout: isRowLayout,
            ),
          ];
          if (isRowLayout) {
            return Row(children: children);
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            );
          }
        },
      );
}

class _MoreImages extends StatelessWidget {
  const _MoreImages(
    this.images, {
    required this.isRowLayout,
  });

  final List<String> images;
  final bool isRowLayout;

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      Expanded(
        child: images.length > 1 ? AppImage(imageUrl: images[1], isNetworkImage: false) : const SizedBox.shrink(),
      ),
      Expanded(
        child: images.length > 2 ? AppImage(imageUrl: images[2], isNetworkImage: false) : const SizedBox.shrink(),
      ),
      Expanded(
        child: images.length > 3
            ? Stack(
                children: [
                  AppImage(imageUrl: images[3], isNetworkImage: false),
                  if (images.length > 4)
                    ColoredBox(
                      color: Colors.black38,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '+${images.length - 4}',
                          style: Styles.titleLarge.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
                ],
              )
            : const SizedBox.shrink(),
      ),
    ]
        .separate(
          context,
          (_, __) => ColoredBox(
            color: AppColors.white,
            child: SizedBox(
              height: isRowLayout ? Dimens.two : double.maxFinite,
              width: isRowLayout ? double.maxFinite : Dimens.two,
            ),
          ),
        )
        .toList();
    return Expanded(
      flex: 1,
      child: isRowLayout
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
    );
  }
}

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
          var isRowLayout = context.isDesktopView || context.isMobileView;
          var children = [
            Expanded(
              flex: 3,
              child: AppImage(
                imageUrl: images.first,
                isNetworkImage: images.first.isNetworkImage,
              ),
            ),
            ColoredBox(
              color: AppColors.white,
              child: SizedBox(
                height: isRowLayout ? double.maxFinite : Dimens.two,
                width: isRowLayout ? Dimens.two : double.maxFinite,
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
            return Column(children: children);
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
        child: images.length > 1
            ? AppImage(
                imageUrl: images[1],
                isNetworkImage: images[1].isNetworkImage,
              )
            : const SizedBox.shrink(),
      ),
      Expanded(
        child: images.length > 2
            ? AppImage(
                imageUrl: images[2],
                isNetworkImage: images[2].isNetworkImage,
              )
            : const SizedBox.shrink(),
      ),
      Expanded(
        child: images.length > 3
            ? Stack(
                children: [
                  AppImage(
                    imageUrl: images[3],
                    isNetworkImage: images[3].isNetworkImage,
                  ),
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
    ];
    return Expanded(
      flex: 1,
      child: isRowLayout ? Column(children: children) : Row(children: children),
    );
  }
}

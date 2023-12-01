import 'dart:typed_data';

import 'package:auto_titanic/res/res.dart';
import 'package:auto_titanic/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.imageUrl, {
    this.name,
    this.dimensions,
    this.isNetworkImage = true,
    this.isBytes = false,
    super.key,
    this.radius,
  })  : _name = name ?? 'C',
        _isProfileImage = false;

  const AppImage.profile(this.imageUrl, {this.name, this.dimensions = 48, this.isNetworkImage = true, this.isBytes = false, super.key, this.radius})
      : _name = name ?? 'U',
        _isProfileImage = true,
        assert(dimensions != null, 'Dimensions cannot be null');

  final String imageUrl;
  final String? name;
  final double? dimensions;
  final bool isNetworkImage;
  final double? radius;
  final bool isBytes;
  final String _name;
  final bool _isProfileImage;

  @override
  Widget build(BuildContext context) => isNetworkImage
      ? _NetworkImage(imageUrl: imageUrl, isProfileImage: _isProfileImage, name: _name)
      : isBytes
          ? _MemeroyImage(
              imageUrl: imageUrl,
              name: _name,
            )
          : _AssetImage(
              imageUrl: imageUrl,
              name: _name,
            );
}

class _AssetImage extends StatelessWidget {
  const _AssetImage({required this.imageUrl, required this.name});
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    try {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        height: double.maxFinite,
        width: double.maxFinite,
      );
    } catch (e) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
        ),
        child: Text(
          name[0],
          style: context.textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      );
    }
  }
}

class _MemeroyImage extends StatelessWidget {
  const _MemeroyImage({required this.imageUrl, required this.name});
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    Uint8List? bytes;
    if (imageUrl.isNotEmpty) {
      bytes = imageUrl.strigToUnit8List;
    }
    return bytes == null || bytes.isEmpty
        ? Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Text(
              name[0],
              style: context.textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          )
        : Image.memory(
            bytes,
            fit: BoxFit.cover,
          );
  }
}

class _NetworkImage extends StatelessWidget {
  const _NetworkImage({
    required this.imageUrl,
    required bool isProfileImage,
    required String name,
  })  : _isProfileImage = isProfileImage,
        _name = name;

  final String imageUrl;
  final bool _isProfileImage;
  final String _name;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        cacheKey: imageUrl,
        imageBuilder: (_, image) {
          try {
            if (imageUrl.isEmpty) {
              return _ErrorImage(isProfileImage: _isProfileImage, name: _name);
            }
            return Container(
              decoration: BoxDecoration(
                shape: _isProfileImage ? BoxShape.circle : BoxShape.rectangle,
                color: AppColors.grey,
                image: DecorationImage(image: image, fit: BoxFit.cover),
              ),
            );
          } catch (e, st) {
            AppLog.error(e, st);
            return _ErrorImage(isProfileImage: _isProfileImage, name: _name);
          }
        },
        placeholder: (context, url) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.2),
            shape: _isProfileImage ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: _isProfileImage
              ? Text(
                  _name[0],
                  style: context.textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
        ),
        errorWidget: (context, url, error) => _ErrorImage(isProfileImage: _isProfileImage, name: _name),
      );
}

class _ErrorImage extends StatelessWidget {
  const _ErrorImage({
    required bool isProfileImage,
    required String name,
  })  : _isProfileImage = isProfileImage,
        _name = name;

  final bool _isProfileImage;
  final String _name;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.2),
          shape: _isProfileImage ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: _isProfileImage
            ? Text(
                _name[0],
                style: context.textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(Dimens.eight),
                ),
                alignment: Alignment.center,
                child: const Text(
                  AppStrings.errorLoadingImage,
                ),
              ),
      );
}

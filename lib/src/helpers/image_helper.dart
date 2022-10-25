import 'package:flutter/material.dart';

class ImageHelper {
  Widget loadFormAsset(
    String imagePath, {
    double? width,
    double? height,
    BorderRadius? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.zero,
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit ?? BoxFit.none,
        color: tintColor,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}

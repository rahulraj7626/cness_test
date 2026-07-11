import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Genric icon widget as of now handle
///SVG , PNG, JPG Icons
class AppIcon extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;
  final BoxFit fit;

  const AppIcon({
    super.key,
    required this.asset,
    this.size,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    ///For svg format
    if (asset.endsWith('.svg')) {
      return SvgPicture.asset(
        asset,
        width: size,
        height: size,
        fit: fit,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    }

    ///For other extentions like png, jpg
    return Image.asset(
      asset,
      width: size,
      height: size,
      fit: fit,
      color: color,
    );
  }
}

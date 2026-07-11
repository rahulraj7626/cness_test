import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Rounded Icon widget with ontap
class RoundIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const RoundIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.only(left: AppSpacing.s12),
        padding: EdgeInsets.all(AppSpacing.s10),
        alignment: AlignmentGeometry.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: AppIcon(asset: icon),
      ),
    );
  }
}

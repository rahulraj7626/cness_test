import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

///Primary button widget handled
///Loading , label and action

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isLoading;
  const ButtonWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: AppColors.gradientButton,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: double.infinity,
          height: AppSpacing.s48,
          child: Center(
            child: isLoading
                ? const SizedBox(width: 24, height: 24, child: LoadingWidget())
                : Text(
                    label,
                    style: const TextStyle(
                      fontSize: AppSpacing.s16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

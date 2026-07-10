import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:flutter/material.dart';

///Custom tab widget just switching Login and signup
///Handled with ValueNotifier

class TabWidget extends StatelessWidget {
  final ValueNotifier<bool> isLoginNotifier;
  final bool isLogin;
  const TabWidget({
    super.key,
    required this.isLogin,
    required this.isLoginNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.s48,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(AppSpacing.s4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => isLoginNotifier.value = true,
              child: Container(
                decoration: BoxDecoration(
                  color: isLogin ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSpacing.s8),
                ),

                alignment: Alignment.center,
                child: Text(
                  AppString.login,
                  style: TextStyle(
                    fontSize: AppSpacing.s14,
                    fontWeight: FontWeight.w500,
                    color: isLogin
                        ? AppColors.blackPrimary
                        : AppColors.blackSecondary,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => isLoginNotifier.value = false,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: !isLogin ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSpacing.s8),
                ),
                child: Text(
                  AppString.signUp,
                  style: TextStyle(
                    fontSize: AppSpacing.s14,
                    color: !isLogin
                        ? AppColors.blackPrimary
                        : AppColors.blackSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

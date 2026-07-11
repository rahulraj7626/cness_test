import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/routes/app_router.dart';
import 'package:cness_test/core/utils/preferance_utils.dart';
import 'package:cness_test/features/auth/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isLogined = SharedUtils.getLogin;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: title == 'Profile'
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s32,
                  ),
                  child: ButtonWidget(
                    label: isLogined ? 'Logout' : 'Login',
                    onTap: () {
                      if (isLogined) {
                        SharedUtils.onLogout();
                      }
                      context.router.replaceAll([AuthScreenRoute()]);
                    },
                    isLoading: false,
                  ),
                )
              : Text(title),
        ),
      ),
    );
  }
}

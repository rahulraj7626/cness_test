import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cness_test/features/auth/presentation/pages/login_tab.dart';
import 'package:cness_test/features/auth/presentation/widgets/tab_widget.dart';
import 'package:cness_test/features/auth/presentation/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Define autoroute
@RoutePage()
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  ///Initialise ValueNotifier for tabswitch
  ///Used for to prevent all page rebuild
  final ValueNotifier<bool> tabNotifier = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            TopAppbar(),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: const BoxDecoration(gradient: AppColors.bgGradient),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.all(AppSpacing.s24),

                  ///Listen the tab changes
                  child: ValueListenableBuilder<bool>(
                    valueListenable: tabNotifier,
                    builder: (context, isLogin, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TabWidget(
                            isLogin: isLogin,
                            isLoginNotifier: tabNotifier,
                          ),

                          ///As of now login page implimented Later change when SignUp is available
                          isLogin ? LoginTabScreen() : LoginTabScreen(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

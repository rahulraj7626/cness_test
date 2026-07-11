import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/routes/app_router.dart';
import 'package:cness_test/core/shared/widgets/app_toaster.dart';
import 'package:cness_test/features/auth/domain/entities/login_entity.dart';
import 'package:cness_test/features/auth/domain/enums/auth_enums.dart';
import 'package:cness_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cness_test/features/auth/presentation/widgets/button_widget.dart';
import 'package:cness_test/features/auth/presentation/widgets/icon_button.dart';
import 'package:cness_test/features/auth/presentation/widgets/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Implements the login screen with reusable UI components.
/// Handles form validation and BLoC-based authentication flow.

class LoginTabScreen extends StatefulWidget {
  const LoginTabScreen({super.key});

  @override
  State<LoginTabScreen> createState() => _LoginTabScreenState();
}

class _LoginTabScreenState extends State<LoginTabScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// Mandatory Disposal of all Controllers
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///Login event
  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        OnLoginEvent(
          cred: LoginEntity(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        ),
      );
    }
  }

  ///Handle login be successfull
  ///Toast, clear controller values
  ///Navigation

  void _onLoginSuccess() {
    AppToaster.success(AppString.loginSuccess);
    emailController.clear();
    passwordController.clear();
    context.router.replaceAll([const HomeRootRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          AppToaster.error(state.msg);
        }
        if (state is AuthSuccessState) {
          _onLoginSuccess();
        }
        if (state is OnSocialLoginState) {
          AppToaster.info(state.msg);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpacing.s16,
            children: [
              AppSpacing.s12.height,

              ///Defualt email mentioned hint
              TextformWidget(
                controller: emailController,
                label: AppString.email,
                hint: "user@email.com",
                type: InputType.email,
              ),

              ///Defualt password mentioned hint
              TextformWidget(
                controller: passwordController,
                label: AppString.password,
                hint: "User@123",
                type: InputType.password,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CheckBoxWidget(),
                      const SizedBox(width: 8),
                      Text(
                        AppString.rememberMe,
                        style: TextStyle(
                          fontSize: AppSpacing.s14,
                          color: AppColors.blackSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppString.forgotPassword,
                      style: TextStyle(
                        fontSize: AppSpacing.s14,
                        color: AppColors.bluePrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              // Log In Button
              ButtonWidget(
                label: AppString.login,
                onTap: _onLogin,
                isLoading: state is AuthLoading,
              ),
              // Explore without login
              Center(
                child: TextButton(
                  onPressed: () =>
                      context.router.replaceAll([const HomeRootRoute()]),
                  child: const Text(
                    AppString.exploreWithoutLogin,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.bluePrimary,
                      fontSize: AppSpacing.s14,
                      color: AppColors.bluePrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade200)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Or', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade200)),
                ],
              ),

              IconButtonWidget(
                isLoading:
                    state is OnSocialLoadingState &&
                    state.type == LoginMethods.google,
                text: AppString.continueWithGoogle,
                onTap: () => context.read<AuthBloc>().add(
                  OnSocialLoginEvent(type: LoginMethods.google),
                ),

                icon: Assets.icons.google.path,
              ),
              IconButtonWidget(
                isLoading:
                    state is OnSocialLoadingState &&
                    state.type == LoginMethods.facebook,
                text: AppString.continueWithFacebook,
                onTap: () => context.read<AuthBloc>().add(
                  OnSocialLoginEvent(type: LoginMethods.facebook),
                ),

                icon: Assets.icons.fb.path,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpacing.s24,
      width: AppSpacing.s24,
      child: Checkbox(
        activeColor: AppColors.bluePrimary,
        value: _isSelected,
        onChanged: (value) {
          setState(() {
            _isSelected = value ?? false;
          });
        },
        side: BorderSide(color: AppColors.blackPrimary, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

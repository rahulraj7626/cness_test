import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/constants/style_constants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/utils/validators.dart';
import 'package:flutter/material.dart';

///Re usable Text input widget combination of label and textinput field with allows
///auto validation
///Mandatory indication
///Password behavious
///Keyboard input type and more

class TextformWidget extends StatefulWidget {
  final String hint;
  final String label;
  final bool isRequired;
  final InputType type;
  final TextEditingController controller;
  const TextformWidget({
    super.key,
    required this.hint,
    required this.label,
    this.isRequired = true,
    required this.type,
    required this.controller,
  });

  @override
  State<TextformWidget> createState() => _TextformWidgetState();
}

class _TextformWidgetState extends State<TextformWidget> {
  void _viewPass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.greyBorder, width: 1),
    );
    var errorOutlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.red, width: 1),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '${widget.label} ',
            style: AppTextStyles.bodyXSmall,
            children: [
              if (widget.isRequired)
                const TextSpan(text: '*', style: AppTextStyles.errorText),
            ],
          ),
        ),
        AppSpacing.s8.height,
        TextFormField(
          controller: widget.controller,
          obscureText: widget.type == InputType.password && _obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: widget.type == InputType.email
              ? TextInputType.emailAddress
              : null,
          decoration: InputDecoration(
            errorMaxLines: 3,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSpacing.s12,
              horizontal: AppSpacing.s8,
            ),
            suffixIcon: Visibility(
              visible: widget.type == InputType.password,
              child: GestureDetector(
                onTap: _viewPass,
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,

                  color: AppColors.blackTertiary,
                  size: AppSpacing.s20,
                ),
              ),
            ),
            hintText: widget.hint,
            errorStyle: AppTextStyles.errorText,
            hintStyle: AppTextStyles.hintText,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            disabledBorder: outlineInputBorder,
            errorBorder: errorOutlineInputBorder,
            focusedErrorBorder: errorOutlineInputBorder,
          ),
          validator: (value) {
            String? error;
            if (widget.type == InputType.email &&
                ValidationHelpers.isEmailFn(value ?? '') == false) {
              error = AppString.invalidEmail;
            }
            if (widget.type == InputType.password &&
                ValidationHelpers.isPasswordFn(value ?? '') == false) {
              error = AppString.invalidPassword;
            }

            return error;
          },
        ),
      ],
    );
  }
}

///As of now email and password considered for later can add more type
///eg: number , phone numbers etc
enum InputType { email, password }

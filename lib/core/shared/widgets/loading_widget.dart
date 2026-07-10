import 'package:cness_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

///Genric loading indecator
///Color property with defualt white
///Adaptive works native behavior
class LoadingWidget extends StatelessWidget {
  final Color color;

  const LoadingWidget({super.key, this.color = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}

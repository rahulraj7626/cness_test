import 'package:cness_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(height: 200, color: AppColors.blackPrimary);
  }
}

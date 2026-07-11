import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:flutter/material.dart';

///For home floating action button click
class FloatingMenuButton extends StatelessWidget {
  final Widget child;

  const FloatingMenuButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      color: Colors.white,
      elevation: 8,
      onSelected: (value) {},
      itemBuilder: (context) => [
        _MenuItem(icon: Icons.file_copy_rounded, title: AppString.copyPostLink),
        _MenuItem(icon: Icons.bookmark_rounded, title: AppString.saveThisPost),
        _MenuItem(
          icon: Icons.reply_rounded,
          title: AppString.share,
          flipIcon: true,
        ),
        _MenuItem(icon: Icons.warning_rounded, title: AppString.report),
        _MenuItem(
          icon: Icons.visibility_off_rounded,
          title: AppString.notInterested,
        ),
      ],
      child: child,
    );
  }
}

///For fee more  button click
class MoreMenuButton extends StatelessWidget {
  final Widget child;

  const MoreMenuButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.s24),
      ),
      color: AppColors.white,
      elevation: 8,
      onSelected: (value) {},
      itemBuilder: (context) => [
        _MenuItem(icon: Icons.camera_alt_rounded, title: AppString.addPost),
        _MenuItem(icon: Icons.add_box_rounded, title: AppString.addThoughts),
        _MenuItem(
          icon: Icons.generating_tokens_rounded,
          title: AppString.addBestPractise,
        ),
        _MenuItem(
          icon: Icons.reply_rounded,
          title: AppString.shareLegacyProfile,
          flipIcon: true,
        ),
      ],
      child: child,
    );
  }
}

///The menu item widget
class _MenuItem extends PopupMenuItem<String> {
  _MenuItem({
    required IconData icon,
    required String title,
    bool flipIcon = false,
  }) : super(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: AppSpacing.s8),
           child: Row(
             children: [
               flipIcon
                   ? Transform.flip(
                       flipX: true,
                       child: Icon(
                         icon,
                         color: AppColors.blueSecondary,
                         size: AppSpacing.s24,
                       ),
                     )
                   : Icon(
                       icon,
                       color: AppColors.blueSecondary,
                       size: AppSpacing.s24,
                     ),
               AppSpacing.s8.width,
               Text(
                 title,
                 style: const TextStyle(
                   color: AppColors.blackText,
                   fontSize: AppSpacing.s14,
                   fontWeight: FontWeight.w400,
                 ),
               ),
             ],
           ),
         ),
       );
}

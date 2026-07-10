import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/di/injection_container.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:cness_test/features/profile/presentation/widgets/appbar_widget.dart';
import 'package:cness_test/features/profile/presentation/widgets/basic_info.dart';
import 'package:cness_test/features/profile/presentation/widgets/contact_widget.dart';
import 'package:cness_test/features/profile/presentation/widgets/experiance_widget.dart';
import 'package:cness_test/features/profile/presentation/widgets/social_row.dart';
import 'package:cness_test/features/profile/presentation/widgets/top_positioed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(OnProfileLoadEvent()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Image.asset(Assets.images.profileBg.path, fit: BoxFit.cover),
            SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    ///Set background
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.s16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TopPositioedWidget(),

                            Text(
                              "“Building spaces for people to learn and connect.  Powered by design and technology.”",
                              style: TextStyle(
                                fontSize: AppSpacing.s12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppSpacing.s16.height,
                                SocialRow(),
                                titleWidget(label: AppString.basicInfo),
                                BasicInfo(),
                                titleWidget(label: AppString.contact),
                                ContactWidget(),
                                titleWidget(label: AppString.experience),
                                ExperianceWidget(),
                                titleWidget(label: AppString.education),
                                ExperianceWidget(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(child: AppbarWidget()),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleWidget({required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.s12.height,
        Text(
          label,
          style: TextStyle(
            fontSize: AppSpacing.s16,
            fontWeight: FontWeight.w700,
            color: AppColors.blackPrimary,
          ),
        ),
        Divider(color: AppColors.greyBorder),
        AppSpacing.s2.height,
      ],
    );
  }
}
// return BlocProvider(
//       create: (context) => sl<ProfileBloc>()..add(OnProfileLoadEvent()),
//       child: Scaffold(
//         body: BlocBuilder<ProfileBloc, ProfileState>(
//           builder: (context, state) {
//             if (state is ProfileLoadedState) {
//               return Column(children: [Text(state.user.profile.name)]);
//             }
//             if (state is ProfileErrorState) {
//               return Center(child: Text(state.message));
//             }
//             return Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
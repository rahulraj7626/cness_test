import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/di/injection_container.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/features/profile/presentation/bloc/profile_bloc.dart';
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
            ///Set background
            Image.asset(Assets.images.profileBg.path, fit: BoxFit.cover),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 200, width: 200, color: AppColors.blueDark),
                  Container(
                    height: 200,
                    width: 200,
                    color: AppColors.bluePrimary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
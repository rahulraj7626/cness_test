import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/di/injection_container.dart';
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
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              return Column(children: [Text(state.user.profile.name)]);
            }
            if (state is ProfileErrorState) {
              return Center(child: Text(state.message));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

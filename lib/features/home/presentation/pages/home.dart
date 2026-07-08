import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/di/injection_container.dart';
import 'package:cness_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(OnLoadHomeDataEvent()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return Column(children: [Text(state.stories.length.toString())]);
            }
            if (state is HomeErrorState) {
              return Center(child: Text(state.message));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

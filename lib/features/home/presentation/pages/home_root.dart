import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/di/injection_container.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:cness_test/features/home/presentation/pages/dummy_page.dart';
import 'package:cness_test/features/home/presentation/pages/home_body.dart';
import 'package:cness_test/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:cness_test/features/home/presentation/widgets/menus/floating_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Home root widget includes bottom navigation bar
@RoutePage()
class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  int _selectedIndex = 0;

  ///Bottom navigation bar items
  List<Widget> widgets = [
    HomeBody(),
    DummyPage(title: Assets.icons.bottom2.path),
    DummyPage(title: Assets.icons.bottom3.path),
    DummyPage(title: Assets.icons.bottom3.path),
    DummyPage(title: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(OnLoadHomeDataEvent()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.greySecondary,
        body: widgets[_selectedIndex],
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingMenuButton(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.blueSecondary,
                  child: const Icon(
                    Icons.add_to_photos,
                    color: AppColors.white,
                    size: 26,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

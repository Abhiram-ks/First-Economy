import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:firsteconomy/features/presentation/screens/home_screen.dart';
import 'package:firsteconomy/features/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
const double bottomNavBarHeight = 77.0;

class BottomNavigationControllers extends StatelessWidget {
  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  const BottomNavigationControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: Theme.of(context).copyWith(
        splashColor: AppPalette.whiteColor.withAlpha((0.3 * 225).round()),
        highlightColor: AppPalette.buttonColor.withAlpha((0.2 * 255).round()),
      ),
      child: Scaffold(
        body: BlocBuilder<NavigationCubit, NavItems>(
          builder: (context, state) {
            switch (state) {
              case NavItems.home:
                return _screens[0];
              case NavItems.explore:
                return _screens[1];
              case NavItems.card:
                return _screens[2];
              case NavItems.rewards:
                return _screens[3];
              case NavItems.profile:
                return _screens[4];
            }
          },
        ),
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavItems>(
          builder: (context, state) {
            final currentIndex =
                state == NavItems.profile
                    ? 0
                    : NavItems.values.indexOf(state);
    
            return SizedBox(
              height: bottomNavBarHeight,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: BottomNavigationBar(
                  enableFeedback: true,
                  elevation: 0,
                  iconSize: 26,
                  selectedItemColor: AppPalette.whiteColor,
                  backgroundColor: AppPalette.lighBlackColor,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  onTap: (index) {
                    context.read<NavigationCubit>().selectItem(
                      NavItems.values[index],
                    );
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        AppImages.home,
                        width: 24,
                        height: 24,
                      ),
                      label: 'Home',
                      activeIcon: Image.asset(
                        AppImages.home,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search),
                      label: 'Explore',
                      activeIcon: Icon(
                        CupertinoIcons.search,
                        color: AppPalette.whiteColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        AppImages.nitrocard,
                        width: 24,
                        height: 24,
                      ),
                      label: 'Nitro Card',
                      activeIcon: Image.asset(
                        AppImages.nitrocard,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        AppImages.rewards,
                        width: 24,
                        height: 24,
                      ),
                      label: 'Rewards',
                      activeIcon: Image.asset(
                        AppImages.rewards,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

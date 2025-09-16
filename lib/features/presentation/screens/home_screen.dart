import 'package:firsteconomy/core/common/custom_appbar.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/bloc/bloc/banner_bloc.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_banner_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_invitefriends_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double screenHight = constraints.maxHeight;

        return Scaffold(
          appBar: CustomAppBar(),
          body: HomeBodyWidget(
            screenHight: screenHight,
            screenWidth: screenWidth,
          ),
        );
      },
    );
  }
}

class HomeBodyWidget extends StatelessWidget {
  final double screenWidth;
  final double screenHight;
  const HomeBodyWidget({
    super.key,
    required this.screenWidth,
    required this.screenHight,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            BannerSectionWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: const Color.fromARGB(255, 98, 98, 98),
                    thickness: 1.5,
                  ),
                  ConstantWidgets.hight10(context),
                  ServicesGridWidget(),
                  ConstantWidgets.hight20(context),
                  Divider(
                    color: const Color.fromARGB(255, 98, 98, 98),
                    thickness: 1.5,
                  ),
                  ConstantWidgets.hight10(context),
                  InviteFriendsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerSectionWidget extends StatelessWidget {
  const BannerSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstantWidgets.hight20(context),
                  SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: AppPalette.blueColor,
                    ),
                  ),
                  Text(
                    'Processing Request',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'We’re connecting, please wait...',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        } else if (state is BannerLoaded) {
          return ImageSlider(banners: state.banners);
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.18,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ConstantWidgets.hight20(context),
                Icon(Icons.cloud_off_sharp, size: 30),
                Text(
                  'Request Failed',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'We’re having trouble connecting.',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_apply_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_banner_builder_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_invitefriends_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_nitro_card_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_service_widget.dart';
import 'package:flutter/material.dart';

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
                  Divider(color: AppPalette.hintColor, thickness: 1.5),
                  ConstantWidgets.hight10(context),
                  InviteFriendsWidget(),
                  ConstantWidgets.hight20(context),
                  Divider(color: AppPalette.hintColor, thickness: 1.5),
                  ConstantWidgets.hight20(context),
                  TwoWheelerLoanCard(
                    screenHeight: screenHight,
                    screenWidth: screenWidth,
                  ),
                  NitroCardScreen(
                    screenHight: screenHight,
                    screenWidth: screenWidth,
                  ), ConstantWidgets.hight20(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
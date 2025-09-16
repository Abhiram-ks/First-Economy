
import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/features/presentation/screens/loaninfo_screen.dart';
import 'package:firsteconomy/features/presentation/widgets/profile_widget/profile_header_widget.dart';
import 'package:firsteconomy/features/presentation/widgets/profile_widget/profile_menuitems_widget.dart';
import 'package:flutter/material.dart';

class ProfileBodyWidget extends StatelessWidget {
  const ProfileBodyWidget({
    super.key,
    required this.screenWidth,
    required this.screenHight,
  });

  final double screenWidth;
  final double screenHight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.09,
            vertical: screenHight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: const ProfileHeaderWidget()),
              ConstantWidgets.hight30(context),
              MenuItemWidget(
                assetPath: AppImages.profileIcon,
                title: 'Profile',
                onTap: () {},
              ),
              MenuItemWidget(
                assetPath: AppImages.loaninfo,
                title: 'Loan Info',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoanInfoScreen()));
                },
              ),
              MenuItemWidget(
                assetPath: AppImages.repayemnt,
                title: 'Repayment',
                onTap: () {},
              ),
              MenuItemWidget(
                assetPath: AppImages.info,
                title: 'Bike Info',
                onTap: () {},
              ),
               MenuItemWidget(
                assetPath: AppImages.documentICon,
                title: 'Vehicle Documents',
                onTap: () {},
              ),
              MenuItemWidget(
                assetPath: AppImages.register,
                title: 'Register Mandate',
                onTap: () {},
              ),
              MenuItemWidget(
                assetPath: AppImages.logout,
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


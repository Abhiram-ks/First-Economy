import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_apply_item_widget.dart';
import 'package:flutter/material.dart';

class TwoWheelerLoanCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const TwoWheelerLoanCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 21, 21),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 56, 56, 56),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    AppImages.scuterBike,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          ConstantWidgets.hight20(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FeatureItem(
                      imagePath: AppImages.bikeApply,
                      title: 'Browse your preferred two wheelers',
                    ),
                  ),
                  _buildDivider(),
                  Expanded(
                    child: FeatureItem(
                      imagePath: AppImages.createApply,
                      title: 'Create Custom\nLoan Plans',
                    ),
                  ),
                  _buildDivider(),
                  Expanded(
                    child: FeatureItem(
                      imagePath: AppImages.scuterApply,
                      title: 'Quick Online\nApproval',
                    ),
                  ),
                ],
              ),
            ),
          ),

          ConstantWidgets.hight30(context),

          SizedBox(
            width: screenWidth * 0.6,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.blueColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Apply Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          ConstantWidgets.hight20(context),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      color: AppPalette.hintColor,
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}

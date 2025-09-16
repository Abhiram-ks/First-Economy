import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart' show AppPalette;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppPalette.whiteColor,
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppPalette.blueColor,
                backgroundImage: AssetImage(AppImages.profile),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppPalette.whiteColor,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    6,
                  ), 
                  child: Image.asset(AppImages.camara, fit: BoxFit.contain),
                ),
              ),
            ),
          ],
        ),
        ConstantWidgets.hight20(context),
         Text(
          'Ayush Khurana',
          style: GoogleFonts.poppins(
            color:AppPalette.blueColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '+91 9940211***3',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

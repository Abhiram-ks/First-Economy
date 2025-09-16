import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemWidget extends StatelessWidget {
  final String assetPath;
  final String title;
  final VoidCallback onTap;

  const MenuItemWidget({
    super.key,
    required this.assetPath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppPalette.lighBlackColor,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          ConstantWidgets.hight10(context),
          Row(
            children: [
              Image.asset(
                assetPath,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
              ConstantWidgets.width40(context),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          ConstantWidgets.hight20(context),
        ],
      ),
    );
  }
}

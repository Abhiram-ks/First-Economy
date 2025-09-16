import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteFriendsWidget extends StatelessWidget {
  const InviteFriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 21, 21, 21),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Invite your friends',
                  style: GoogleFonts.poppins(
                    color: AppPalette.blueColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ConstantWidgets.hight10(context),
                Text(
                  'Get upto 1000 coins when your friends sign up for CreditWise Digital',
                  style: GoogleFonts.poppins(fontSize: 11),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),

                ConstantWidgets.hight10(context),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppPalette.blueColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    minimumSize: const Size(0, 36),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Send Invite',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ConstantWidgets.width20(context),
          SizedBox(
            width: 70,
            height: 70,
            child: Image.asset(
              AppImages.hand, 
              fit: BoxFit.contain, 
            ),
          ),
        ],
      ),
    );
  }
}

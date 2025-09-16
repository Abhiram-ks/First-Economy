import 'package:firsteconomy/core/common/custom_appbar.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/widgets/emi_widget/emi_dials_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoanInfoScreen extends StatelessWidget {
  const LoanInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double screenHight = constraints.maxHeight;
        
        return Scaffold(
          appBar: CustomAppBar(userName: "Ayush",showBack: true,),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHight * 0.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Number Of',
                      style: GoogleFonts.outfit(
                        color: AppPalette.greenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24
                      ),
                    ) ,ConstantWidgets.width20(context),
                    Text(
                      'EMIs',
                      style: GoogleFonts.outfit(
                        color: AppPalette.buttonColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 24
                      ),
                    )
                  ],
                ), ConstantWidgets.hight50(context),
                EmiDialWidget()
              ],
            ),
          ),
        );
      }
    );

  }
}


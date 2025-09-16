import 'package:firsteconomy/core/common/custom_appbar.dart';
import 'package:firsteconomy/features/presentation/widgets/profile_widget/profile_body_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double screenHight = constraints.maxHeight;

        return Scaffold(
          appBar: CustomAppBar(userName: 'Ayush'),
          body: ProfileBodyWidget(screenWidth: screenWidth, screenHight: screenHight),
        );
      },
    );
  }
}

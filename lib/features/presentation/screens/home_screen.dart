
import 'package:firsteconomy/core/common/custom_appbar.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_body_widget.dart';
import 'package:flutter/material.dart';

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

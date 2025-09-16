
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const FeatureItem({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 45, 
          fit: BoxFit.contain,
        ),ConstantWidgets.hight10(context),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color.fromARGB(255, 96, 96, 96),
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}


import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/features/presentation/widgets/home_widget/home_service_helper.dart';
import 'package:flutter/material.dart';


class ServicesGridWidget extends StatelessWidget {
  const ServicesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        ConstantWidgets.hight10(context),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 12,
          crossAxisSpacing: 7,
          childAspectRatio: 0.9, 
          children: getServiceItems(),
        ),
      ],
    );
  }
}

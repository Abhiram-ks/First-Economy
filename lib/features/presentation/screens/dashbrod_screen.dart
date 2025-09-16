import 'package:firsteconomy/features/presentation/widgets/home_widget/home_banner_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/home_widget/home_invitefriends_widget.dart';
import '../widgets/home_widget/home_service_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeBannerWidget(),
          SizedBox(height: 20),
          ServicesGridWidget(),
          SizedBox(height: 20),
          InviteFriendsWidget(),
        ],
      ),
    );
  }
}

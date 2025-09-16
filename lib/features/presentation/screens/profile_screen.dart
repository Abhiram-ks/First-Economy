import 'package:firsteconomy/core/common/custom_appbar.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/features/presentation/widgets/profile_widget/profile_menuitems_widget.dart'
    show MenuItemWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/profile_widget/profile_header_widget.dart';

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
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.09,
                  vertical: screenHight * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: const ProfileHeaderWidget()),
                    ConstantWidgets.hight30(context),
                    MenuItemWidget(
                      icon: CupertinoIcons.person,
                      title: 'Profile',
                      onTap: () {},
                    ),
                    MenuItemWidget(
                      icon: Icons.info_outline,
                      title: 'Profile',
                      onTap: () {},
                    ),
                    MenuItemWidget(
                      icon: Icons.logout,
                      title: 'Profile',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


// Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           const ProfileHeaderWidget(),
//           const SizedBox(height: 30),
//           Expanded(
//             child: ListView(
//               children: [
//                 MenuItemWidget(
//                   icon: Icons.person_outline,
//                   title: 'Profile',
//                   onTap: () {},
//                 ),
//                 MenuItemWidget(
//                   icon: Icons.info_outline,
//                   title: 'Loan Info',
//                   onTap: () {
                    
//                   },
//                 ),
//                 MenuItemWidget(
//                   icon: Icons.payment_outlined,
//                   title: 'Repayment',
//                   onTap: () {},
//                 ),
//                 MenuItemWidget(
//                   icon: Icons.motorcycle_outlined,
//                   title: 'Bike Info',
//                   onTap: () {},
//                 ),
//                 MenuItemWidget(
//                   icon: Icons.description_outlined,
//                   title: 'Vehicle Documents',
//                   onTap: () {},
//                 ),
//                 MenuItemWidget(
//                   icon: Icons.app_registration_outlined,
//                   title: 'Register Mandate',
//                   onTap: () {},
//                 ),
//                 MenuItemWidget(
//                   icon: Icons.logout_outlined,
//                   title: 'Logout',
//                   onTap: () {},
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
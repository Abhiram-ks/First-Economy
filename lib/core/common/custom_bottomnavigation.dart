
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BottomNavigationWidget extends StatelessWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(
//             icon: Icons.home,
//             label: 'Home',
//             onTap: () => context.read<NavigationBloc>().add(NavigateToHome()),
//           ),
//           _buildNavItem(
//             icon: Icons.explore,
//             label: 'Explore',
//             onTap: () {},
//           ),
//           _buildNavItem(
//             icon: Icons.credit_card,
//             label: 'Nitro Card',
//             onTap: () {},
//           ),
//           _buildNavItem(
//             icon: Icons.card_giftcard,
//             label: 'Rewards',
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem({
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: Colors.white, size: 24),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

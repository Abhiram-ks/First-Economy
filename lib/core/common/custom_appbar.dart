import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userName;

  const CustomAppBar({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPalette.lighBlackColor,
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<NavigationCubit>().selectItem(NavItems.profile);
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppPalette.blueColor,
                  backgroundImage: AssetImage(AppImages.profile),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    userName == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                children: [
                  Text(
                    'Hi,',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (userName != null)
                    Text(
                      userName ?? 'Unknown',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ],
          ),

          Flexible(
            child: Center(
              child: Image.asset(
                AppImages.capital,
                height: 32.65,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const Icon(
            CupertinoIcons.line_horizontal_3,
            size: 30,
          ),
        ],
      ),

      toolbarHeight: 65,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

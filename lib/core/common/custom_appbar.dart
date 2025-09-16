import 'package:firsteconomy/core/constant/app_images.dart';
import 'package:firsteconomy/core/constant/constant.dart';
import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:firsteconomy/features/presentation/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? userName;
  final bool showBack;

  const CustomAppBar({super.key, this.userName, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPalette.lighBlackColor,
      automaticallyImplyLeading: false,
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
                  if (showBack) {
                    Navigator.of(context).maybePop();
                  } else {
                    context.read<NavigationCubit>().selectItem(
                      NavItems.profile,
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppPalette.whiteColor,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppPalette.blueColor,
                    backgroundImage: AssetImage(AppImages.profile),
                  ),
                ),
              ),

              ConstantWidgets.width20(context),
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
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded, size: 30)),
        ],
      ),

      toolbarHeight: 65,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

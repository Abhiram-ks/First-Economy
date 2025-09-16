import 'package:firsteconomy/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildServiceItem(String assetPath, String title, Alignment begin, Alignment end) {
  return Container(
    padding: const EdgeInsets.all(1), 
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        colors: [AppPalette.hintColor, AppPalette.blackColor],
        begin: begin,
        end: end,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppPalette.blackColor,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              height: 28,
              width: 28,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
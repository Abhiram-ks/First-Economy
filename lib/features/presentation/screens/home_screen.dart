import 'package:firsteconomy/core/common/custom_appbar.dart';
import 'package:firsteconomy/core/common/custom_bottomnavigation.dart';
import 'package:firsteconomy/features/presentation/screens/dashbrod_screen.dart';
import 'package:firsteconomy/features/presentation/screens/loaninfo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
    );
  }
}
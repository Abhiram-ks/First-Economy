import 'package:firsteconomy/core/themes/app_themes.dart';
import 'package:firsteconomy/features/data/datasource/banner_remote_datasource.dart';
import 'package:firsteconomy/features/data/repo/banner_repo_impl.dart';
import 'package:firsteconomy/features/domain/usecase/banner_usecase.dart';
import 'package:firsteconomy/features/presentation/bloc/bloc/banner_bloc.dart';
import 'package:firsteconomy/features/presentation/bloc/emi_bloc/emi_bloc.dart';
import 'package:firsteconomy/features/presentation/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:firsteconomy/features/presentation/screens/bottom_navigation.dart';
import 'package:firsteconomy/features/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => EmiBloc()),
        BlocProvider(      create:
          (context) => BannerBloc(
            getBannersUseCase: GetBannersUseCase(
              repository: BannerRepositoryImpl(
                remoteDatasource: BannerRemoteDatasource(),
              ),
            ),
          )..add(FetchBannerEvent()))
      ],
      child: MaterialApp(
        title: 'Loan App',
        theme: AppTheme.darkTheme,
        home:  BottomNavigationControllers(),
        debugShowCheckedModeBanner: false,
        
      ),
    );
  }
}
    
    

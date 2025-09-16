import 'package:bloc/bloc.dart';

enum NavItems {home, explore, card, rewards, profile}

class NavigationCubit extends Cubit<NavItems> {
  NavigationCubit() : super(NavItems.home);
  
  void selectItem (NavItems item) {
    emit(item);
  }
}

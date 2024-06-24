import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/presentation/controller/ECommerceCubitStates.dart';

class ECommerceCubit extends Cubit<ECommerceCubitStates> {
  ECommerceCubit() : super(HomeState());
  void getscreen(int x) {
    if (x == 0) {
      emit(HomeState());
    } else if (x == 1) {
      emit(CartState());
    } else {
      emit(SettingsState());
    }
  }
}

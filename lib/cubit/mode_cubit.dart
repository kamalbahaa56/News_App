import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_api/shared/cash_helper.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
   bool isChangeMode = false;
  ModeCubit() : super(ModeInitial());

  static ModeCubit get(context) => BlocProvider.of(context);
   void ChangeModeApp({bool? fromShared}) {
    if (fromShared != null) {
      isChangeMode = fromShared;
    } else {
      isChangeMode = !isChangeMode;
    }

    CashHelper.putData('isDark', isChangeMode).then((value) {
      emit(ChangeModeAppState());
    }).catchError((error) {
      print('Failed to save mode: $error');
    });
  }
}

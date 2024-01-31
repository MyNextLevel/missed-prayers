import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void nextPage() {
    final int currentPage = state.currentPage + 1;
    final String title;
    switch (currentPage) {
      case 0:
        title = 'Tushunarli';
      case 1:
        title = 'Keyingi';
      case 2:
        title = 'Keyingi';
      case 3:
        title = 'Keyingi';
      case 4:
        title = 'Tasdiqlash';
      case 5:
        title = 'Ado qilishga kirishish';
      default:
        title = 'Yuklanmoqda...';
    }
    emit(
      state.copyWith(
        currentPage: currentPage,
        acceptButtonText: title,
      ),
    );
  }
}

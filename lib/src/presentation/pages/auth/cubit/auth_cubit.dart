import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void nextPage() {
    final int currentPage = state.currentPage + 1;
    final String title;
    final double progress;
    switch (currentPage) {
      case 0:
        title = 'Tushunarli';
        progress = 0;
        break;
      case 1:
        title = 'Keyingi';
        progress = 0.3;
        break;
      case 2:
        title = 'Keyingi';
        progress = 0.6;
        break;
      case 3:
        title = 'Keyingi';
        progress = 1.0;
        break;
      case 4:
        title = 'Tasdiqlash';
        progress = 0;
        break;
      case 5:
        title = 'Ado qilishga kirishish';
        progress = 0;
        break;
      default:
        title = 'Yuklanmoqda...';
        progress = 0;
        break;
    }
    emit(
      state.copyWith(
        currentPage: currentPage,
        acceptButtonText: title,
        dateProgress: progress,
      ),
    );
  }
}

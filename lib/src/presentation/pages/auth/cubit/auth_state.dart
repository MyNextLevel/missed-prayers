part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(0) int currentPage,
    @Default('Tushunarli') String acceptButtonText,
  }) = _AuthState;
}

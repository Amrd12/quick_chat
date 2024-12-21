part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.success(UserModel userModel) = AuthLoginSuccess;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.error(ApiErrorHandler error) = AuthError;
}

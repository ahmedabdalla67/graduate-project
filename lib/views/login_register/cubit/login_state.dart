part of 'login_cubit.dart';

@immutable
sealed class LoginRegistStates {}

final class ChangeVisibility extends LoginRegistStates {}

final class ChangeVisibilityForRegister extends LoginRegistStates {}

final class InitialState extends LoginRegistStates {}

final class LoadingState extends LoginRegistStates {}

final class SuccessState extends LoginRegistStates {
  final UserResponse userResponse;

  SuccessState(this.userResponse);
}

final class ErrorState extends LoginRegistStates {
  final String errMessage;

  ErrorState(this.errMessage);
}

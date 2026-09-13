part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState {}

final class ErrorState extends AuthState {
  final String message;

  ErrorState({required this.message});
}

final class SendCodeState extends AuthState {
  final int userId;

  SendCodeState({required this.userId});
}

final class VerifiedCodeState extends AuthState {
  final String accessToken;
  final String refreshToken;

  VerifiedCodeState({required this.accessToken, required this.refreshToken});
}

final class LoggedInState extends AuthState {}

final class LoggedOutState extends AuthState {}

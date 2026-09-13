import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:veloshop/features/auth/data/model/auth_model.dart';
import 'package:veloshop/features/auth/data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthLoginRepo _authUser;

  AuthCubit({required this._authUser})
    : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoadingState());

    try {
      final userId = await _authUser.login(
        AuthLoginModel(email: email, password: password));
      emit(SendCodeState(userId: userId));
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  Future<void> verifyLogin({required int userId, required int code}) async {
    emit(LoadingState());

    try {
      final tokens = await _authUser.verifyLogin(
        VerifyLoginModel(userId: userId, code: code),
      );

      emit(
        VerifiedCodeState(
          accessToken: tokens.access,
          refreshToken: tokens.refresh,
        ),
      );
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }

  void logout() {
    emit(LoggedOutState());
  }
}

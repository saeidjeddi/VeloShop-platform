import 'package:veloshop/features/auth/data/datasources/remote/auth_data_src.dart';
import 'package:veloshop/features/auth/data/model/auth_model.dart';

abstract class IAuthLoginRepo {
  Future<int> login(AuthLoginModel model);
  Future<AuthTokenModel> verifyLogin(VerifyLoginModel model);
}

class AuthLoginRepository implements IAuthLoginRepo {
  final IAuthLoginDataSource dataSource;

  AuthLoginRepository(this.dataSource);

  @override
  Future<int> login(AuthLoginModel model) async {
    final response = await dataSource.login(model);
    return response.data['user_id'] as int;
  }

  @override
  Future<AuthTokenModel> verifyLogin(VerifyLoginModel model) async {
    final response = await dataSource.verifyLogin(model);

    return AuthTokenModel.fromJson(response.data);
  }
}

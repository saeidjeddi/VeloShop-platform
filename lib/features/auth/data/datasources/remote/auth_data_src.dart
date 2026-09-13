import 'package:dio/dio.dart';
import 'package:veloshop/core/network/endpoints.dart';
import 'package:veloshop/features/auth/data/model/auth_model.dart';

abstract class IAuthLoginDataSource {
  Future<Response> login(AuthLoginModel model);

  Future<Response> verifyLogin(VerifyLoginModel model);
}

class AuthDataRemoteSource implements IAuthLoginDataSource {
  final Dio httpClient;

  AuthDataRemoteSource(this.httpClient);

  @override
  Future<Response> login(AuthLoginModel model) async {
    try {
      final response = await httpClient.post(
        Endpoints.loginAuthUrl,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return response;
      }

      throw Exception('خطای نامشخص');
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('تعداد درخواست‌ها بیش از حد مجاز است');
      }

      if (e.response?.statusCode == 401) {
        throw Exception('رمز عبور یا نام کاربری صحصح نیست .');
      }


      if (e.response?.statusCode == 502) {
        throw Exception('خطا در سرور');
      }

      throw Exception('خطا در برقراری ارتباط با سرور');
    }
  }

  @override
  Future<Response> verifyLogin(VerifyLoginModel model) async {
    try {
      final response = await httpClient.post(
        Endpoints.verifyCodeUrl,
        data: model.toJson(),
      );

      if (response.statusCode == 200) {
        return response;
      }

      throw Exception('خطای نامشخص');
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('تعداد درخواست‌ها بیش از حد مجاز است');
      }

      if (e.response?.statusCode == 502) {
        throw Exception('خطا در سرور');
      }

      throw Exception('خطا در برقراری ارتباط با سرور');
    }
  }
}

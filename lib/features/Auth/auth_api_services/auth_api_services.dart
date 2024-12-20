import 'package:quick_chat/core/network/api_result.dart';
import 'package:quick_chat/features/Auth/data/model/user_model.dart';

abstract class AuthApiServices {
  Future<ApiResult<UserModel>> login(
      {required String mail, required String pass});

  Future<ApiResult<UserModel>> regester({
    required String mail,
    required String pass,
    required String name,
    required String phoneNumber,
    required String deviceId,
  });

  Future<void> logout();

  Future<bool> isSessionValid();
}

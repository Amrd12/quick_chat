import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_chat/core/constants/firebase_strings.dart';
import 'package:quick_chat/core/network/api_error_handler.dart';
import 'package:quick_chat/core/network/api_result.dart';
import 'package:quick_chat/features/Auth/auth_api_services/auth_api_services.dart';
import 'package:quick_chat/features/Auth/data/model/user_model.dart';

class AuthApiFirebaseImp implements AuthApiServices {
  @override
  Future<bool> isSessionValid() {
    // TODO: implement isSessionValid
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<UserModel>> login(
      {required String mail, required String pass}) async {
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: mail.trim(),
      password: pass.trim(),
    );
    final user = userCredential.user;
    if (user == null) {
      return ApiResult.failure(ApiErrorHandler(
        statusCode: 404,
        statusMessage: "User not found",
        success: false,
      ));
    }
    final data = await FirebaseFirestore.instance
        .collection(FirebaseStrings.userCollection)
        .doc(user.uid)
        .get();
    return ApiResult.success(UserModel(
      name: data.data()![FirebaseStrings.firstName],
      phoneNumber: data.data()![FirebaseStrings.phoneNumber],
      email: user.email!,
      deviceId: data.data()![FirebaseStrings.deviceId],
    ));
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<ApiResult<UserModel>> regester({
    required String mail, //
    required String pass, //
    required String name, //
    required String phoneNumber,
    required String deviceId,
  }) async {
    final UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail.trim(), password: pass.trim());
    if (user.user == null) {
      ApiErrorHandler error = ApiErrorHandler(
          statusCode: 500, statusMessage: "NO User", success: false);
      return ApiResult.failure(error);
    }

    FirebaseFirestore.instance
        .collection(FirebaseStrings.userCollection)
        .doc(user.user!.uid)
        .set({
      FirebaseStrings.firstName: name,
      FirebaseStrings.phoneNumber: phoneNumber,
      FirebaseStrings.deviceId: deviceId
    });
    return ApiResult.success(UserModel(
      name: name,
      phoneNumber: phoneNumber,
      email: mail,
      deviceId: deviceId,
    ));
  }
}

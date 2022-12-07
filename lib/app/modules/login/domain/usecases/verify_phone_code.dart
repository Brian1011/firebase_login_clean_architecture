import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/services/connectivity_service.dart';

class VerifyPhoneCode {
  LoginRepository loginRepository;
  ConnectivityService service;
  VerifyPhoneCode(this.loginRepository, this.service);

  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    if (!credential.isValidCode) {
      return Left(ErrorLoginPhone(message: "Invalid code"));
    } else if (!credential.isValidVerificationId) {
      return Left(InternalError(message: "Internal error: verification id"));
    }

    var result = await service.isOnline();

    if (!result.isLeft()) {
      return Left(
          ConnectionError(message: "Internet connection is not available"));
    }

    return await loginRepository.verifyWithPhone(
        verificationId: credential.verificationId!, code: credential.code!);
  }
}

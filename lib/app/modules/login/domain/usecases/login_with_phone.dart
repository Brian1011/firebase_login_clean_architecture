import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/services/connectivity_service.dart';

class LoginWithPhoneUseCase {
  final ConnectivityService service;
  final LoginRepository _loginRepository;
  LoginWithPhoneUseCase(this._loginRepository, this.service);

  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    if (!credential.isValidPhone) {
      return Left(ErrorLoginPhone(message: "Unable to login with phone"));
    }

    var result = await service.isOnline();

    if (result.isLeft()) {
      return Left(
          ConnectionError(message: "Internet connection is not available"));
    }

    return await _loginRepository.loginWithPhone(phone: credential.phone!);
  }
}

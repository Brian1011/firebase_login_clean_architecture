import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/services/connectivity_service.dart';

class LoginWithEmail {
  final LoginRepository _loginRepository;
  final ConnectivityService service;
  LoginWithEmail(this._loginRepository, this.service);

  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    var result = await service.isOnline();

    if (result.isLeft()) {
      // return result.map((r) => null);
      return Left(
          ConnectionError(message: "Internet connection is not available"));
    }

    if (!credential.isValidEmail) {
      return Left(ErrorLoginWithEmail(message: "Invalid email"));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginWithEmail(message: "Invalid password"));
    }

    return await _loginRepository.loginWithEmail(
        email: credential.email ?? '', password: credential.password ?? '');
  }
}

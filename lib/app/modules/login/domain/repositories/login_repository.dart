import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';

import '../errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginWithEmail(
      {required String email, required String password});
  Future<Either<Failure, LoggedUserInfo>> loginWithPhone(
      {required String phone});
  Future<Either<Failure, LoggedUserInfo>> verifyWithPhone(
      {required String verificationId, required String code});
  Future<Either<Failure, LoggedUserInfo>>? loggedUser();

  Future<Either<Failure, Unit>> logout();
}

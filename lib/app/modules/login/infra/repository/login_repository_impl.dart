import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() {
    // TODO: implement loggedUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginWithEmail(
      {required String email, required String password}) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginWithPhone(
      {required String phone}) {
    // TODO: implement loginWithPhone
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> verifyWithPhone(
      {required String verificationId, required String code}) {
    // TODO: implement verifyWithPhone
    throw UnimplementedError();
  }
}

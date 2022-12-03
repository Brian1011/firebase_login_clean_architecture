import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await dataSource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(ErrorGetLoggedUser(
          message: "Error trying to retrieve current logged in user"));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginWithEmail(
      {required String email, required String password}) async {
    try {
      var user = await dataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginWithEmail(message: "Error login with email"));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loginWithPhone(
      {required String phone}) async {
    try {
      var user = await dataSource.loginPhone(phone: phone);
      return Right(user);
    } on NotAutomaticRetrieved catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorLoginPhone(message: "Error login with Phone"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: "Logout error"));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> verifyWithPhone(
      {required String verificationId, required String code}) async {
    try {
      var user = await dataSource.validateCode(
          code: code, verificationId: verificationId);
      return Right(user);
    } catch (e) {
      return Left(ErrorLoginPhone(message: "Error login with phone"));
    }
  }
}

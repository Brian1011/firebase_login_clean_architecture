import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';

class GetLoggedUserUseCase {
  final LoginRepository _repository;
  GetLoggedUserUseCase(this._repository);

  Future<Either<Failure, LoggedUserInfo>?> call() async {
    return await _repository.loggedUser();
  }
}

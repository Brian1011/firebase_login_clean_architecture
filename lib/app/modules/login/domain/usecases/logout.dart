import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';

class Logout {
  LoginRepository loginRepository;
  Logout(this.loginRepository);

  Future<Either<Failure, Unit>> call() async {
    return await loginRepository.logout();
  }
}

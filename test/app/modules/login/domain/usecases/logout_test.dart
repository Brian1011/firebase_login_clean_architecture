import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/usecases/logout.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_test.mocks.dart';

@GenerateMocks([
  LoginRepository,
])
main() {
  final repository = MockLoginRepository();
  final usecase = LogoutUseCase(repository);

  test('should verify if there is a logged in user', () async {
    when(repository.logout()).thenAnswer((_) async => const Right(unit));
    var result = (await usecase()).fold((l) => null, (r) => r);
    expect(result, unit);
  });

  test('should return null if user is not logged in', () async {
    when(repository.logout())
        .thenAnswer((_) async => Left(ErrorLogout(message: "Logout error")));
    var result = (await usecase()).fold((l) => l, (r) => null);
    expect(result, isA<ErrorLogout>());
  });

  test('should return null if user is not logged in', () async {
    var _error = ErrorLogout(message: "User is logged out");
    when(repository.logout()).thenAnswer((_) async => Left(_error));

    var result = await usecase();

    expect(result.leftMap((l) => l is ErrorLogout), const Left(true));
  });
}

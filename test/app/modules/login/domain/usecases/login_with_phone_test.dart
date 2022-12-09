import 'package:dartz/dartz.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/services/connectivity_service.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/usecases/login_with_phone.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_with_phone_test.mocks.dart';

@GenerateMocks([LoginRepository, ConnectivityService])
main() {
  final repository = MockLoginRepository();
  final service = MockConnectivityService();
  final usecase = LoginWithPhoneUseCase(repository, service);
  final user = UserModel(name: "Test", email: "", phoneNumber: "");

  setUpAll(() {
    when(service.isOnline()).thenAnswer((_) async => const Right(unit));
  });

  test('should verify if phone is valid', () async {
    var result = await usecase(LoginCredential.withPhone(phoneNumber: ""));
    expect(result.leftMap((l) => l is ErrorLoginPhone), const Left(true));
  });

  test('should consume repository but not automatic retrieve', () async {
    var error = ErrorLoginPhone(message: "Can't login with phone number");
    when(repository.loginWithPhone(phone: "12345678910"))
        .thenAnswer((_) async => Left(error));

    var result =
        await usecase(LoginCredential.withPhone(phoneNumber: "12345678910"));

    expect(result, Left(error));
  });

  test('should consume repository loginWithPhone', () async {
    when(repository.loginWithPhone(phone: "12345678910"))
        .thenAnswer((_) async => Right(user));

    var result =
        await usecase(LoginCredential.withPhone(phoneNumber: "12345678910"));

    expect(result, Right(user));
  });

  test('should return error when offline', () async {
    var error = ConnectionError(message: "Internet connection error");
    when(service.isOnline()).thenAnswer((_) async => Left(error));

    var result =
        await usecase(LoginCredential.withPhone(phoneNumber: "12345678910"));

    expect(result.leftMap((l) => l is ConnectionError), const Left(true));
  });

  /**
   * Learnt lessons:
   * 1. Use cases do not have mocks
   * 2. Services and repositories have the then answer
   * 3.
   * */
}

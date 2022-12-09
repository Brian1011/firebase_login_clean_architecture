import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/infra/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_test.mocks.dart';

//class LoginRepositoryMock extends Mock implements LoginRepository {}

// class FirebaseUserMock extends Mock implements User {}

// class ErrorGetLoggedUserMock extends Mock implements ErrorGetLoggedUser {}

@GenerateMocks([LoginRepository])
@GenerateMocks([User])
@GenerateMocks([ErrorGetLoggedUser])
@GenerateMocks([GetLoggedUserUseCase])
main() {
  final repository = MockLoginRepository();
  final usecase = GetLoggedUserUseCase(repository);
  //final usecase = GetLoggedUserUseCase(repository);
  // final errorGetLoogedUser = MockErrorGetLoggedUser();

  test('should verify if user is logged in', () async {
    when(repository.loggedUser()).thenAnswer((_) async =>
        Right(UserModel(name: "one", email: "two", phoneNumber: "three")));

    var result = (await usecase()).fold((l) => l, (r) => r);

    print('result');
    print(result);
    //expect(result, isA<ErrorGetLoggedUser>());
    expect(result, isA<LoggedUserInfo>());
  });

  test('should verify if exist User Logged', () async {
    when(repository.loggedUser()).thenAnswer(
        (_) async => Right(UserModel(name: "", email: "", phoneNumber: "")));
    var result = (await usecase()).fold((l) => l, (r) => r);
    expect(result, isA<LoggedUserInfo>());
  });
}

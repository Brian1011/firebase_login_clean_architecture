// Mocks generated by Mockito 5.2.0 from annotations
// in firebase_login_clean_architecture/test/app/modules/login/domain/usecases/login_with_email_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart'
    as _i7;
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart'
    as _i9;
import 'package:firebase_login_clean_architecture/app/modules/login/domain/errors/errors.dart'
    as _i6;
import 'package:firebase_login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart'
    as _i4;
import 'package:firebase_login_clean_architecture/app/modules/login/domain/services/connectivity_service.dart'
    as _i3;
import 'package:firebase_login_clean_architecture/app/modules/login/domain/usecases/login_with_email.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeConnectivityService_1 extends _i1.Fake
    implements _i3.ConnectivityService {}

/// A class which mocks [LoginRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginRepository extends _i1.Mock implements _i4.LoginRepository {
  MockLoginRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>> loginWithEmail({
    String? email,
    String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithEmail,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>.value(
            _FakeEither_0<_i6.Failure, _i7.LoggedUserInfo>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>> loginWithPhone(
          {String? phone}) =>
      (super.noSuchMethod(
        Invocation.method(
          #loginWithPhone,
          [],
          {#phone: phone},
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>.value(
            _FakeEither_0<_i6.Failure, _i7.LoggedUserInfo>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>> verifyWithPhone({
    String? verificationId,
    String? code,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyWithPhone,
          [],
          {
            #verificationId: verificationId,
            #code: code,
          },
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>.value(
            _FakeEither_0<_i6.Failure, _i7.LoggedUserInfo>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>> loggedUser() =>
      (super.noSuchMethod(
        Invocation.method(
          #loggedUser,
          [],
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>.value(
            _FakeEither_0<_i6.Failure, _i7.LoggedUserInfo>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i6.Failure, _i2.Unit>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>);
}

/// A class which mocks [ConnectivityService].
///
/// See the documentation for Mockito's code generation for more information.
class MockConnectivityService extends _i1.Mock
    implements _i3.ConnectivityService {
  MockConnectivityService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>> isOnline() =>
      (super.noSuchMethod(
        Invocation.method(
          #isOnline,
          [],
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i6.Failure, _i2.Unit>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>);
}

/// A class which mocks [LoginWithEmailUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailUseCase extends _i1.Mock
    implements _i8.LoginWithEmailUseCase {
  MockLoginWithEmailUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ConnectivityService get service => (super.noSuchMethod(
        Invocation.getter(#service),
        returnValue: _FakeConnectivityService_1(),
      ) as _i3.ConnectivityService);
  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>> call(
          _i9.LoginCredential? credential) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [credential],
        ),
        returnValue: Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>.value(
            _FakeEither_0<_i6.Failure, _i7.LoggedUserInfo>()),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.LoggedUserInfo>>);
}
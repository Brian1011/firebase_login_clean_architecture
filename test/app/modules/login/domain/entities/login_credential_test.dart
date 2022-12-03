import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/login_credential.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("should check if field is valid or not", () {
    test('email and password', () {
      expect(
          LoginCredential.withEmailAndPassword(email: "", password: "")
              .isValidEmail,
          false);

      expect(
          LoginCredential.withEmailAndPassword(email: "jacob", password: "")
              .isValidEmail,
          false);

      expect(
          LoginCredential.withEmailAndPassword(
                  email: "jacob@flutterrando.com.br", password: "")
              .isValidEmail,
          true);
    });

    test('phone', () {
      expect(LoginCredential.withPhone(phoneNumber: "").isValidPhone, false);

      expect(LoginCredential.withPhone(phoneNumber: "123456789").isValidPhone,
          false);

      expect(LoginCredential.withPhone(phoneNumber: "12345678910").isValidPhone,
          true);
    });

    test('code and verification id', () {
      expect(
          LoginCredential.withVerificationCode(code: "", verificationId: "")
              .isValidCode,
          false);

      expect(
          LoginCredential.withVerificationCode(
                  code: "123456", verificationId: "")
              .isValidCode,
          true);

      expect(
          LoginCredential.withVerificationCode(code: "", verificationId: "")
              .isValidVerificationId,
          false);

      expect(
          LoginCredential.withVerificationCode(
                  code: "", verificationId: "123456")
              .isValidVerificationId,
          true);
    });
  });
}

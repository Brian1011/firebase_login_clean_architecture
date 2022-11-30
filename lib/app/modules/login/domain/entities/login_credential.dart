import 'package:string_validator/string_validator.dart' as validator;

class LoginCredential {
  final String? email;
  final String? password;
  final String? phone;
  final String? code;
  final String? verificationId;

  LoginCredential(
      {this.email, this.password, this.phone, this.code, this.verificationId});

  bool get isValidEmail => validator.isEmail(email ?? '');
  bool get isValidPassword =>
      password != null && password!.isNotEmpty && password!.length > 3;
  bool get isValidPhone => phone!.isNotEmpty && phone!.length > 10;
  bool get isValidCode => code != null && code!.isNotEmpty;
  bool get isValidVerificationId => verificationId!.isNotEmpty;

  factory LoginCredential.withEmailAndPassword(
      {required String email, required String password}) {
    return LoginCredential(email: email, password: password);
  }

  factory LoginCredential.withPhone({required String phoneNumber}) {
    return LoginCredential(phone: phoneNumber);
  }

  factory LoginCredential.withVerificationCode(
      {required String code, required String verificationId}) {
    return LoginCredential(code: code, verificationId: verificationId);
  }
}

import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user.dart';
import 'package:firebase_login_clean_architecture/app/modules/login/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({required String name, String? email, String? phoneNumber})
      : super(email!, name, phoneNumber!);
}

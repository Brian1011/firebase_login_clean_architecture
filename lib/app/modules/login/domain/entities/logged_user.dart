import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;

  LoggedUser(this.email, this.name, this.phoneNumber);

  @override
  List<Object?> get props => [name, email];
}

import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  late final String email;
  late final String name;
  late final String phoneNumber;

  @override
  List<Object?> get props => [name, email];
}

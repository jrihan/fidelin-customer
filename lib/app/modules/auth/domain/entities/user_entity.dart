import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String gender;

  const UserEntity({
    this.id = "",
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.avatarUrl = "",
    required this.gender,
  });

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        avatarUrl,
        gender,
      ];
}

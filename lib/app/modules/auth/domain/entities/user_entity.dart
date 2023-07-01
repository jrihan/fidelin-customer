import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? avatarUrl;
  final String? gender;

  const UserEntity({
    this.id = "",
    required this.name,
    required this.email,
    this.phone,
    this.avatarUrl = "",
    this.gender,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
      ];

  get firstName => name.split(' ').first.toString();
}

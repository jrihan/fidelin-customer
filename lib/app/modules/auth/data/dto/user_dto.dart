import 'package:cloud_firestore/cloud_firestore.dart';

class UserDTO {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String avatarUrl;
  final String gender;
  final String password;

  const UserDTO({
    this.id = "",
    required this.name,
    required this.email,
    required this.phone,
    this.avatarUrl = "",
    required this.gender,
    this.password = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'avatarUrl': avatarUrl,
      'gender': gender,
    };
  }

  // factory UserDTO.fromMap(Map map) {
  //   return UserDTO(
  //     id: map['id'],
  //     firstName: map['first_name'],
  //     lastName: map['last_name'],
  //     email: map['email'],
  //     phone: map['phone'],
  //     gender: map['gender'],
  //     avatarUrl: map['avatar_url'],
  //   );
  // }

  factory UserDTO.fromSnapshot(DocumentSnapshot doc) {
    return UserDTO(
      id: doc.id,
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      phone: doc.data().toString().contains('phone') ? doc.get('phone') : '',
      avatarUrl: doc.data().toString().contains('avatar_url')
          ? doc.get('avatar_url')
          : '',
      gender: doc.data().toString().contains('gender') ? doc.get('gender') : '',
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDTO {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String gender;
  final String password;

  const UserDTO({
    this.id = "",
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.avatarUrl = "",
    required this.gender,
    this.password = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
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
      firstName:
          doc.data().toString().contains('name') ? doc.get('first_name') : '',
      lastName:
          doc.data().toString().contains('name') ? doc.get('last_name') : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      phone: doc.data().toString().contains('phone') ? doc.get('phone') : '',
      avatarUrl: doc.data().toString().contains('avatarUrl')
          ? doc.get('avatarUrl')
          : '',
      gender: doc.data().toString().contains('gender') ? doc.get('gender') : '',
    );
  }
}

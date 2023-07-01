import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsDTO {
  final String instagram;
  final String phone;
  final String site;
  final bool whatsapp;

  ContactsDTO({
    required this.instagram,
    required this.phone,
    required this.site,
    required this.whatsapp,
  });

  factory ContactsDTO.fromSnapshot(Map<String, dynamic> doc) {
    return ContactsDTO(
        instagram: doc["instagram"],
        phone: doc["phone"],
        site: doc["site"],
        whatsapp: doc["whatsapp"]);
  }
}

class StoreDTO {
  final String id;
  final String avatarUrl;
  final String email;
  final String name;
  final ContactsDTO contacts;

  StoreDTO({
    required this.id,
    required this.avatarUrl,
    required this.email,
    required this.name,
    required this.contacts,
  });

  factory StoreDTO.fromSnapshot(DocumentSnapshot doc) {
    return StoreDTO(
      id: doc.id,
      avatarUrl: doc.data().toString().contains('avatar_url')
          ? doc.get('avatar_url')
          : '',
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      contacts: ContactsDTO.fromSnapshot(doc["contacts"]),
    );
  }
}

class Contacts {
  final String instagram;
  final String phone;
  final String site;
  final bool whatsapp;

  Contacts({
    required this.instagram,
    required this.phone,
    required this.site,
    required this.whatsapp,
  });
}

class StoreEntity {
  final String id;
  final String avatarUrl;
  final String email;
  final String name;
  final Contacts contacts;

  StoreEntity({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.email,
    required this.contacts,
  });
}

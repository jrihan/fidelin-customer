import 'package:cloud_firestore/cloud_firestore.dart';

class RewardDTO {
  final String imageUrl;
  final String title;

  RewardDTO({required this.imageUrl, required this.title});

  factory RewardDTO.fromSnapshot(Map<String, dynamic> doc) {
    return RewardDTO(title: doc["title"], imageUrl: doc["image_url"]);
  }
}

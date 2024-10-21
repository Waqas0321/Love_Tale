import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username;
  final String email;
  final String image;
  final String status;

  UserModel({
    required this.username,
    required this.email,
    required this.image,
    required this.status,
  });

  // Factory method to create a UserModel from a Firestore document
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      image: data['image'] ?? 'https://via.placeholder.com/150', // Default image if not available
      status: data['status'] ?? '',
    );
  }
}

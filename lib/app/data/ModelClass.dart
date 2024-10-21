// lib/models/user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;
  final String? displayName; // Nullable, for optional user name
  final String? photoURL;     // Nullable, for optional photo URL
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.email,
    this.displayName,
    this.photoURL,
    required this.createdAt,
  });

  // Factory method to create a UserModel from Firestore document data
  factory UserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UserModel(
      id: id,
      email: data['email'] ?? '', // Default to empty string if not available
      displayName: data['displayName'], // Nullable
      photoURL: data['photoURL'],       // Nullable
      createdAt: (data['createdAt'] as Timestamp).toDate(), // Convert Firestore Timestamp to DateTime
    );
  }

  // Method to convert UserModel to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'createdAt': Timestamp.fromDate(createdAt), // Convert DateTime to Firestore Timestamp
    };
  }
}

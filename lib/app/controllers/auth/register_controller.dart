import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../../ui/pages/Auth/login.dart';
import '../../utils/pref_util.dart';

class RegisterControler extends GetxController{
  // Add any necessary variables and methods here
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<File?> image = Rx(null);

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
        image.value = File(pickedFile.path);
    }
  }
  File? _image2;

  Future<void> pickImage2() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
        _image2 = File(pickedFile.path);
    }
  }


  void onContinueWith() {
    // Handle the "Continue with" button action
    print('Continue with button pressed');
  }

  static List<String> scopes = <String>[
    'email',
  ];
  GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: scopes
  );

  void onContinueWithGoogle() {
    // Handle the "Continue with Google" button action
    print('Continue with Google button pressed');
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      // Use the correct idToken
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken, // Changed from accessToken
      );

      UserCredential userCredential =
      await _auth.signInWithCredential(authCredential);
      User? user = userCredential.user;
      print('UserId here at login ${user!.uid}');
      PrefUtil.setString("username", user!.displayName!);
      PrefUtil.setString("userid", user.uid);

      if(user != null){
        await _firestore.collection('Users').doc(user.uid).set({
          'email': user.email,
          'id': user.uid,
          'displayName': user.displayName, // Optional: Save additional info
          'photoURL': user.photoURL,       // Optional: Save photo URL
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      return user;
    } catch (e) {
      Get.snackbar('Error', '$e');
      print('Error about SignIn: $e');
      return null; // Explicitly return null on error
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    Get.to(LoginScreen());
  }
}
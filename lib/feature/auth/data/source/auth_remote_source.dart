import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/app_user_model.dart';

class AuthRemoteSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRemoteSource(this._auth, this._firestore);

  Future<User> register(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }

  Future<User> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }

  /// Reads the picked image off disk and turns it into a base64 string.
  /// The picker already resizes/compresses the source image (see
  /// register_screen.dart), so this stays small enough for a Firestore field.
  Future<String> encodeProfileImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    return base64Encode(bytes);
  }

  Future<void> saveUserProfile(AppUserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<AppUserModel?> getUserProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return AppUserModel.fromFirestore(doc.data()!);
  }

  Future<void> signOut() => _auth.signOut();
}

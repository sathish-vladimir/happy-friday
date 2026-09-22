class AppUserModel {
  final String uid;
  final String email;

  /// Base64-encoded JPEG of the profile picture, stored directly in the
  /// Firestore document. Empty string means "no picture set".
  /// Kept small (resized to ~512px + compressed) before encoding so a single
  /// Firestore document stays well under the 1 MiB document size limit.
  final String profileImageBase64;

  const AppUserModel({
    required this.uid,
    required this.email,
    this.profileImageBase64 = '',
  });

  bool get hasProfileImage => profileImageBase64.isNotEmpty;

  factory AppUserModel.fromFirestore(Map<String, dynamic> data) {
    return AppUserModel(
      uid: data['uid'] ?? '',
      email: data['email'] ?? '',
      profileImageBase64: data['profileImageBase64'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'profileImageBase64': profileImageBase64,
    };
  }
}

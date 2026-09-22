import 'dart:io';
import '../model/app_user_model.dart';
import '../source/auth_remote_source.dart';
import '../../../../core/local/app_preferences.dart';

class AuthRepository {
  final AuthRemoteSource _remote;
  final AppPreferences _prefs;

  AuthRepository(this._remote, this._prefs);

  Future<AppUserModel> register(String email, String password, File? profileImage) async {
    final user = await _remote.register(email, password);

    var imageBase64 = '';
    if (profileImage != null) {
      imageBase64 = await _remote.encodeProfileImage(profileImage);
    }

    final profile = AppUserModel(uid: user.uid, email: email, profileImageBase64: imageBase64);
    await _remote.saveUserProfile(profile);

    // Firebase auto-signs the new user in on createUserWithEmailAndPassword.
    // Registration should always land back on the Login screen instead of
    // auto-entering Home, so sign them out and make sure no "logged in"
    // session is persisted locally.
    await _remote.signOut();
    await _prefs.clearSession();

    return profile;
  }

  Future<AppUserModel?> login(String email, String password) async {
    final user = await _remote.login(email, password);
    final profile = await _remote.getUserProfile(user.uid);
    await _prefs.saveSession(user.uid, email);
    return profile;
  }

  Future<bool> isLoggedIn() => _prefs.isLoggedIn();

  /// Fetches the profile (email + base64 picture) of whoever is currently
  /// logged in, using the uid saved locally at login time.
  Future<AppUserModel?> getCurrentProfile() async {
    final uid = await _prefs.getUid();
    if (uid == null) return null;
    return _remote.getUserProfile(uid);
  }

  Future<void> logout() async {
    await _remote.signOut();
    await _prefs.clearSession();
  }
}

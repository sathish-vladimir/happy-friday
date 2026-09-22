import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/firebase_providers.dart';
import '../../core/local/app_preferences.dart';
import 'data/source/auth_remote_source.dart';
import 'data/repo/auth_repository.dart';
import 'data/model/app_user_model.dart';

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) {
  return AuthRemoteSource(
    ref.watch(firebaseAuthProvider),
    ref.watch(firestoreProvider),
  );
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(authRemoteSourceProvider), ref.watch(appPreferencesProvider));
});

/// The logged-in user's saved profile (email + base64 picture), fetched
/// from Firestore. Any screen that needs to show "who's logged in" (Profile,
/// Settings, etc.) should watch this instead of hardcoding values.
final currentUserProfileProvider = FutureProvider<AppUserModel?>((ref) {
  return ref.watch(authRepositoryProvider).getCurrentProfile();
});

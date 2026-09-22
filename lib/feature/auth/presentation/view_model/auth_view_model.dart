import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/app_user_model.dart';
import '../../auth_dependency_injection.dart';

class AuthViewModel extends AsyncNotifier<AppUserModel?> {
  @override
  Future<AppUserModel?> build() async => null;

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).login(email, password));
  }

  Future<void> register(String email, String password, File? profileImage) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authRepositoryProvider).register(email, password, profileImage));
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, AppUserModel?>(AuthViewModel.new);

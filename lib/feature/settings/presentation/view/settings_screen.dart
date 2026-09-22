import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../../../auth/auth_dependency_injection.dart';
import '../../../auth/presentation/view/login_screen.dart';
import '../widgets/settings_profile_tile.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_footer.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Log out?'),
        content: const Text('You will need to sign in again to continue your practice.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Logout', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    await ref.read(authRepositoryProvider).logout();

    if (!context.mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
    );
  }

  /// "samyu.j@indosakura.com" -> "Samyu J"
  String _displayNameFromEmail(String email) {
    final localPart = email.split('@').first;
    final words = localPart.split(RegExp(r'[._\-]+')).where((w) => w.isNotEmpty);
    if (words.isEmpty) return email;
    return words.map((w) => w[0].toUpperCase() + w.substring(1)).join(' ');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppResponsive.init(context);
    final profileAsync = ref.watch(currentUserProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 20.h),
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios_new, size: 16.sp, color: AppColors.textPrimary),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Settings & Practice', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      Text('PRANIC HEALING SANCTUARY', style: TextStyle(fontSize: 9.sp, color: AppColors.textMuted, letterSpacing: 0.6)),
                    ],
                  ),
                ),
                Image.asset("assets/profile/Lotus Aura Emblem Icon.png", width: 30.w, height: 30.h),
              ],
            ),
            SizedBox(height: 18.h),
            profileAsync.when(
              loading: () => const SettingsProfileTile(name: '...', email: ''),
              error: (err, _) => const SettingsProfileTile(name: 'Guest', email: ''),
              data: (user) {
                final email = user?.email ?? '';
                final name = email.isNotEmpty ? _displayNameFromEmail(email) : 'Guest';
                ImageProvider? avatar;
                if (user != null && user.hasProfileImage) {
                  try {
                    avatar = MemoryImage(base64Decode(user.profileImageBase64));
                  } catch (_) {
                    avatar = null;
                  }
                }
                return SettingsProfileTile(name: name, email: email, avatar: avatar);
              },
            ),
            SizedBox(height: 20.h),
            SettingsSection(
              title: 'PRACTICE & AUDIO',
              tiles: [
                SettingsTileData(
                  'assets/profile/audio.png',
                  'Audio Quality & Binaural Beats',
                  'Hi-Res Lossless · 432 Hz',
                ),
                SettingsTileData(
                  'assets/profile/offline.png',
                  'Offline Sanctuary & Downloads',
                  '6 guided meditations available',
                ),
                SettingsTileData(
                  'assets/profile/notif.png',
                  'Daily Sadhana Reminders',
                  'Twin Hearts · 6:30 AM daily',
                ),
              ],
            ),
            SizedBox(height: 18.h),

            SettingsSection(
              title: 'ACCOUNT & PREFERENCES',
              tiles: [
                SettingsTileData(
                  'assets/profile/fav.png',
                  'Wishlist & Sacred Bookmarks',
                  '12 saved',
                ),
                SettingsTileData(
                  'assets/profile/lang.png',
                  'Language / भाषा',
                  'English',
                ),
                SettingsTileData(
                  'assets/profile/secure.png',
                  'Security & Password',
                  null,
                ),
              ],
            ),
            SizedBox(height: 18.h),

            SettingsSection(
              title: 'PRANIC HEALING TRUST & INFO',
              tiles: [
                SettingsTileData(
                  'assets/profile/about.png',
                  'About Master Choa Kok Sui & Teachings',
                  null,
                ),
                SettingsTileData(
                  'assets/profile/global.png',
                  'Global Meditation Centers',
                  null,
                ),
                SettingsTileData(
                  'assets/profile/terms.png',
                  'Terms & Privacy Policy',
                  null,
                ),
              ],
            ),
            SizedBox(height: 18.h),
            SettingsSection(
              tiles: [
                SettingsTileData('assets/profile/delete.png', 'Delete Account & Data', null, isDestructive: true),
              ],
            ),
            SizedBox(height: 12.h),
            SettingsSection(
              tiles: [
                SettingsTileData(
                  'assets/profile/logout.png',
                  'LOGOUT',
                  null,
                  isDestructive: false,
                  onTap: () => _handleLogout(context, ref),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            const SettingsFooter(),
          ],
        ),
      ),
    );
  }
}
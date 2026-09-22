import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../../../auth/auth_dependency_injection.dart';
import '../../../settings/presentation/view/settings_screen.dart';
import '../widgets/profile_stats_row.dart';
import '../widgets/profile_tab_selector.dart';
import '../widgets/recent_meditations_list.dart';
import '../widgets/practitioner_quote_card.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  int _selectedTab = 0;

  void _openSettings() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
  }


  String _displayNameFromEmail(String email) {
    final localPart = email.split('@').first;
    final words = localPart.split(RegExp(r'[._\-]+')).where((w) => w.isNotEmpty);
    if (words.isEmpty) return email;
    return words.map((w) => w[0].toUpperCase() + w.substring(1)).join(' ');
  }

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    final profileAsync = ref.watch(currentUserProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Profile', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                GestureDetector(
                  onTap: _openSettings,
                  child: Icon(Icons.menu, size: 22.sp, color: AppColors.textPrimary),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            profileAsync.when(
              loading: () => _ProfileHeader(
                avatar: null,
                name: '...',
                email: '',
              ),
              error: (err, _) => _ProfileHeader(
                avatar: null,
                name: 'Guest',
                email: '',
              ),
              data: (user) {
                final email = user?.email ?? '';
                final name = email.isNotEmpty ? _displayNameFromEmail(email) : 'Guest';
                ImageProvider? avatar;
                if (user != null && user.hasProfileImage) {
                  try {
                    avatar = MemoryImage(base64Decode(user.profileImageBase64));
                  } catch (_) {
                    avatar = null; // corrupt/incomplete base64 — fall back to icon
                  }
                }
                return _ProfileHeader(avatar: avatar, name: name, email: email);
              },
            ),
            SizedBox(height: 18.h),
            const ProfileStatsRow(),
            SizedBox(height: 20.h),
            ProfileTabSelector(
              selectedIndex: _selectedTab,
              onSelected: (index) => setState(() => _selectedTab = index),
            ),
            SizedBox(height: 20.h),
            const RecentMeditationsList(),
            SizedBox(height: 20.h),
            const PractitionerQuoteCard(),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final ImageProvider? avatar;
  final String name;
  final String email;

  const _ProfileHeader({required this.avatar, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30.w,
          backgroundColor: AppColors.primaryLight,
          backgroundImage: avatar,
          child: avatar == null ? Icon(Icons.person, color: Colors.white, size: 28.sp) : null,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
              if (email.isNotEmpty)
                Text(email, style: TextStyle(fontSize: 11.sp, color: AppColors.textSecondary)),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(width: 1.w, color: Colors.grey),
                ),
                child: Text(
                  'ARHATIC PRACTITIONER · LEVEL 1',
                  style: TextStyle(fontSize: 8.5.sp, fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
          ),
          child: Text('India', style: TextStyle(fontSize: 10.sp, color: AppColors.primary)),
        ),
      ],
    );
  }
}

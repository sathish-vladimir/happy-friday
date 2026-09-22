import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class SettingsProfileTile extends StatelessWidget {
  final String name;
  final String email;
  final ImageProvider? avatar;

  const SettingsProfileTile({
    super.key,
    required this.name,
    required this.email,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: avatar != null
                ? Image(image: avatar!, width: 60.w, height: 60.h, fit: BoxFit.cover)
                : Image.asset("assets/profile/profile_main.png", width: 60.w, height: 60.h, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                if (email.isNotEmpty)
                  Text(email, style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(14.r)),
            child: Text('Edit', style: TextStyle(fontSize: 10.sp, color: AppColors.primary, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
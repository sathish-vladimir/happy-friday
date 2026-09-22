import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StatCard(icon: Icons.access_time, value: '128', label: 'Hours Meditated', color: AppColors.primary)),
        SizedBox(width: 10.w),
        Expanded(child: _StatCard(icon: Icons.local_fire_department, value: '45', label: 'Day Streak', color: Color(0xFFF43F5E))),
        SizedBox(width: 10.w),
        Expanded(child: _StatCard(icon: Icons.favorite, value: '24', label: 'Sacred Tracks', color: Color(0xFF6366F1))),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 18.sp),
          SizedBox(height: 8.h),
          Text(value, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
          SizedBox(height: 2.h),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 9.sp, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}

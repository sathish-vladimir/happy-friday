import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
class _MeditationHistoryData {
  final String title;
  final String subtitle;
  final String meta;
  final Color color;
  final String imagePath;

  const _MeditationHistoryData(
      this.title,
      this.subtitle,
      this.meta,
      this.color,
      this.imagePath,
      );
}

class RecentMeditationsList extends StatelessWidget {
  const RecentMeditationsList({super.key});

  static const _items = [
    _MeditationHistoryData(
      'Meditation on Twin Hearts',
      'Master Choa Kok Sui',
      'Played 2 min ago · 34 mins',
      AppColors.accentPink,
      'assets/profile/Energy Glow Art.png',
    ),
    _MeditationHistoryData(
      'On Nanah Shivaya Chanting',
      'Sacred Resonance Mantra',
      'Yesterday · 18 mins',
      AppColors.accentOrange,
      'assets/profile/Mandala Icon Art.png',
    ),
    _MeditationHistoryData(
      'Aura Cleansing Affirmation',
      'Chakra Balance Guidance',
      '3 days ago · 15 mins',
      AppColors.primary,
      'assets/profile/Sacred Om Sound Art.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('RECENT MEDITATIONS', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary, letterSpacing: 0.5)),
            Text('3 Spiritual Sessions', style: TextStyle(fontSize: 10.sp, color: AppColors.primary, fontWeight: FontWeight.w500)),
          ],
        ),
        SizedBox(height: 12.h),
        ...List.generate(_items.length, (index) {
          final item = _items[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index == _items.length - 1 ? 0 : 10.h),
            child: _MeditationHistoryTile(data: item),
          );
        }),
      ],
    );
  }
}

class _MeditationHistoryTile extends StatelessWidget {
  final _MeditationHistoryData data;
  const _MeditationHistoryTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                data.imagePath,
                width: 40.w,
                height: 40.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title, style: TextStyle(fontSize: 12.5.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                SizedBox(height: 2.h),
                Text(data.subtitle, style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary)),
                SizedBox(height: 2.h),
                Text(data.meta, style: TextStyle(fontSize: 9.sp, color: AppColors.textMuted)),
              ],
            ),
          ),
          Container(
            width: 30.w,
            height: 30.w,
            decoration: BoxDecoration(color: data.color, shape: BoxShape.circle),
            child: Icon(Icons.play_arrow, color: Colors.white, size: 16.sp),
          ),
        ],
      ),
    );
  }
}

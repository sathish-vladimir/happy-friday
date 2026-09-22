import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class _PlayList {
  final String title;
  final String subtitle;
  final String meta;
  final String tag;
  final Color color;
  final String imagePath;

  const _PlayList(
      this.title,
      this.subtitle,
      this.meta,
      this.tag,
      this.color,
      this.imagePath,
      );
}

class PlayListSection extends StatelessWidget {
  const PlayListSection({super.key});

  static const _items = [
    _PlayList(
      'Daily Twin Hearts Routine',
      'Physical Exercises, Meditation & Blessings',
      '· 48 Mins',
      'Morning',
      AppColors.accentPink,
      'assets/playlist/list1.png',
    ),
    _PlayList(
      'Evening Aura Cleansing & OM',
      '108 OM Chants with Tibetan Singing Bowls',
      '5 Tracks · 1h 40 Mins',
      'Dusk',
      AppColors.primary,
      'assets/playlist/list2.png',
    ),
    _PlayList(
      'Arhatic Dhyan & Kundalini',
      'Spiritual Cord Affirmation & Blue Pearl',
      '4 Tracks · 45 Mins',
      'Advanced',
      AppColors.primary,
      'assets/playlist/list3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(_items.length, (index) {
          final item = _items[index];
          return Padding(
            padding: EdgeInsets.only(bottom: index == _items.length - 1 ? 0 : 12.h),
            child: _RecommendedAlbumCard(data: item),
          );
        }),
      ],
    );
  }
}

class _RecommendedAlbumCard extends StatelessWidget {
  final _PlayList data;
  const _RecommendedAlbumCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                data.imagePath,
                width: 54.w,
                height: 54.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        data.tag,
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      data.meta,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(data.title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                SizedBox(height: 2.h),
                Text(data.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary)),


              ],
            ),
          ),
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
                color: AppColors.background, shape: BoxShape.circle),
            child: Icon(Icons.play_arrow, size: 20.sp, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

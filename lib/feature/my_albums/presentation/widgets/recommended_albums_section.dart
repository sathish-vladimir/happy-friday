import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class _AlbumData {
  final String title;
  final String author;
  final String meta;
  final String tag;
  final Color color;
  final String imagePath;

  const _AlbumData(
      this.title,
      this.author,
      this.meta,
      this.tag,
      this.color,
      this.imagePath,
      );
}

class RecommendedAlbumsSection extends StatelessWidget {
  const RecommendedAlbumsSection({super.key});

  static const _items = [
    _AlbumData(
      'Meditation on Twin Hearts',
      'Grand Master Choa Kok Sui',
      '2 Tracks · 28 Mins',
      'Illumination',
      AppColors.accentPink,
      'assets/myalbum/fav_album_list.png',
    ),
    _AlbumData(
      'Meditation on the Soul',
      'Achieving Oneness with Higher Soul',
      '3 Tracks · 45 Mins',
      'Chakra Energy',
      AppColors.primary,
      'assets/myalbum/view_album_list.png',
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
            Text(
              'RECOMMENDED FOR YOUR PRACTICE',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary, letterSpacing: 0.5),
            ),
            Text('View All', style: TextStyle(fontSize: 11.sp, color: AppColors.primary, fontWeight: FontWeight.w500)),
          ],
        ),
        SizedBox(height: 2.h),
        Text('Pranic healing foundational essentials', style: TextStyle(fontSize: 11.sp, color: Color(0xFF787586))),
        SizedBox(height: 14.h),
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
  final _AlbumData data;
  const _RecommendedAlbumCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                width: 44.w,
                height: 44.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                SizedBox(height: 2.h),
                Text(data.author, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10.sp, color: AppColors.textSecondary)),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.music_note, size: 12.sp, color: AppColors.primary),
                    SizedBox(width: 4.w),
                    Text(data.meta, style: TextStyle(fontSize: 10.sp, color: AppColors.textMuted)),
                    SizedBox(width: 8.w),
                    Text(data.tag, style: TextStyle(fontSize: 10.sp, color: AppColors.primary, fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 38.w,
            height: 38.w,
            decoration: BoxDecoration(
                color: AppColors.background, shape: BoxShape.circle,
              border: Border.all(width: 1.w,color: Colors.grey)
            ),
            child: Icon(Icons.add, size: 20.sp, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class _MeditationData {
  final String title;
  final String author;
  final String duration;
  final Color color;
  final String imagePath;

  const _MeditationData(
      this.title,
      this.author,
      this.duration,
      this.color,
      this.imagePath,
      );
}

class PopularMeditationsSection extends StatelessWidget {
  const PopularMeditationsSection({super.key});

  static const _items = [
    _MeditationData(
      'Meditation on Twin Hearts',
      'Master Choa Kok Sui',
      '29 min',
      AppColors.accentPink,
      'assets/home/twin.png',
    ),
    _MeditationData(
      'शांति एवं प्रकाश के लिए\nHindi Meditation',
      'Master Choa Kok Sui',
      '24 min',
      AppColors.primary,
      'assets/home/hindi meditation.png',
    ),
    _MeditationData(
      'On Nanah Shivaya',
      'Sacred Resonance',
      '18 min',
      AppColors.accentOrange,
      'assets/home/twin.png',
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
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: const Color(0xFFEC4899),
                  size: 18.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  'POPULAR MEDITATIONS',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.home_title_album,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
            Text(
              'See All',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        SizedBox(height: 4.h),

        Text(
          'Most popular global collective sessions',
          style: TextStyle(
            fontSize: 11.sp,
            color: const Color(0xFF64748B),
          ),
        ),

        SizedBox(height: 12.h),

        SizedBox(
          height: 216.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _items.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              return _MeditationCard(
                data: _items[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MeditationCard extends StatelessWidget {
  final _MeditationData data;

  const _MeditationCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Local image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              data.imagePath,
              width: double.infinity,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 7.h),

          Text(
            data.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: 3.h),

          Text(
            data.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.textSecondary,
            ),
          ),

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: data.color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  data.duration,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: data.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                width: 24.w,
                height: 24.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0F172A)
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../../data/model/meditation_model.dart';

class PopularMeditationsSection extends StatelessWidget {
  final List<MeditationModel> items;
  final ValueChanged<MeditationModel> onTapItem;

  const PopularMeditationsSection({
    super.key,
    required this.items,
    required this.onTapItem,
  });

  Color _colorFor(String tag) {
    switch (tag) {
      case 'pink':
        return AppColors.accentPink;
      case 'orange':
        return AppColors.accentOrange;
      default:
        return AppColors.primary;
    }
  }

  String _imageFor(int index) {
    switch (index) {
      case 0:
        return 'assets/home/twin.png';
      case 1:
        return 'assets/home/hindi meditation.png';
      case 2:
        return 'assets/home/twin.png';
      default:
        return 'assets/home/twin.png';
    }
  }

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
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final item = items[index];

              return GestureDetector(
                onTap: () => onTapItem(item),
                child: _MeditationCard(
                  item: item,
                  color: _colorFor(item.colorTag),
                  imagePath: _imageFor(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MeditationCard extends StatelessWidget {
  final MeditationModel item;
  final Color color;
  final String imagePath;

  const _MeditationCard({
    required this.item,
    required this.color,
    required this.imagePath,
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
          /// Meditation image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 100.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 7.h),

          /// Title
          Text(
            item.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: 3.h),

          /// Author
          Text(
            item.author,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.textSecondary,
            ),
          ),

          const Spacer(),

          /// Duration + Play
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  item.durationLabel,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              GestureDetector(
              //  onTap: () => onTapItem(item),
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0F172A),
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../../data/model/featured_album_model.dart';

class FeaturedAlbumCard extends StatelessWidget {
  final FeaturedAlbumModel album;
  final VoidCallback onPlay;

  const FeaturedAlbumCard({super.key, required this.album, required this.onPlay});

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
                Image.asset(
                  "assets/home/Symbol.png",
                  width: 14.w,
                  height: 14.h,
                ),
                SizedBox(width: 6.w),
                Text(
                  'FEATURED ALBUM',
                  style: TextStyle(
                    color: AppColors.home_title_album,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
            Text(
              'View Liner Notes',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        SizedBox(height: 12.h),

        Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/home/album1.png",
                width: 100.w,
                height: 100.h,
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
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            "Audio • 108 Repetitions",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        SizedBox(width: 6.w),

                        Text(
                          "432 Hz",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      album.title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      album.artist,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Text(
                      album.description,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF475569),
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 5.h),

                    Divider(
                      height: 8.h,
                      color: const Color(0xFFF1F5F9),
                    ),

                    SizedBox(height: 4.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          album.durationLabel,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(width: 20.w),

                        ElevatedButton.icon(
                          onPressed: onPlay,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 8.h,
                            ),
                          ),
                          icon: Icon(
                            Icons.play_arrow,
                            size: 16.sp,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Play Now',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

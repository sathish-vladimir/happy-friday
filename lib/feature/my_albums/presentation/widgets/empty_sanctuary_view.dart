import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class EmptySanctuaryView extends StatelessWidget {
  const EmptySanctuaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/myalbum/my_album_empty.png",
          height: 200.h,
          width: 200.w,
        ),
        Text(
          'Your Sanctuary is Empty',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "You haven't added any Master Choa Kok Sui meditation albums to your sacred library yet.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: Color(0xFF474554), height: 1.4,fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 18.h),
        Container(
          width: 210.w,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF6D28D9),
                Color(0xFF8146EF),
              ],
            ),
            borderRadius: BorderRadius.circular(26.r),
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 12.h,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EXPLORE DISCOGRAPHY',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

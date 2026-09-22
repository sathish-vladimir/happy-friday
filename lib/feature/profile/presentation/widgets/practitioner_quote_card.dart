import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class PractitionerQuoteCard extends StatelessWidget {
  const PractitionerQuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F2FB),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 1.w,
          color: AppColors.textMuted,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/profile/star.png",
            width: 39.w,
            height: 39.h,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              '"When you do Meditation on Twin Hearts, divine energy '
                  'flows into you, blessing the entire earth."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontStyle: FontStyle.italic,
                color: Color(0xFF4E2A6A),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

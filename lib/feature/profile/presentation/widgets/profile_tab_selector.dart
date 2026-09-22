import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class ProfileTabSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const ProfileTabSelector({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  static const _labels = [
    'Recently Played',
    'Favorites',
    'Downloads',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: List.generate(
          _labels.length,
              (index) {
            final selected = index == selectedIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () => onSelected(index),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 6.w,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: selected
                        ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.20),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ]
                        : [],
                  ),
                  child: Text(
                    _labels[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
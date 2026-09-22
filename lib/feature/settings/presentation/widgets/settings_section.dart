import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class SettingsTileData {
  final String imagePath;
  final String title;
  final String? subtitle;
  final bool isDestructive;
  final VoidCallback? onTap;

  const SettingsTileData(
      this.imagePath,
      this.title,
      this.subtitle, {
        this.isDestructive = false,
        this.onTap,
      });
}

class SettingsSection extends StatelessWidget {
  final String? title;
  final List<SettingsTileData> tiles;

  const SettingsSection({
    super.key,
    this.title,
    required this.tiles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        if (title != null) ...[
          Text(
            title!,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
              letterSpacing: 0.6,
            ),
          ),
          SizedBox(height: 10.h),
        ],
        Container(
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Column(
              children: List.generate(
                tiles.length,
                    (index) {
                  return Column(
                    children: [
                      _SettingsTile(data: tiles[index]),
                      if (index != tiles.length - 1)
                        Divider(
                          height: 1,
                          indent: 16.w,
                          endIndent: 16.w,
                          color: AppColors.background,
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final SettingsTileData data;

  const _SettingsTile({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: data.onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 12.h,
          ),
          child: Row(
            children: [
              Image.asset(
                data.imagePath,
                width: 30.w,
                height: 30.h,
                fit: BoxFit.contain,
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 12.5.sp,
                        fontWeight: FontWeight.w600,
                        color: data.isDestructive
                            ? Colors.redAccent
                            : AppColors.textPrimary,
                      ),
                    ),
                    if (data.subtitle != null) ...[
                      SizedBox(height: 2.h),
                      Text(
                        data.subtitle!,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              Icon(
                Icons.chevron_right,
                size: 18.sp,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

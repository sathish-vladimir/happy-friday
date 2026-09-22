import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class SettingsFooter extends StatelessWidget {
  const SettingsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Pranic Healing Sounds v5.4.2 (2026)', style: TextStyle(fontSize: 9.sp, color: AppColors.textMuted)),
        SizedBox(height: 2.h),
        Text('Namo Guru, Om Shanti and Love', style: TextStyle(fontSize: 9.sp, color: AppColors.textMuted, fontStyle: FontStyle.italic)),
      ],
    );
  }
}

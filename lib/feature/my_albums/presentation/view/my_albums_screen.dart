import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../widgets/album_filter_chips.dart';
import '../widgets/empty_sanctuary_view.dart';
import '../widgets/recommended_albums_section.dart';

class MyAlbumsScreen extends StatefulWidget {
  const MyAlbumsScreen({super.key});

  @override
  State<MyAlbumsScreen> createState() => _MyAlbumsScreenState();
}

class _MyAlbumsScreenState extends State<MyAlbumsScreen> {
  int _selectedFilter = 0;

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFAF7FD),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Albums',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                ),
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: Icon(Icons.history, size: 18.sp, color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: Color(0xFFC8C4D799),
                ),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.textMuted, size: 18.sp),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 12.sp, color: AppColors.textPrimary),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        hintText: 'Search chants, mantras, sutras...',
                        hintStyle: TextStyle(fontSize: 11.sp, color: AppColors.textMuted),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            AlbumFilterChips(
              selectedIndex: _selectedFilter,
              onSelected: (index) => setState(() => _selectedFilter = index),
            ),
            const EmptySanctuaryView(),
            SizedBox(height: 30.h),
            const RecommendedAlbumsSection(),
          ],
        ),
      ),
    );
  }
}

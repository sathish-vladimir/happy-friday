import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../widgets/album_filter_chips.dart';
import '../widgets/recommended_albums_section.dart';

class PlayList extends StatefulWidget {
  const PlayList({super.key});

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
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
                  'Playlists',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
                ),
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: Icon(Icons.search, size: 18.sp, color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            PlayListFilterChips(
              selectedIndex: _selectedFilter,
              onSelected: (index) => setState(() => _selectedFilter = index),
            ),
            SizedBox(height: 16.h),
              Container(
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
                Image.asset(
                  'assets/playlist/add.png',
                  width: 70.w,
                  height: 70.h,
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Create Sacred Playlist',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Curate your daily sadhana, Twin Hearts, or meditation sessions.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xFFB499D8),
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 2.w),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(
                    minWidth: 32.w,
                    minHeight: 32.w,
                  ),
                  icon: Icon(
                    Icons.skip_next_outlined,
                    color: Colors.white,
                    size: 24.sp,
                  ), onPressed: () {  },
                ),
              ],
            ),
              ),
            SizedBox(height: 16.h),
            const PlayListSection(),
          ],
        ),
      ),
    );
  }
}

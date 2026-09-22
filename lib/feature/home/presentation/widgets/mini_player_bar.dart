import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class MiniPlayerBar extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isPlaying;
  final VoidCallback? onPlayPause;

  const MiniPlayerBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isPlaying,
    this.onPlayPause,
  });

  @override
  State<MiniPlayerBar> createState() => _MiniPlayerBarState();
}

class _MiniPlayerBarState extends State<MiniPlayerBar> {
  late bool _isPlaying;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.isPlaying;
  }

  @override
  void didUpdateWidget(covariant MiniPlayerBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isPlaying != widget.isPlaying) {
      _isPlaying = widget.isPlaying;
    }
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });

    widget.onPlayPause?.call();
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF262D3F),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Album / Play Image
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              'assets/home/play_img.png',
              width: 25.w,
              height: 25.h,
            ),
          ),

          SizedBox(width: 10.w),

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFFB499D8),
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),

          // Favorite
          IconButton(
            onPressed: _toggleFavorite,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: 32.w,
              minHeight: 32.w,
            ),
            icon: Icon(
              _isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: _isFavorite
                  ? const Color(0xFFEC4899)
                  : Colors.white,
              size: 20.sp,
            ),
          ),

          SizedBox(width: 2.w),

          // Play / Pause
          GestureDetector(
            onTap: _togglePlayPause,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                color: AppColors.primaryDark,
                size: 18.sp,
              ),
            ),
          ),

          // Next button
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: 32.w,
              minHeight: 32.w,
            ),
            icon: Icon(
              Icons.skip_next_outlined,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
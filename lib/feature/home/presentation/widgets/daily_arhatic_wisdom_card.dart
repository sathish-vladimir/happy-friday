import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';

class DailyArhaticWisdomCard extends StatefulWidget {
  const DailyArhaticWisdomCard({super.key});

  @override
  State<DailyArhaticWisdomCard> createState() => _DailyArhaticWisdomCardState();
}

class _DailyArhaticWisdomCardState extends State<DailyArhaticWisdomCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _wisdomCards = [
    {
      'title': 'DAILY ARHATIC WISDOM',
      'quote':
      'Arhatic Yoga consists of yogic techniques designed to help us develop spiritually. It is prehistoric in origin.',
      'author': 'Master Choa Kok Sui',
      'action': 'Deep Contemplation',
    },
    {
      'title': 'TODAY\'S REFLECTION',
      'quote':
      'When the mind becomes calm, the heart becomes peaceful and inner wisdom becomes clearer.',
      'author': 'Master Choa Kok Sui',
      'action': 'Reflect Within',
    },
    {
      'title': 'SPIRITUAL INSIGHT',
      'quote':
      'Practice with consistency, sincerity and devotion. Small steps can create profound transformation.',
      'author': 'Master Choa Kok Sui',
      'action': 'Explore More',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _wisdomCards.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final card = _wisdomCards[index];

              return _WisdomCard(
                title: card['title']!,
                quote: card['quote']!,
                author: card['author']!,
                action: card['action']!,
              );
            },
          ),
        ),

        SizedBox(height: 12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _wisdomCards.length,
                (index) {
              final isActive = _currentPage == index;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: isActive ? 20.w : 7.w,
                height: 7.w,
                decoration: BoxDecoration(
                  gradient: isActive
                      ? const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF6D28D9),
                      Color(0xFFDB2777),
                    ],
                  )
                      : null,
                  color: isActive ? null : AppColors.border,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _WisdomCard extends StatelessWidget {
  final String title;
  final String quote;
  final String author;
  final String action;

  const _WisdomCard({
    required this.title,
    required this.quote,
    required this.author,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.wisdomGradientStart,
            AppColors.wisdomGradientEnd,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: Colors.yellow,
                size: 16.sp,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 2.h,
                  ),
                  child: Text(
                    'Sutra 108',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 14.h),

          Expanded(
            child: Text(
              '"$quote"',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                height: 1.5,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: 3.h),
          Divider(
            height: 1.5.h,
            color: Colors.grey.withOpacity(0.5),
          ),



          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '- $author',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 12.sp,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Spacer(),
              Text(
                action,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.arrow_forward,
                color: AppColors.primaryLight,
                size: 14.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

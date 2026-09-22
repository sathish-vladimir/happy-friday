import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_extension.dart';
import '../../../../core/services/audio_player_service.dart';
import '../../data/model/meditation_model.dart';
import '../view_model/home_view_model.dart';
import '../widgets/daily_arhatic_wisdom_card.dart';
import '../widgets/featured_album_card.dart';
import '../widgets/popular_meditations_section.dart';
import '../widgets/mini_player_bar.dart';

final currentlyPlayingProvider =
StateProvider<MeditationModel?>((ref) => null);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppResponsive.init(context);

    final homeState = ref.watch(homeViewModelProvider);
    final nowPlaying = ref.watch(currentlyPlayingProvider);
    final audioService = ref.read(audioPlayerServiceProvider);

    void play(MeditationModel item) {
      audioService.playUrl(item.audioUrl);

      ref.read(currentlyPlayingProvider.notifier).state = item;
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.5,
              1.0,
            ],
            colors: [
              Color(0xFFF4EAFD),
              Color(0xFFFEF5F6),
              Color(0xFFF5F4FB),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// MAIN CONTENT
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    16.w,
                    16.h,
                    16.w,
                    12.h,
                  ),
                  children: [
                    /// HEADER
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Happy ',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) {
                                      return const LinearGradient(
                                        colors: [
                                          Color(0xFF6D28D9),
                                          Color(0xFF9333EA),
                                          Color(0xFFDB2777),
                                        ],
                                      ).createShader(
                                        Rect.fromLTWH(
                                          0,
                                          0,
                                          bounds.width,
                                          bounds.height,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Friday',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 4.h),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Harmonize the throat & crown chakras today',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.textsecondary,
                                      ),
                                    ),
                                  ),

                                  SizedBox(width: 10.w),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(20.r),
                                      border: Border.all(
                                        width: 2.w,
                                        color: AppColors.border,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 6.w,
                                          height: 6.w,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        Text(
                                          'Live Stream',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    /// SEARCH
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textPrimary,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                ),
                                hintText:
                                'Search mantras, Twin Hearts, affirmations',
                                hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ),
                          ),

                          Image.asset(
                            "assets/home/Container.png",
                            width: 25.w,
                            height: 25.h,
                          ),

                          SizedBox(width: 8.w),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    /// FIREBASE / API CONTENT
                    homeState.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),

                      error: (err, _) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 40.h,
                        ),
                        child: Center(
                          child: Text(
                            'Could not load your sanctuary right now.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ),

                      data: (state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const DailyArhaticWisdomCard(),

                            SizedBox(height: 22.h),

                            if (state.featuredAlbum != null)
                              FeaturedAlbumCard(
                                album: state.featuredAlbum!,
                                onPlay: () {
                                  play(
                                    MeditationModel(
                                      id: state.featuredAlbum!.id,
                                      title: state.featuredAlbum!.title,
                                      author: state.featuredAlbum!.artist,
                                      durationLabel:
                                      state.featuredAlbum!.durationLabel,
                                      audioUrl:
                                      state.featuredAlbum!.audioUrl,
                                      colorTag: 'primary',
                                    ),
                                  );
                                },
                              ),

                            SizedBox(height: 22.h),

                            /// POPULAR MEDITATIONS
                            if (state.meditations.isEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                ),
                                child: Text(
                                  'No meditations available yet.',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              )
                            else
                              PopularMeditationsSection(
                                items: state.meditations,
                                onTapItem: play,
                              ),
                          ],
                        );
                      },
                    ),

                    /// Bottom spacing for mini player
                    if (nowPlaying != null)
                      SizedBox(height: 70.h),
                  ],
                ),
              ),

              /// MINI PLAYER
              if (nowPlaying != null)
                StreamBuilder<bool>(
                  stream: audioService.isPlayingStream,
                  builder: (context, snapshot) {
                    final isPlaying = snapshot.data ?? false;

                    return MiniPlayerBar(
                      title: nowPlaying.title,
                      subtitle: nowPlaying.author,
                      isPlaying: isPlaying,
                      onPlayPause: () {
                        if (isPlaying) {
                          audioService.pause();
                        } else {
                          audioService.resume();
                        }
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
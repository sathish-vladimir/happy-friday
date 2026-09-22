import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/featured_album_model.dart';
import '../../data/model/meditation_model.dart';
import '../../home_dependency_injection.dart';

class HomeState {
  final FeaturedAlbumModel? featuredAlbum;
  final List<MeditationModel> meditations;

  const HomeState({this.featuredAlbum, this.meditations = const []});
}

class HomeViewModel extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() => _load();

  Future<HomeState> _load() async {
    final repo = ref.read(homeRepositoryProvider);
    final album = await repo.getFeaturedAlbum();
    final meditations = await repo.getPopularMeditations();
    return HomeState(featuredAlbum: album, meditations: meditations);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_load);
  }
}

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, HomeState>(HomeViewModel.new);

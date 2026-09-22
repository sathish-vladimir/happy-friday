import '../model/featured_album_model.dart';
import '../model/meditation_model.dart';
import '../source/home_remote_source.dart';
import '../source/home_local_source.dart';

class HomeRepository {
  final HomeRemoteSource _remote;
  final HomeLocalSource _local;

  HomeRepository(this._remote, this._local);

  Future<FeaturedAlbumModel?> getFeaturedAlbum() async {
    try {
      final album = await _remote.getFeaturedAlbum();
      if (album != null) await _local.cacheFeaturedAlbum(album);
      return album;
    } catch (_) {
      return _local.getFeaturedAlbum();
    }
  }

  Future<List<MeditationModel>> getPopularMeditations() async {
    try {
      final items = await _remote.getPopularMeditations();
      if (items.isNotEmpty) await _local.cachePopularMeditations(items);
      return items;
    } catch (_) {
      return _local.getPopularMeditations();
    }
  }
}

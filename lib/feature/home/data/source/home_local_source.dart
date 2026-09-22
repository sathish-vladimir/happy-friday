import 'package:sqflite/sqflite.dart';
import '../../../../core/database/app_database.dart';
import '../model/featured_album_model.dart';
import '../model/meditation_model.dart';

class HomeLocalSource {
  Future<Database> get _db async => AppDatabase.instance.database;

  Future<void> cacheFeaturedAlbum(FeaturedAlbumModel album) async {
    final db = await _db;
    await db.insert('featured_album', album.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<FeaturedAlbumModel?> getFeaturedAlbum() async {
    final db = await _db;
    final rows = await db.query('featured_album', limit: 1);
    if (rows.isEmpty) return null;
    return FeaturedAlbumModel.fromMap(rows.first);
  }

  Future<void> cachePopularMeditations(List<MeditationModel> items) async {
    final db = await _db;
    final batch = db.batch();
    batch.delete('popular_meditations');
    for (final item in items) {
      batch.insert('popular_meditations', item.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<MeditationModel>> getPopularMeditations() async {
    final db = await _db;
    final rows = await db.query('popular_meditations');
    return rows.map((row) => MeditationModel.fromMap(row)).toList();
  }
}

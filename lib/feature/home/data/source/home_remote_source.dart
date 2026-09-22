import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/featured_album_model.dart';
import '../model/meditation_model.dart';

class HomeRemoteSource {
  final FirebaseFirestore _firestore;

  HomeRemoteSource(this._firestore);

  Future<FeaturedAlbumModel?> getFeaturedAlbum() async {
    final snapshot = await _firestore.collection('featured_album').limit(1).get();
    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    return FeaturedAlbumModel.fromFirestore(doc.id, doc.data());
  }

  Future<List<MeditationModel>> getPopularMeditations() async {
    final snapshot = await _firestore.collection('popular_meditations').get();
    return snapshot.docs.map((doc) => MeditationModel.fromFirestore(doc.id, doc.data())).toList();
  }
}

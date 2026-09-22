class FeaturedAlbumModel {
  final String id;
  final String title;
  final String artist;
  final String description;
  final String audioUrl;
  final String durationLabel;
  final String repetitionsLabel;

  const FeaturedAlbumModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.description,
    required this.audioUrl,
    required this.durationLabel,
    required this.repetitionsLabel,
  });

  factory FeaturedAlbumModel.fromFirestore(String id, Map<String, dynamic> data) {
    return FeaturedAlbumModel(
      id: id,
      title: data['title'] ?? '',
      artist: data['artist'] ?? '',
      description: data['description'] ?? '',
      audioUrl: data['audioUrl'] ?? '',
      durationLabel: data['durationLabel'] ?? '',
      repetitionsLabel: data['repetitionsLabel'] ?? '',
    );
  }

  factory FeaturedAlbumModel.fromMap(Map<String, dynamic> map) {
    return FeaturedAlbumModel(
      id: map['id'],
      title: map['title'],
      artist: map['artist'],
      description: map['description'],
      audioUrl: map['audioUrl'],
      durationLabel: map['durationLabel'],
      repetitionsLabel: map['repetitionsLabel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'description': description,
      'audioUrl': audioUrl,
      'durationLabel': durationLabel,
      'repetitionsLabel': repetitionsLabel,
    };
  }
}

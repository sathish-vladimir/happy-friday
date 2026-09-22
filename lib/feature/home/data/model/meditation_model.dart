class MeditationModel {
  final String id;
  final String title;
  final String author;
  final String durationLabel;
  final String audioUrl;
  final String colorTag;

  const MeditationModel({
    required this.id,
    required this.title,
    required this.author,
    required this.durationLabel,
    required this.audioUrl,
    required this.colorTag,
  });

  factory MeditationModel.fromFirestore(String id, Map<String, dynamic> data) {
    return MeditationModel(
      id: id,
      title: data['title'] ?? '',
      author: data['author'] ?? '',
      durationLabel: data['durationLabel'] ?? '',
      audioUrl: data['audioUrl'] ?? '',
      colorTag: data['colorTag'] ?? 'primary',
    );
  }

  factory MeditationModel.fromMap(Map<String, dynamic> map) {
    return MeditationModel(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      durationLabel: map['durationLabel'],
      audioUrl: map['audioUrl'],
      colorTag: map['colorTag'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'durationLabel': durationLabel,
      'audioUrl': audioUrl,
      'colorTag': colorTag,
    };
  }
}

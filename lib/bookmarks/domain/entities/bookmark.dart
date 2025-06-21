class Bookmark {
  const Bookmark({
    required this.id,
    required this.word,
    required this.pronunciation,
    required this.definition,
    required this.example,
    required this.wordType,
    required this.difficultyLevel,
    required this.createdAt,
    required this.userId,
  });

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      id: json['id'] as String,
      word: json['word'] as String,
      pronunciation: json['pronunciation'] as String? ?? '',
      definition: json['definition'] as String,
      example: json['example'] as String? ?? '',
      wordType: json['wordType'] as String? ?? '',
      difficultyLevel: json['difficultyLevel'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String,
    );
  }
  final String id;
  final String word;
  final String pronunciation;
  final String definition;
  final String example;
  final String wordType;
  final String difficultyLevel;
  final DateTime createdAt;
  final String userId;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'pronunciation': pronunciation,
      'definition': definition,
      'example': example,
      'wordType': wordType,
      'difficultyLevel': difficultyLevel,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
    };
  }
}

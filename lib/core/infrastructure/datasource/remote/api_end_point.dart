class ApiEndPoint {
  ApiEndPoint._();

  static const String login = 'login';
  static const String scanObjects = '/ai/image-prompt';
  static const String checkSpeaking = '/ai/comparepronunciation';
  static const String chat = '/ai/promptAnswer';
  static const String wordleaning = '/words/questions/random';
  static const String getVocabulary = '/vocabulary';
  static const String getListLessons = '/lessons';
  static const String getLessonDetails = '/lessons/{id}';
}

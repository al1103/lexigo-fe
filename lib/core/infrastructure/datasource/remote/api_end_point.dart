class ApiEndPoint {
  ApiEndPoint._();

  static const String login = '/login';
  static const String scanObjects = '/ai/image-prompt';
  static const String checkSpeaking = '/ai/comparepronunciation';
  static const String chat = '/ai/promptAnswer';
  static const String wordleaning = '/words/questions/random';
  static const String getVocabulary = '/speaking/words';
  static const String getLevelVocabulary = '/speaking/levels';
  static const String getListLessons = '/levels';
  static const String getLessonDetails = '/quiz/start';
  static const String getWordDetails = '/ai/vocabulary';
  static const String submitAnswer = '/quiz/submit-answer';
  static const String bookmark = '/quiz/bookmark';
  static const String bookmarks = '/quiz/bookmarks';

  static const String profile = '/profile';
  static const String uploadAvatar = '/users/upload-avatar';
  // Ranking/Leaderboard endpoints
  static const String globalLeaderboard = '/ranking/leaderboard/global';
  static const String weeklyLeaderboard = '/ranking/leaderboard/weekly';
  static const String monthlyLeaderboard = '/ranking/leaderboard/monthly';
  static const String myAllRankings = '/ranking/my-all-rankings';

  // Quotes endpoints
  static const String dailyQuotes = '/quotes/daily';
  static const String submitSpeakingResult = '/speaking/submit-result';

  static const String grammar = '/grammar';
  static const String grammarCategories = '/grammar/categories';
  static const String grammarPopular = '/grammar/popular';
  static const String grammarSearch = '/grammar/search';
  static const String grammarByCategory = '/grammar/category';
  static const String grammarByDifficulty = '/grammar/difficulty';
}

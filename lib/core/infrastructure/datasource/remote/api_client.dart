import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lexigo/auth/domain/login_response.dart';
import 'package:lexigo/bookmarks/domain/entities/bookmark.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_end_point.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/home/model/quotes_model.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/profile/user_info_model.dart';
import 'package:lexigo/screen/ranking/models/leaderboard_user.dart';
import 'package:lexigo/screen/ranking/models/my_rank.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/scan_objects/models/smart_word_model.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/word_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiEndPoint.login)
  Future<ApiResponse<LoginResponse>> login(
    @Field('email') String email,
    @Field('password') String password,
  );
  @POST(ApiEndPoint.profile)
  Future<ApiResponse<LoginResponse>> updateUserProfile(
    @Field('full_name') String fullName,
    @Field('email') String email,
    @Field('avatar_url') String avatarUrl,
    @Field('username') String username,
  );

  @POST(ApiEndPoint.scanObjects)
  @MultiPart()
  Future<ApiResponse<List<DetectionResult>>> analyzeImage(
    @Part(name: 'image') File image, // Chỉ 1 parameter
  );
  @POST(ApiEndPoint.checkSpeaking)
  @MultiPart()
  Future<ApiResponse<SpeakingResult>> checkSpeaking(
    @Part(name: 'audio') File audioFile, // Match your curl command
    @Part(name: 'reference_text')
    String referenceText, // Use @Part instead of @Field
    @Part(name: 'word_id') String wordId, // Use @Part instead of @Field
  );

  @POST(ApiEndPoint.chat)
  Future<ApiResponse<String>> chatAI(
    @Field('prompt') String message,
    @Field('is_reset') bool? isReset,
  );
  @GET(ApiEndPoint.wordleaning)
  Future<ApiResponse<WordModel>> getRandomWords(
    @Query('limit') int? limit,
  );

  @POST(
    ApiEndPoint.getLessonDetails,
  )
  Future<ApiResponse<PayloadPageableDto<LessonsDetail>>> getLessonDetails(
    @Field('level_id') int id,
    @Field('question_count') int? page,
  );
  @GET(ApiEndPoint.getVocabulary)
  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>>
      getLevelVocabularyDetails(
    @Query('difficulty_level') String level,
    @Query('limit') int? limit,
  );
  @GET(ApiEndPoint.getLevelVocabulary)
  Future<ApiResponse<PayloadPageableDto<LessonsModel>>> getLevelVocabulary();

  @GET(ApiEndPoint.getListLessons)
  Future<ApiResponse<List<LessonsModel>>> getListLessons();
  @POST(ApiEndPoint.getWordDetails)
  Future<ApiResponse<SmartWord>> getWordDetails(
    @Field('word') String word,
  );

  @POST(ApiEndPoint.submitAnswer)
  Future<ApiResponse<void>> submitAnswer(
    @Field('session_id') int sessionId,
    @Field('question_id') int questionId,
    @Field('selected_option_id') int selectedOptionId,
  );

  @POST(ApiEndPoint.bookmark)
  Future<ApiResponse<void>> bookmarkWord(
    @Field('word_id') int wordId,
    @Field('notes') String? notes,
  );
  @GET(ApiEndPoint.bookmarks)
  Future<ApiResponse<PayloadPageableDto<QuizBookmark>>> getBookmark({
    @Query('page') int page = 1,
    @Query('limit') int limit = 10,
    @Query('search') String? search,
  });

  @GET(ApiEndPoint.profile)
  Future<ApiResponse<UserInfoModel>> getUserProfile();

  @GET(ApiEndPoint.globalLeaderboard)
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getGlobalLeaderboard();

  @GET(ApiEndPoint.weeklyLeaderboard)
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getWeeklyLeaderboard();

  @GET(ApiEndPoint.monthlyLeaderboard)
  Future<ApiResponse<PayloadPageableDto<LeaderboardUser>>>
      getMonthlyLeaderboard();

  @GET(ApiEndPoint.myAllRankings)
  Future<ApiResponse<MyRank>> getMyAllRankings();

  @GET(ApiEndPoint.dailyQuotes)
  Future<ApiResponse<QuotesModel>> getDailyQuotes();

  @POST(ApiEndPoint.submitSpeakingResult)
  Future<ApiResponse<void>> submitSpeakingResult();
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_end_point.dart';
import 'package:lexigo/core/infrastructure/datasource/remote/api_response.dart';
import 'package:lexigo/product/domain/vocabulary_model.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';
import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/word_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

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
  );

  @POST(ApiEndPoint.chat)
  Future<ApiResponse<String>> chatAI(
    @Field('prompt') String message,
    bool? isReset,
  );
  @GET(ApiEndPoint.wordleaning)
  Future<ApiResponse<WordModel>> getRandomWords(
    @Query('limit') int? limit,
  );

  @GET(ApiEndPoint.getLessonDetails)
  Future<ApiResponse<PayloadPageableDto<LessonsDetail>>> getLessonDetails(
    @Path('id') int id,
  );
  @GET(ApiEndPoint.getVocabulary)
  Future<ApiResponse<PayloadPageableDto<VocabularyModel>>> getVocabulary(
    @Query('search') String? search,
    @Query('page') int? page,
  );

  @GET(ApiEndPoint.getListLessons)
  Future<ApiResponse<List<LessonsModel>>> getListLessons();
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/auth/presentation/pages/sign_in_page.dart';
import 'package:lexigo/auth/presentation/pages/sign_up_page.dart';
import 'package:lexigo/bookmarks/presentation/pages/bookmarks_page.dart';
import 'package:lexigo/common/routes/route_path.dart';
import 'package:lexigo/quiz/presentation/pages/quiz_result_page.dart';
import 'package:lexigo/review/presentation/pages/review_page.dart';
import 'package:lexigo/screen/chat/chat_screen.dart';
import 'package:lexigo/screen/history/history_screen.dart';
import 'package:lexigo/screen/home/home_screen.dart';
import 'package:lexigo/screen/lesson_detail_screen.dart';
import 'package:lexigo/screen/level_selection/level_selection_screen.dart';
import 'package:lexigo/screen/main_wrapper_screen.dart';
import 'package:lexigo/screen/profile/edit_profile_screen.dart';
import 'package:lexigo/screen/profile/profile_screen.dart';
import 'package:lexigo/screen/progress_screen.dart';
import 'package:lexigo/screen/ranking/ranking_screen.dart';
import 'package:lexigo/screen/register_screen.dart';
import 'package:lexigo/screen/scan_objects/screens/camera_screen.dart';
import 'package:lexigo/screen/scan_objects/screens/word_detail_screen.dart';
import 'package:lexigo/screen/speaking/model/speaking_result.dart';
import 'package:lexigo/screen/speaking/speaking_level_selection_screen.dart';
import 'package:lexigo/screen/speaking/speaking_result_screen.dart';
import 'package:lexigo/screen/speaking/speaking_screen.dart';
import 'package:lexigo/screen/vocabulary_screen.dart';
import 'package:lexigo/screen/word_learning/learn_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: SignInRoute.page,
        path: RoutePath.splash,
      ),
      AutoRoute(
        page: SignUpRoute.page,
        path: RoutePath.signUp,
      ),
      AutoRoute(
        page: RegisterRoute.page,
        path: '/register',
      ),
      AutoRoute(
        page: HomeRoute.page,
        path: '/home',
      ),
      AutoRoute(
        page: HistoryRoute.page,
        path: '/history',
      ),
      AutoRoute(
        page: RankingRoute.page,
        path: '/ranking',
      ),
      AutoRoute(
        page: ProfileRoute.page,
        path: '/profile',
      ),
      AutoRoute(
        page: ChatRoute.page,
        path: '/chat',
      ),
      AutoRoute(
        page: WordLearningRoute.page,
        path: '/wordLearning',
      ),
      AutoRoute(
        page: SpeakingResultRoute.page,
        path: '/speakingResult',
      ),
      AutoRoute(
        page: SpeakingRoute.page,
        path: '/speaking',
      ),
      AutoRoute(
        page: LevelSelectionRoute.page,
        path: '/levelSelection',
      ),
      AutoRoute(
        path: '/camera',
        page: CameraRoute.page,
      ),
      AutoRoute(
        page: QuizResultRoute.page,
        path: '/quiz-result',
      ),
      AutoRoute(
        page: BookmarksRoute.page,
        path: '/bookmarks',
      ),
      AutoRoute(
        page: ReviewRoute.page,
        path: '/review',
      ),
      RedirectRoute(path: '*', redirectTo: '/'),
    ];
  }
}

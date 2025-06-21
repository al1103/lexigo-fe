// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookmarksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarksPage(),
      );
    },
    CameraRoute.name: (routeData) {
      final args = routeData.argsAs<CameraRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CameraScreen(
          camera: args.camera,
          key: args.key,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LessonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LessonDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LessonDetailScreen(
          lessonId: args.lessonId,
          key: args.key,
        ),
      );
    },
    LevelSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LevelSelectionScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    ProgressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProgressScreen(),
      );
    },
    QuizResultRoute.name: (routeData) {
      final args = routeData.argsAs<QuizResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizResultPage(
          results: args.results,
          score: args.score,
          totalQuestions: args.totalQuestions,
          key: args.key,
        ),
      );
    },
    QuizRoute.name: (routeData) {
      final args = routeData.argsAs<QuizRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QuizScreen(
          quizId: args.quizId,
          key: args.key,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    ReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReviewPage(),
      );
    },
    ScanObjectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScanObjectScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    SpeakingResultRoute.name: (routeData) {
      final args = routeData.argsAs<SpeakingResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SpeakingResultScreen(
          speakingResult: args.speakingResult,
          recordingPath: args.recordingPath,
          onContinue: args.onContinue,
          onTryAgain: args.onTryAgain,
          key: args.key,
        ),
      );
    },
    SpeakingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SpeakingScreen(),
      );
    },
    VocabularyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VocabularyScreen(),
      );
    },
    WordLearningRoute.name: (routeData) {
      final args = routeData.argsAs<WordLearningRouteArgs>(
          orElse: () => const WordLearningRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WordLearningScreen(
          levelId: args.levelId,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [BookmarksPage]
class BookmarksRoute extends PageRouteInfo<void> {
  const BookmarksRoute({List<PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CameraScreen]
class CameraRoute extends PageRouteInfo<CameraRouteArgs> {
  CameraRoute({
    required CameraDescription camera,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CameraRoute.name,
          args: CameraRouteArgs(
            camera: camera,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraRoute';

  static const PageInfo<CameraRouteArgs> page = PageInfo<CameraRouteArgs>(name);
}

class CameraRouteArgs {
  const CameraRouteArgs({
    required this.camera,
    this.key,
  });

  final CameraDescription camera;

  final Key? key;

  @override
  String toString() {
    return 'CameraRouteArgs{camera: $camera, key: $key}';
  }
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LessonDetailScreen]
class LessonDetailRoute extends PageRouteInfo<LessonDetailRouteArgs> {
  LessonDetailRoute({
    required int lessonId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LessonDetailRoute.name,
          args: LessonDetailRouteArgs(
            lessonId: lessonId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LessonDetailRoute';

  static const PageInfo<LessonDetailRouteArgs> page =
      PageInfo<LessonDetailRouteArgs>(name);
}

class LessonDetailRouteArgs {
  const LessonDetailRouteArgs({
    required this.lessonId,
    this.key,
  });

  final int lessonId;

  final Key? key;

  @override
  String toString() {
    return 'LessonDetailRouteArgs{lessonId: $lessonId, key: $key}';
  }
}

/// generated route for
/// [LevelSelectionScreen]
class LevelSelectionRoute extends PageRouteInfo<void> {
  const LevelSelectionRoute({List<PageRouteInfo>? children})
      : super(
          LevelSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'LevelSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProgressScreen]
class ProgressRoute extends PageRouteInfo<void> {
  const ProgressRoute({List<PageRouteInfo>? children})
      : super(
          ProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProgressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuizResultPage]
class QuizResultRoute extends PageRouteInfo<QuizResultRouteArgs> {
  QuizResultRoute({
    required List<QuestionResult> results,
    required int score,
    required int totalQuestions,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizResultRoute.name,
          args: QuizResultRouteArgs(
            results: results,
            score: score,
            totalQuestions: totalQuestions,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizResultRoute';

  static const PageInfo<QuizResultRouteArgs> page =
      PageInfo<QuizResultRouteArgs>(name);
}

class QuizResultRouteArgs {
  const QuizResultRouteArgs({
    required this.results,
    required this.score,
    required this.totalQuestions,
    this.key,
  });

  final List<QuestionResult> results;

  final int score;

  final int totalQuestions;

  final Key? key;

  @override
  String toString() {
    return 'QuizResultRouteArgs{results: $results, score: $score, totalQuestions: $totalQuestions, key: $key}';
  }
}

/// generated route for
/// [QuizScreen]
class QuizRoute extends PageRouteInfo<QuizRouteArgs> {
  QuizRoute({
    required int quizId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          QuizRoute.name,
          args: QuizRouteArgs(
            quizId: quizId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'QuizRoute';

  static const PageInfo<QuizRouteArgs> page = PageInfo<QuizRouteArgs>(name);
}

class QuizRouteArgs {
  const QuizRouteArgs({
    required this.quizId,
    this.key,
  });

  final int quizId;

  final Key? key;

  @override
  String toString() {
    return 'QuizRouteArgs{quizId: $quizId, key: $key}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReviewPage]
class ReviewRoute extends PageRouteInfo<void> {
  const ReviewRoute({List<PageRouteInfo>? children})
      : super(
          ReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScanObjectScreen]
class ScanObjectRoute extends PageRouteInfo<void> {
  const ScanObjectRoute({List<PageRouteInfo>? children})
      : super(
          ScanObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanObjectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SpeakingResultScreen]
class SpeakingResultRoute extends PageRouteInfo<SpeakingResultRouteArgs> {
  SpeakingResultRoute({
    required SpeakingResult speakingResult,
    required String recordingPath,
    void Function()? onContinue,
    void Function()? onTryAgain,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SpeakingResultRoute.name,
          args: SpeakingResultRouteArgs(
            speakingResult: speakingResult,
            recordingPath: recordingPath,
            onContinue: onContinue,
            onTryAgain: onTryAgain,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SpeakingResultRoute';

  static const PageInfo<SpeakingResultRouteArgs> page =
      PageInfo<SpeakingResultRouteArgs>(name);
}

class SpeakingResultRouteArgs {
  const SpeakingResultRouteArgs({
    required this.speakingResult,
    required this.recordingPath,
    this.onContinue,
    this.onTryAgain,
    this.key,
  });

  final SpeakingResult speakingResult;

  final String recordingPath;

  final void Function()? onContinue;

  final void Function()? onTryAgain;

  final Key? key;

  @override
  String toString() {
    return 'SpeakingResultRouteArgs{speakingResult: $speakingResult, recordingPath: $recordingPath, onContinue: $onContinue, onTryAgain: $onTryAgain, key: $key}';
  }
}

/// generated route for
/// [SpeakingScreen]
class SpeakingRoute extends PageRouteInfo<void> {
  const SpeakingRoute({List<PageRouteInfo>? children})
      : super(
          SpeakingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpeakingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VocabularyScreen]
class VocabularyRoute extends PageRouteInfo<void> {
  const VocabularyRoute({List<PageRouteInfo>? children})
      : super(
          VocabularyRoute.name,
          initialChildren: children,
        );

  static const String name = 'VocabularyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WordLearningScreen]
class WordLearningRoute extends PageRouteInfo<WordLearningRouteArgs> {
  WordLearningRoute({
    int? levelId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WordLearningRoute.name,
          args: WordLearningRouteArgs(
            levelId: levelId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WordLearningRoute';

  static const PageInfo<WordLearningRouteArgs> page =
      PageInfo<WordLearningRouteArgs>(name);
}

class WordLearningRouteArgs {
  const WordLearningRouteArgs({
    this.levelId,
    this.key,
  });

  final int? levelId;

  final Key? key;

  @override
  String toString() {
    return 'WordLearningRouteArgs{levelId: $levelId, key: $key}';
  }
}

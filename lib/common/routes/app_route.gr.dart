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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CameraScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditProfileScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordPage(),
      );
    },
    GrammarDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GrammarDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GrammarDetailScreen(
          id: args.id,
          key: args.key,
        ),
      );
    },
    GrammarListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GrammarListScreen(),
      );
    },
    HistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HistoryScreen(),
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
    MainWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainWrapperScreen(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpVerificationPage(
          email: args.email,
          key: args.key,
        ),
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
    RankingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RankingScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResetPasswordPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    ReviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReviewPage(),
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
    SpeakingLevelSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SpeakingLevelSelectionScreen(),
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
      final args = routeData.argsAs<SpeakingRouteArgs>(
          orElse: () => const SpeakingRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SpeakingScreen(
          key: args.key,
          levelCode: args.levelCode,
          levelName: args.levelName,
        ),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerificationPage(
          email: args.email,
          key: args.key,
        ),
      );
    },
    VocabularyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VocabularyScreen(),
      );
    },
    WordDetailRoute.name: (routeData) {
      final args = routeData.argsAs<WordDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WordDetailScreen(
          word: args.word,
          key: args.key,
        ),
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
class CameraRoute extends PageRouteInfo<void> {
  const CameraRoute({List<PageRouteInfo>? children})
      : super(
          CameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'CameraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GrammarDetailScreen]
class GrammarDetailRoute extends PageRouteInfo<GrammarDetailRouteArgs> {
  GrammarDetailRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GrammarDetailRoute.name,
          args: GrammarDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GrammarDetailRoute';

  static const PageInfo<GrammarDetailRouteArgs> page =
      PageInfo<GrammarDetailRouteArgs>(name);
}

class GrammarDetailRouteArgs {
  const GrammarDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'GrammarDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [GrammarListScreen]
class GrammarListRoute extends PageRouteInfo<void> {
  const GrammarListRoute({List<PageRouteInfo>? children})
      : super(
          GrammarListRoute.name,
          initialChildren: children,
        );

  static const String name = 'GrammarListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HistoryScreen]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute({List<PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

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
/// [MainWrapperScreen]
class MainWrapperRoute extends PageRouteInfo<void> {
  const MainWrapperRoute({List<PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpVerificationPage]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const PageInfo<OtpVerificationRouteArgs> page =
      PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{email: $email, key: $key}';
  }
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
/// [RankingScreen]
class RankingRoute extends PageRouteInfo<void> {
  const RankingRoute({List<PageRouteInfo>? children})
      : super(
          RankingRoute.name,
          initialChildren: children,
        );

  static const String name = 'RankingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<ResetPasswordRouteArgs> page =
      PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{email: $email, key: $key}';
  }
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
/// [SpeakingLevelSelectionScreen]
class SpeakingLevelSelectionRoute extends PageRouteInfo<void> {
  const SpeakingLevelSelectionRoute({List<PageRouteInfo>? children})
      : super(
          SpeakingLevelSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpeakingLevelSelectionRoute';

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
class SpeakingRoute extends PageRouteInfo<SpeakingRouteArgs> {
  SpeakingRoute({
    Key? key,
    String? levelCode,
    String? levelName,
    List<PageRouteInfo>? children,
  }) : super(
          SpeakingRoute.name,
          args: SpeakingRouteArgs(
            key: key,
            levelCode: levelCode,
            levelName: levelName,
          ),
          initialChildren: children,
        );

  static const String name = 'SpeakingRoute';

  static const PageInfo<SpeakingRouteArgs> page =
      PageInfo<SpeakingRouteArgs>(name);
}

class SpeakingRouteArgs {
  const SpeakingRouteArgs({
    this.key,
    this.levelCode,
    this.levelName,
  });

  final Key? key;

  final String? levelCode;

  final String? levelName;

  @override
  String toString() {
    return 'SpeakingRouteArgs{key: $key, levelCode: $levelCode, levelName: $levelName}';
  }
}

/// generated route for
/// [VerificationPage]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const PageInfo<VerificationRouteArgs> page =
      PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'VerificationRouteArgs{email: $email, key: $key}';
  }
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
/// [WordDetailScreen]
class WordDetailRoute extends PageRouteInfo<WordDetailRouteArgs> {
  WordDetailRoute({
    required String word,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WordDetailRoute.name,
          args: WordDetailRouteArgs(
            word: word,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WordDetailRoute';

  static const PageInfo<WordDetailRouteArgs> page =
      PageInfo<WordDetailRouteArgs>(name);
}

class WordDetailRouteArgs {
  const WordDetailRouteArgs({
    required this.word,
    this.key,
  });

  final String word;

  final Key? key;

  @override
  String toString() {
    return 'WordDetailRouteArgs{word: $word, key: $key}';
  }
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

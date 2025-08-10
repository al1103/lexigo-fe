// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signIn => 'Sign In';

  @override
  String get signUpAppBarTitle => 'Sign Up';

  @override
  String get signUpButtonText => 'Sign Up';

  @override
  String get bottomNavLearn => 'Learn';

  @override
  String get bottomNavPractice => 'Practice';

  @override
  String get bottomNavStories => 'Stories';

  @override
  String get bottomNavProfile => 'Profile';

  @override
  String get progressYourLevel => 'Your Level';

  @override
  String get progressIntermediateLearner => 'Intermediate Learner';

  @override
  String progressNextLevel(Object points) {
    return 'Next level: $points more points needed';
  }

  @override
  String progressPoints(Object points) {
    return '$points Points';
  }

  @override
  String get progressLessons => 'LessonsModel';

  @override
  String get progressVocabulary => 'Vocabulary';

  @override
  String get progressStreak => 'Streak';

  @override
  String get progressStudyTime => 'Study Time';

  @override
  String get vocabularyQuizzes => 'Quizzes';

  @override
  String get vocabularyGuest => '#Guest';

  @override
  String get vocabularyUserBi => 'Bi';

  @override
  String get vocabularyJapaneseQuestion => '彼は社内の情報___から得た情報をわざと漏洩した。';

  @override
  String get vocabularyAnswerOption1 => '視';

  @override
  String get vocabularyAnswerOption2 => '網';

  @override
  String get vocabularyAnswerOption3 => '派';

  @override
  String get vocabularyAnswerOption4 => '圏';
}

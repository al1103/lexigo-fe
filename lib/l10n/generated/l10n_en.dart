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

  @override
  String get reviewTitle => 'Bookmarks';

  @override
  String get reviewClearAll => 'Clear all bookmarks';

  @override
  String get reviewErrorLoading => 'Error loading bookmarks';

  @override
  String get reviewPracticeMode => 'Practice Mode';

  @override
  String get reviewEmptyTitle => 'No bookmarks yet';

  @override
  String get reviewEmptySubtitle =>
      'Bookmark questions during quizzes\nto review them later';

  @override
  String get reviewTakeAQuiz => 'Take a Quiz';

  @override
  String reviewBookmarkedQuestions(Object count) {
    return '$count Bookmarked Questions';
  }

  @override
  String reviewStats(Object correct, Object incorrect) {
    return '$correct correct • $incorrect to review';
  }

  @override
  String get reviewFilterAll => 'All';

  @override
  String get reviewFilterCorrect => 'Correct';

  @override
  String get reviewFilterIncorrect => 'Incorrect';

  @override
  String get reviewClearAllDialogTitle => 'Clear All Bookmarks';

  @override
  String get reviewClearAllDialogContent =>
      'Are you sure you want to remove all bookmarked questions? This action cannot be undone.';

  @override
  String get reviewClearAllDialogCancel => 'Cancel';

  @override
  String get reviewClearAllDialogClear => 'Clear All';

  @override
  String get reviewAllBookmarksCleared => 'All bookmarks cleared';

  @override
  String get reviewPracticeDialogTitle => 'Practice Mode';

  @override
  String get reviewPracticeDialogContent =>
      'Choose which questions to practice:';

  @override
  String get reviewPracticeAllBookmarks => 'All Bookmarks';

  @override
  String get reviewPracticeIncorrectOnly => 'Incorrect Only';

  @override
  String get reviewPracticeNoQuestions => 'No questions available for practice';

  @override
  String get reviewCardCorrect => 'Correct';

  @override
  String get reviewCardIncorrect => 'Incorrect';

  @override
  String get reviewCardAddNote => 'Add note';

  @override
  String get reviewCardRemoveBookmark => 'Remove bookmark';

  @override
  String get reviewCardYourAnswer => 'Your answer';

  @override
  String get reviewCardPersonalNote => 'Personal Note';

  @override
  String get reviewCardHintText => 'Add your personal note here...';

  @override
  String reviewCardBookmarkedOn(Object date) {
    return 'Bookmarked on $date';
  }
}

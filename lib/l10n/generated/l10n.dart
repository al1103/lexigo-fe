import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUpAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpAppBarTitle;

  /// No description provided for @signUpButtonText.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButtonText;

  /// No description provided for @bottomNavLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get bottomNavLearn;

  /// No description provided for @bottomNavPractice.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get bottomNavPractice;

  /// No description provided for @bottomNavStories.
  ///
  /// In en, this message translates to:
  /// **'Stories'**
  String get bottomNavStories;

  /// No description provided for @bottomNavProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get bottomNavProfile;

  /// No description provided for @progressYourLevel.
  ///
  /// In en, this message translates to:
  /// **'Your Level'**
  String get progressYourLevel;

  /// No description provided for @progressIntermediateLearner.
  ///
  /// In en, this message translates to:
  /// **'Intermediate Learner'**
  String get progressIntermediateLearner;

  /// No description provided for @progressNextLevel.
  ///
  /// In en, this message translates to:
  /// **'Next level: {points} more points needed'**
  String progressNextLevel(Object points);

  /// No description provided for @progressPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} Points'**
  String progressPoints(Object points);

  /// No description provided for @progressLessons.
  ///
  /// In en, this message translates to:
  /// **'LessonsModel'**
  String get progressLessons;

  /// No description provided for @progressVocabulary.
  ///
  /// In en, this message translates to:
  /// **'Vocabulary'**
  String get progressVocabulary;

  /// No description provided for @progressStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get progressStreak;

  /// No description provided for @progressStudyTime.
  ///
  /// In en, this message translates to:
  /// **'Study Time'**
  String get progressStudyTime;

  /// No description provided for @vocabularyQuizzes.
  ///
  /// In en, this message translates to:
  /// **'Quizzes'**
  String get vocabularyQuizzes;

  /// No description provided for @vocabularyGuest.
  ///
  /// In en, this message translates to:
  /// **'#Guest'**
  String get vocabularyGuest;

  /// No description provided for @vocabularyUserBi.
  ///
  /// In en, this message translates to:
  /// **'Bi'**
  String get vocabularyUserBi;

  /// No description provided for @vocabularyJapaneseQuestion.
  ///
  /// In en, this message translates to:
  /// **'彼は社内の情報___から得た情報をわざと漏洩した。'**
  String get vocabularyJapaneseQuestion;

  /// No description provided for @vocabularyAnswerOption1.
  ///
  /// In en, this message translates to:
  /// **'視'**
  String get vocabularyAnswerOption1;

  /// No description provided for @vocabularyAnswerOption2.
  ///
  /// In en, this message translates to:
  /// **'網'**
  String get vocabularyAnswerOption2;

  /// No description provided for @vocabularyAnswerOption3.
  ///
  /// In en, this message translates to:
  /// **'派'**
  String get vocabularyAnswerOption3;

  /// No description provided for @vocabularyAnswerOption4.
  ///
  /// In en, this message translates to:
  /// **'圏'**
  String get vocabularyAnswerOption4;

  /// No description provided for @reviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get reviewTitle;

  /// No description provided for @reviewClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all bookmarks'**
  String get reviewClearAll;

  /// No description provided for @reviewErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading bookmarks'**
  String get reviewErrorLoading;

  /// No description provided for @reviewPracticeMode.
  ///
  /// In en, this message translates to:
  /// **'Practice Mode'**
  String get reviewPracticeMode;

  /// No description provided for @reviewEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No bookmarks yet'**
  String get reviewEmptyTitle;

  /// No description provided for @reviewEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Bookmark questions during quizzes\nto review them later'**
  String get reviewEmptySubtitle;

  /// No description provided for @reviewTakeAQuiz.
  ///
  /// In en, this message translates to:
  /// **'Take a Quiz'**
  String get reviewTakeAQuiz;

  /// No description provided for @reviewBookmarkedQuestions.
  ///
  /// In en, this message translates to:
  /// **'{count} Bookmarked Questions'**
  String reviewBookmarkedQuestions(Object count);

  /// No description provided for @reviewStats.
  ///
  /// In en, this message translates to:
  /// **'{correct} correct • {incorrect} to review'**
  String reviewStats(Object correct, Object incorrect);

  /// No description provided for @reviewFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get reviewFilterAll;

  /// No description provided for @reviewFilterCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get reviewFilterCorrect;

  /// No description provided for @reviewFilterIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get reviewFilterIncorrect;

  /// No description provided for @reviewClearAllDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear All Bookmarks'**
  String get reviewClearAllDialogTitle;

  /// No description provided for @reviewClearAllDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove all bookmarked questions? This action cannot be undone.'**
  String get reviewClearAllDialogContent;

  /// No description provided for @reviewClearAllDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get reviewClearAllDialogCancel;

  /// No description provided for @reviewClearAllDialogClear.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get reviewClearAllDialogClear;

  /// No description provided for @reviewAllBookmarksCleared.
  ///
  /// In en, this message translates to:
  /// **'All bookmarks cleared'**
  String get reviewAllBookmarksCleared;

  /// No description provided for @reviewPracticeDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Practice Mode'**
  String get reviewPracticeDialogTitle;

  /// No description provided for @reviewPracticeDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Choose which questions to practice:'**
  String get reviewPracticeDialogContent;

  /// No description provided for @reviewPracticeAllBookmarks.
  ///
  /// In en, this message translates to:
  /// **'All Bookmarks'**
  String get reviewPracticeAllBookmarks;

  /// No description provided for @reviewPracticeIncorrectOnly.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Only'**
  String get reviewPracticeIncorrectOnly;

  /// No description provided for @reviewPracticeNoQuestions.
  ///
  /// In en, this message translates to:
  /// **'No questions available for practice'**
  String get reviewPracticeNoQuestions;

  /// No description provided for @reviewCardCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get reviewCardCorrect;

  /// No description provided for @reviewCardIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get reviewCardIncorrect;

  /// No description provided for @reviewCardAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get reviewCardAddNote;

  /// No description provided for @reviewCardRemoveBookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove bookmark'**
  String get reviewCardRemoveBookmark;

  /// No description provided for @reviewCardYourAnswer.
  ///
  /// In en, this message translates to:
  /// **'Your answer'**
  String get reviewCardYourAnswer;

  /// No description provided for @reviewCardPersonalNote.
  ///
  /// In en, this message translates to:
  /// **'Personal Note'**
  String get reviewCardPersonalNote;

  /// No description provided for @reviewCardHintText.
  ///
  /// In en, this message translates to:
  /// **'Add your personal note here...'**
  String get reviewCardHintText;

  /// No description provided for @reviewCardBookmarkedOn.
  ///
  /// In en, this message translates to:
  /// **'Bookmarked on {date}'**
  String reviewCardBookmarkedOn(Object date);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

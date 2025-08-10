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

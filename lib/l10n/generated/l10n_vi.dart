// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get signUpAppBarTitle => 'Đăng ký';

  @override
  String get signUpButtonText => 'Đăng ký';

  @override
  String get bottomNavLearn => 'Học';

  @override
  String get bottomNavPractice => 'Luyện tập';

  @override
  String get bottomNavStories => 'Truyện';

  @override
  String get bottomNavProfile => 'Hồ sơ';

  @override
  String get progressYourLevel => 'Cấp độ của bạn';

  @override
  String get progressIntermediateLearner => 'Người học trung cấp';

  @override
  String progressNextLevel(Object points) {
    return 'Cấp độ tiếp theo: cần thêm $points điểm';
  }

  @override
  String progressPoints(Object points) {
    return '$points điểm';
  }

  @override
  String get progressLessons => 'Bài học';

  @override
  String get progressVocabulary => 'Từ vựng';

  @override
  String get progressStreak => 'Chuỗi ngày';

  @override
  String get progressStudyTime => 'Thời gian học';

  @override
  String get vocabularyQuizzes => 'Câu đố';

  @override
  String get vocabularyGuest => '#Khách';

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

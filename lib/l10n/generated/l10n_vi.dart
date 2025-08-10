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

  @override
  String get reviewTitle => 'Dấu trang';

  @override
  String get reviewClearAll => 'Xóa tất cả dấu trang';

  @override
  String get reviewErrorLoading => 'Lỗi tải dấu trang';

  @override
  String get reviewPracticeMode => 'Chế độ luyện tập';

  @override
  String get reviewEmptyTitle => 'Chưa có dấu trang nào';

  @override
  String get reviewEmptySubtitle =>
      'Đánh dấu câu hỏi trong các bài kiểm tra\nđể xem lại sau';

  @override
  String get reviewTakeAQuiz => 'Làm bài kiểm tra';

  @override
  String reviewBookmarkedQuestions(Object count) {
    return '$count câu hỏi đã đánh dấu';
  }

  @override
  String reviewStats(Object correct, Object incorrect) {
    return '$correct đúng • $incorrect cần xem lại';
  }

  @override
  String get reviewFilterAll => 'Tất cả';

  @override
  String get reviewFilterCorrect => 'Đúng';

  @override
  String get reviewFilterIncorrect => 'Sai';

  @override
  String get reviewClearAllDialogTitle => 'Xóa tất cả dấu trang';

  @override
  String get reviewClearAllDialogContent =>
      'Bạn có chắc chắn muốn xóa tất cả các câu hỏi đã đánh dấu không? Hành động này không thể hoàn tác.';

  @override
  String get reviewClearAllDialogCancel => 'Hủy';

  @override
  String get reviewClearAllDialogClear => 'Xóa tất cả';

  @override
  String get reviewAllBookmarksCleared => 'Đã xóa tất cả dấu trang';

  @override
  String get reviewPracticeDialogTitle => 'Chế độ luyện tập';

  @override
  String get reviewPracticeDialogContent => 'Chọn câu hỏi để luyện tập:';

  @override
  String get reviewPracticeAllBookmarks => 'Tất cả dấu trang';

  @override
  String get reviewPracticeIncorrectOnly => 'Chỉ câu sai';

  @override
  String get reviewPracticeNoQuestions => 'Không có câu hỏi để luyện tập';

  @override
  String get reviewCardCorrect => 'Đúng';

  @override
  String get reviewCardIncorrect => 'Sai';

  @override
  String get reviewCardAddNote => 'Thêm ghi chú';

  @override
  String get reviewCardRemoveBookmark => 'Xóa dấu trang';

  @override
  String get reviewCardYourAnswer => 'Câu trả lời của bạn';

  @override
  String get reviewCardPersonalNote => 'Ghi chú cá nhân';

  @override
  String get reviewCardHintText => 'Thêm ghi chú cá nhân của bạn ở đây...';

  @override
  String reviewCardBookmarkedOn(Object date) {
    return 'Đã đánh dấu vào $date';
  }
}

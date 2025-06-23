import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/common/widgets/loading_widget.dart';
import 'package:lexigo/quiz/presentation/pages/quiz_result_page.dart';
import 'package:lexigo/screen/word_learning/controller/word_controller.dart';
import 'package:lexigo/screen/word_learning/model/lessons_detail.dart';
import 'package:lexigo/screen/word_learning/text_to_speech.dart';

@RoutePage()
class WordLearningScreen extends ConsumerStatefulWidget {
  const WordLearningScreen({
    this.levelId,
    super.key,
  });

  final int? levelId;

  @override
  _WordLearningScreenState createState() => _WordLearningScreenState();
}

class _WordLearningScreenState extends ConsumerState<WordLearningScreen>
    with TickerProviderStateMixin {
  int selectedAnswerIndex = -1;
  bool isAnswerSubmitted = false;
  bool _isSpeaking = false;
  int currentQuestionIndex = 0;

  // Thêm để track kết quả
  final List<QuizResult> _quizResults = [];

  // Thêm để track bookmarks
  final Set<int> _bookmarkedQuestions = <int>{};

  // Thêm sessionId cho quiz - trong thực tế có thể lấy từ API start quiz
  final int sessionId = 8;

  late AnimationController _animationController;
  late AnimationController _speakingController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _speakingAnimation;

  final TTSService _ttsService = TTSService();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _initializeTTS();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _speakingController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _speakingAnimation = Tween<double>(begin: 1, end: 1.2).animate(
      CurvedAnimation(parent: _speakingController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  Future<void> _initializeTTS() async {
    await _ttsService.initialize();

    _ttsService.onSpeechStart = () {
      if (mounted) {
        setState(() {
          _isSpeaking = true;
        });
        _speakingController.repeat(reverse: true);
      }
    };

    _ttsService.onSpeechComplete = () {
      if (mounted) {
        setState(() {
          _isSpeaking = false;
        });
        _speakingController.stop();
        _speakingController.reset();
      }
    };

    _ttsService.onSpeechError = (String error) {
      if (mounted) {
        setState(() {
          _isSpeaking = false;
        });
        _speakingController.stop();
        _speakingController.reset();
        print('TTS Error: $error');
      }
    };
  }

  @override
  void dispose() {
    _animationController.dispose();
    _speakingController.dispose();
    _ttsService.stop();
    super.dispose();
  }

  // Helper method để lấy list options từ LessonsDetail
  List<Map<String, dynamic>> _getOptionsFromLessonsDetail(
    LessonsDetail lesson,
  ) {
    if (lesson.options == null || lesson.options!.isEmpty) {
      return [];
    }

    return lesson.options!
        .map(
          (option) => {
            'text': option.optionText ?? '',
            'isCorrect': option.isCorrect ?? false,
            'optionId': option.optionId,
            'optionOrder': option.optionOrder,
          },
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final wordData = ref.watch(wordControllerProvider(widget.levelId ?? 1));

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          ),
        ),
        child: SafeArea(
          child: wordData.when(
            data: (data) {
              if (data.isEmpty) {
                return const Center(
                  child: Text(
                    'No available questions',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                );
              }

              final totalQuestions = data.length; // Lấy length từ root
              final currentQuestion = data[currentQuestionIndex];

              return Column(
                children: [
                  _buildCompactHeader(totalQuestions),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFAFAFC),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  _buildQuestionCard(currentQuestion),
                                  const SizedBox(height: 24),
                                  Expanded(
                                    child: _buildAnswerOptions(currentQuestion),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildBottomFeedback(currentQuestion),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const AppLoading(message: 'Loading vocabulary...'),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, color: Colors.white, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    'Error: $error',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactHeader(int total) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Word Learning',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$total Questions Available',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    if (_bookmarkedQuestions.isNotEmpty) ...[
                      Text(
                        ' • ${_bookmarkedQuestions.length} Bookmarked',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              '${currentQuestionIndex + 1}/$total',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(LessonsDetail currentQuestion) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Question number indicator
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Question ${currentQuestionIndex + 1}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6366F1),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  currentQuestion.questionText ?? 'Choose the correct answer',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
              // Bookmark button
              GestureDetector(
                onTap: () => _toggleBookmark(currentQuestion),
                child: Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: _isBookmarked(currentQuestion)
                        ? const Color(0xFF6366F1).withOpacity(0.1)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _isBookmarked(currentQuestion)
                          ? const Color(0xFF6366F1)
                          : Colors.grey[300]!,
                      width: 1.5,
                    ),
                  ),
                  child: Icon(
                    _isBookmarked(currentQuestion)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: _isBookmarked(currentQuestion)
                        ? const Color(0xFF6366F1)
                        : Colors.grey[500],
                    size: 20,
                  ),
                ),
              ),
              // Audio button
              AnimatedBuilder(
                animation: _speakingAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _isSpeaking ? _speakingAnimation.value : 1.0,
                    child: GestureDetector(
                      onTap: () =>
                          _playAudio(currentQuestion.questionText ?? ''),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: _isSpeaking
                                ? [
                                    const Color(0xFF10B981),
                                    const Color(0xFF059669),
                                  ]
                                : [
                                    const Color(0xFF6366F1),
                                    const Color(0xFF8B5CF6),
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: (_isSpeaking
                                      ? const Color(0xFF10B981)
                                      : const Color(0xFF6366F1))
                                  .withOpacity(0.4),
                              blurRadius: _isSpeaking ? 16 : 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.volume_up_rounded,
                          color: Colors.white,
                          size: _isSpeaking ? 22 : 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          if (currentQuestion.word != null &&
              currentQuestion.meaning != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  if (currentQuestion.word != null) ...[
                    Text(
                      'Word: ${currentQuestion.word!}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6366F1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  if (currentQuestion.meaning != null) ...[
                    Text(
                      'Meaning: ${currentQuestion.meaning!}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6366F1),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                  if (currentQuestion.pronunciation != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Pronunciation: ${currentQuestion.pronunciation!}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6366F1),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAnswerOptions(LessonsDetail currentQuestion) {
    final options = _getOptionsFromLessonsDetail(currentQuestion);

    return Column(
      children: options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = selectedAnswerIndex == index;
        final isCorrect = option['isCorrect'] as bool;
        final showResult = isAnswerSubmitted;

        Color getBackgroundColor() {
          if (!showResult) {
            return isSelected ? const Color(0xFF6366F1) : Colors.white;
          }
          if (isCorrect) return const Color(0xFF10B981);
          if (isSelected && !isCorrect) return const Color(0xFFEF4444);
          return Colors.white;
        }

        Color getTextColor() {
          if (!showResult) {
            return isSelected ? Colors.white : const Color(0xFF1F2937);
          }
          if (isCorrect || (isSelected && !isCorrect)) return Colors.white;
          return const Color(0xFF1F2937);
        }

        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: isAnswerSubmitted
                  ? null
                  : () {
                      setState(() {
                        selectedAnswerIndex = index;
                        isAnswerSubmitted = true;
                      });

                      // Lưu kết quả câu hỏi
                      _saveQuestionResult(currentQuestion, index, isCorrect);
                    },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: getBackgroundColor(),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: getBackgroundColor() == Colors.white
                        ? Colors.grey[200]!
                        : getBackgroundColor(),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: getBackgroundColor().withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: getTextColor() == Colors.white
                            ? Colors.white.withOpacity(0.2)
                            : const Color(0xFF6366F1).withOpacity(0.1),
                        border: Border.all(
                          color: getTextColor() == Colors.white
                              ? Colors.white
                              : const Color(0xFF6366F1),
                          width: 2,
                        ),
                      ),
                      child: showResult && isCorrect
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 18,
                            )
                          : showResult && isSelected && !isCorrect
                              ? const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 18,
                                )
                              : Center(
                                  child: Text(
                                    String.fromCharCode(
                                      65 + index,
                                    ), // A, B, C, D
                                    style: TextStyle(
                                      color: getTextColor(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        option['text'] as String,
                        style: TextStyle(
                          color: getTextColor(),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomFeedback(LessonsDetail currentQuestion) {
    if (isAnswerSubmitted) {
      final options = _getOptionsFromLessonsDetail(currentQuestion);
      final selectedOption =
          selectedAnswerIndex >= 0 && selectedAnswerIndex < options.length
              ? options[selectedAnswerIndex]
              : null;
      final isCorrect = selectedOption?['isCorrect'] as bool? ?? false;

      return Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isCorrect
                ? [const Color(0xFF10B981), const Color(0xFF059669)]
                : [const Color(0xFFEF4444), const Color(0xFFDC2626)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              isCorrect ? Icons.check_circle : Icons.cancel,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isCorrect ? 'Correct! Well done! 🎉' : 'Incorrect',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (!isCorrect) ...[
                    Text(
                      'Points: ${currentQuestion.points ?? 0}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Bookmark button
            GestureDetector(
              onTap: () => _toggleBookmark(currentQuestion),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _isBookmarked(currentQuestion)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Next button
            GestureDetector(
              onTap: _nextQuestion,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: isCorrect
                        ? const Color(0xFF10B981)
                        : const Color(0xFFEF4444),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: const Center(
          child: Text(
            'Select an answer to continue',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B7280),
            ),
          ),
        ),
      );
    }
  }

  // Thêm method để lưu kết quả
  void _saveQuestionResult(
    LessonsDetail question,
    int userAnswerIndex,
    bool isCorrect,
  ) {
    final options = _getOptionsFromLessonsDetail(question);
    final correctAnswerIndex =
        options.indexWhere((option) => option['isCorrect'] as bool);
    final result = QuizResult(
      questionId:
          question.questionId?.toString() ?? currentQuestionIndex.toString(),
      question: question.questionText ?? 'No question text',
      options: options.map((option) => option['text'] as String).toList(),
      correctAnswerIndex: correctAnswerIndex,
      userAnswerIndex: userAnswerIndex,
      isCorrect: isCorrect,
      explanation: question.meaning ?? question.word,
    );

    _quizResults.add(result);
  }

  // Thêm bookmark methods
  bool _isBookmarked(LessonsDetail question) {
    return _bookmarkedQuestions.contains(question.questionId);
  }

  void _toggleBookmark(LessonsDetail question) {
    setState(() {
      if (_bookmarkedQuestions.contains(question.questionId)) {
        _bookmarkedQuestions.remove(question.questionId);
        _showSnackBar('Removed from bookmarks', Icons.bookmark_border);
      } else {
        _bookmarkedQuestions.add(question.questionId!);
        _showSnackBar('Added to bookmarks', Icons.bookmark);
      }
    });
  }

  void _showSnackBar(String message, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: const Color(0xFF6366F1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> _nextQuestion() async {
    final wordData =
        ref.read(wordControllerProvider(widget.levelId ?? 1)).value;

    // Submit answer nếu đã trả lời
    if (isAnswerSubmitted && selectedAnswerIndex >= 0 && wordData != null) {
      final currentQuestion = wordData[currentQuestionIndex];
      final options = _getOptionsFromLessonsDetail(currentQuestion);

      if (selectedAnswerIndex < options.length) {
        final selectedOption = options[selectedAnswerIndex];
        final selectedOptionId = selectedOption['optionId'] as int?;

        if (selectedOptionId != null && currentQuestion.questionId != null) {
          try {
            await ref
                .read(wordControllerProvider(widget.levelId ?? 1).notifier)
                .submitAnswer(
                  sessionId: sessionId,
                  questionId: currentQuestion.questionId!,
                  selectedOptionId: selectedOptionId,
                );
            print('Answer submitted successfully');
          } catch (e) {
            print('Failed to submit answer: $e');
            // Hiển thị thông báo lỗi cho user
            _showSnackBar('Failed to submit answer', Icons.error);
          }
        }
      }
    }

    // Kiểm tra còn câu hỏi nào không
    if (wordData != null && currentQuestionIndex < wordData.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = -1;
        isAnswerSubmitted = false;
      });
      print('Next question: ${currentQuestionIndex + 1}/${wordData.length}');
    } else {
      print('Quiz completed: ${wordData?.length ?? 0} questions total');
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    final wordData =
        ref.read(wordControllerProvider(widget.levelId ?? 1)).value;
    final totalQuestions = wordData?.length ?? 0;
    final score = _quizResults.where((result) => result.isCorrect).length;

    print('Showing completion dialog for $totalQuestions questions');

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          '🎉 Quiz Complete!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2937),
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6366F1),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You scored $score out of $totalQuestions questions!',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: score / totalQuestions >= 0.7
                            ? [const Color(0xFF10B981), const Color(0xFF059669)]
                            : score / totalQuestions >= 0.5
                                ? [
                                    const Color(0xFFF59E0B),
                                    const Color(0xFFD97706),
                                  ]
                                : [
                                    const Color(0xFFEF4444),
                                    const Color(0xFFDC2626),
                                  ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${((score / totalQuestions) * 100).round()}% Correct',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.router.pop(); // Quay về màn hình trước
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.grey[700],
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Back to Levels',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    // Chuyển đổi QuizResult thành QuestionResult
                    final questionResults = _quizResults
                        .map(
                          (result) => QuestionResult(
                            questionId: result.questionId,
                            question: result.question,
                            options: result.options,
                            correctAnswerIndex: result.correctAnswerIndex,
                            userAnswerIndex: result.userAnswerIndex,
                            isCorrect: result.isCorrect,
                            explanation: result.explanation,
                          ),
                        )
                        .toList();

                    // Navigate to results page
                    context.router.push(
                      QuizResultRoute(
                        results: questionResults,
                        score: score,
                        totalQuestions: totalQuestions,
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'View Results',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _playAudio(String text) async {
    try {
      if (_isSpeaking) {
        await _ttsService.stop();
        return;
      }

      await _ttsService.speak(text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.volume_up_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Playing Audio...',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: const Color(0xFF6366F1),
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } catch (e) {
      print('TTS Error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Unable to play audio. Please try again.'),
            backgroundColor: Colors.red[600],
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    }
  }
}

// Thêm class QuizResult để tương thích
class QuizResult {
  QuizResult({
    required this.questionId,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.userAnswerIndex,
    required this.isCorrect,
    this.explanation,
  });
  final String questionId;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final int userAnswerIndex;
  final bool isCorrect;
  final String? explanation;
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';
import 'package:lexigo/common/constants/text_styles.dart';
import 'package:lexigo/core/presentation/widgets/cute_button.dart';
import 'package:lexigo/core/presentation/widgets/cute_card.dart';

@RoutePage()
class QuizScreen extends StatefulWidget {
  const QuizScreen({
    required this.quizId,
    super.key,
  });
  final int quizId;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  Quiz? _quiz;
  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {}; // questionId -> selectedOptionId
  bool _isSubmitted = false;
  int _score = 0;
  bool _isQuizCompleted = false;

  @override
  void initState() {
    super.initState();
    _fetchQuiz();
  }

  Future<void> _fetchQuiz() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // In a real app, this would be an API call
      // For now, let's create mock data
      await Future.delayed(const Duration(seconds: 1));

      final mockQuestions = [
        QuizQuestion(
          id: 1,
          quizId: widget.quizId,
          questionText: 'What is the Japanese word for "Hello"?',
          questionType: 'multiple-choice',
          options: [
            QuizOption(
              id: 1,
              questionId: 1,
              optionText: 'Arigatou',
              isCorrect: false,
            ),
            QuizOption(
              id: 2,
              questionId: 1,
              optionText: 'Konnichiwa',
              isCorrect: true,
            ),
            QuizOption(
              id: 3,
              questionId: 1,
              optionText: 'Sayonara',
              isCorrect: false,
            ),
            QuizOption(
              id: 4,
              questionId: 1,
              optionText: 'Onegai',
              isCorrect: false,
            ),
          ],
        ),
        QuizQuestion(
          id: 2,
          quizId: widget.quizId,
          questionText: 'Which of the following means "Thank you" in Japanese?',
          questionType: 'multiple-choice',
          options: [
            QuizOption(
              id: 5,
              questionId: 2,
              optionText: 'Konnichiwa',
              isCorrect: false,
            ),
            QuizOption(
              id: 6,
              questionId: 2,
              optionText: 'Sayonara',
              isCorrect: false,
            ),
            QuizOption(
              id: 7,
              questionId: 2,
              optionText: 'Arigatou',
              isCorrect: true,
            ),
            QuizOption(
              id: 8,
              questionId: 2,
              optionText: 'Hai',
              isCorrect: false,
            ),
          ],
        ),
        QuizQuestion(
          id: 3,
          quizId: widget.quizId,
          questionText: 'Is "Iie" the Japanese word for "No"?',
          questionType: 'true-false',
          options: [
            QuizOption(
              id: 9,
              questionId: 3,
              optionText: 'True',
              isCorrect: true,
            ),
            QuizOption(
              id: 10,
              questionId: 3,
              optionText: 'False',
              isCorrect: false,
            ),
          ],
        ),
        QuizQuestion(
          id: 4,
          quizId: widget.quizId,
          questionText: 'What is the translation of "Please" in Japanese?',
          questionType: 'multiple-choice',
          options: [
            QuizOption(
              id: 11,
              questionId: 4,
              optionText: 'Konnichiwa',
              isCorrect: false,
            ),
            QuizOption(
              id: 12,
              questionId: 4,
              optionText: 'Sayonara',
              isCorrect: false,
            ),
            QuizOption(
              id: 13,
              questionId: 4,
              optionText: 'Arigatou',
              isCorrect: false,
            ),
            QuizOption(
              id: 14,
              questionId: 4,
              optionText: 'Onegai',
              isCorrect: true,
            ),
          ],
        ),
      ];

      setState(() {
        _quiz = Quiz(
          id: widget.quizId,
          title: 'Japanese Vocabulary Quiz',
          description: 'Test your Japanese vocabulary knowledge',
          lessonId: 1,
          questions: mockQuestions,
          passingScore: 70,
        );
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _selectAnswer(int questionId, int optionId) {
    if (_isSubmitted) return;

    setState(() {
      _selectedAnswers[questionId] = optionId;
    });
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < (_quiz!.questions.length - 1)) {
      setState(() {
        _currentQuestionIndex++;
        _isSubmitted = false;
      });
    } else {
      _completeQuiz();
    }
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _isSubmitted = false;
      });
    }
  }

  void _submitAnswer() {
    final currentQuestion = _quiz!.questions[_currentQuestionIndex];
    if (!_selectedAnswers.containsKey(currentQuestion.id)) return;

    setState(() {
      _isSubmitted = true;

      // Check if answer is correct
      final selectedOptionId = _selectedAnswers[currentQuestion.id]!;
      final selectedOption = currentQuestion.options.firstWhere(
        (option) => option.id == selectedOptionId,
      );

      if (selectedOption.isCorrect) {
        _score++;
      }
    });
  }

  void _completeQuiz() {
    final scorePercentage = (_score / _quiz!.questions.length) * 100;
    final isPassed = scorePercentage >= _quiz!.passingScore;

    setState(() {
      _isQuizCompleted = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: isPassed ? AppColors.green : AppColors.error,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    isPassed ? Icons.check_circle : Icons.close,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isPassed ? 'Quiz Passed!' : 'Try Again',
                style: AppTextStyles.heading3.copyWith(
                  color: isPassed ? AppColors.green : AppColors.error,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your score: ${scorePercentage.toInt()}%',
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You answered $_score out of ${_quiz!.questions.length} questions correctly.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium,
              ),
              if (isPassed) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.yellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '+100 Points',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 24),
              CuteButton(
                text: isPassed ? 'Continue' : 'Try Again',
                onPressed: () {
                  Navigator.pop(context);
                  if (isPassed) {
                    Navigator.pop(context); // Return to lesson
                  } else {
                    // Reset quiz
                    setState(() {
                      _currentQuestionIndex = 0;
                      _selectedAnswers.clear();
                      _isSubmitted = false;
                      _score = 0;
                      _isQuizCompleted = false;
                    });
                  }
                },
                backgroundColor: isPassed ? AppColors.primary : AppColors.error,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionContent(QuizQuestion question) {
    final isOptionSelected = _selectedAnswers.containsKey(question.id);
    final selectedOptionId =
        isOptionSelected ? _selectedAnswers[question.id] : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question
        CuteCard(
          backgroundColor: AppColors.primaryLight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.help_outline,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Question ${_currentQuestionIndex + 1}',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                question.questionText,
                style: AppTextStyles.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Options
        ...question.options.map((option) {
          final isSelected = selectedOptionId == option.id;
          final showCorrect = _isSubmitted && option.isCorrect;
          final showIncorrect = _isSubmitted && isSelected && !option.isCorrect;

          var backgroundColor = Colors.white;
          var borderColor = Colors.transparent;
          var textColor = AppColors.textPrimary;

          if (showCorrect) {
            backgroundColor = AppColors.green.withOpacity(0.1);
            borderColor = AppColors.green;
            textColor = AppColors.green;
          } else if (showIncorrect) {
            backgroundColor = AppColors.error.withOpacity(0.1);
            borderColor = AppColors.error;
            textColor = AppColors.error;
          } else if (isSelected) {
            backgroundColor = AppColors.primary.withOpacity(0.1);
            borderColor = AppColors.primary;
            textColor = AppColors.primary;
          }

          return GestureDetector(
            onTap: () => _selectAnswer(question.id, option.id),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected ? AppColors.primary : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      option.optionText,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: textColor,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (showCorrect)
                    const Icon(
                      Icons.check_circle,
                      color: AppColors.green,
                    )
                  else if (showIncorrect)
                    const Icon(
                      Icons.cancel,
                      color: AppColors.error,
                    ),
                ],
              ),
            ),
          );
        }),

        const SizedBox(height: 24),

        // Submit Button
        if (!_isSubmitted)
          Center(
            child: CuteButton(
              text: 'Check Answer',
              onPressed: _selectedAnswers.containsKey(question.id)
                  ? _submitAnswer
                  : () {},
              backgroundColor: _selectedAnswers.containsKey(question.id)
                  ? AppColors.primary
                  : AppColors.primary.withOpacity(0.5),
              width: 200,
            ),
          )
        else
          Center(
            child: CuteButton(
              text: _currentQuestionIndex < (_quiz!.questions.length - 1)
                  ? 'Next Question'
                  : 'Finish Quiz',
              onPressed: _goToNextQuestion,
              backgroundColor: AppColors.green,
              width: 200,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          _quiz?.title ?? 'Quiz',
          style: AppTextStyles.heading3.copyWith(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 60,
                        color: AppColors.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Error: $_errorMessage',
                        style: const TextStyle(color: AppColors.error),
                      ),
                      const SizedBox(height: 16),
                      CuteButton(
                        text: 'Try Again',
                        onPressed: _fetchQuiz,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    // Progress Bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Question ${_currentQuestionIndex + 1}/${_quiz!.questions.length}',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Score: $_score',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      (_currentQuestionIndex + 1) /
                                      _quiz!.questions.length *
                                      0.9, // Account for padding
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Question Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _buildQuestionContent(
                          _quiz!.questions[_currentQuestionIndex],
                        ),
                      ),
                    ),

                    // Navigation Buttons
                    if (_isSubmitted)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (_currentQuestionIndex > 0)
                              CuteOutlinedButton(
                                text: 'Previous',
                                onPressed: _goToPreviousQuestion,
                                width: 120,
                              )
                            else
                              const SizedBox(width: 120),
                            CuteButton(
                              text: _currentQuestionIndex <
                                      (_quiz!.questions.length - 1)
                                  ? 'Next'
                                  : 'Finish',
                              onPressed: _goToNextQuestion,
                              width: 120,
                              backgroundColor: AppColors.green,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
    );
  }
}

class Quiz {
  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.lessonId,
    required this.questions,
    required this.passingScore,
  });
  final int id;
  final String title;
  final String description;
  final int lessonId;
  final List<QuizQuestion> questions;
  final int passingScore;
}

class QuizQuestion {
  QuizQuestion({
    required this.id,
    required this.quizId,
    required this.questionText,
    required this.questionType,
    required this.options,
  });
  final int id;
  final int quizId;
  final String questionText;
  final String questionType;
  final List<QuizOption> options;
}

class QuizOption {
  QuizOption({
    required this.id,
    required this.questionId,
    required this.optionText,
    required this.isCorrect,
  });
  final int id;
  final int questionId;
  final String optionText;
  final bool isCorrect;
}

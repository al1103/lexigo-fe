import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/widgets/app_button.dart';

@RoutePage()
class QuizResultPage extends ConsumerWidget {
  const QuizResultPage({
    required this.results,
    required this.score,
    required this.totalQuestions,
    super.key,
  });
  final List<QuestionResult> results;
  final int score;
  final int totalQuestions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final percentage = (score / totalQuestions * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF1E293B),
      ),
      body: Column(
        children: [
          // Score Summary Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: percentage >= 70
                    ? [const Color(0xFF10B981), const Color(0xFF059669)]
                    : percentage >= 50
                        ? [const Color(0xFFF59E0B), const Color(0xFFD97706)]
                        : [const Color(0xFFEF4444), const Color(0xFFDC2626)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Icon(
                  percentage >= 70
                      ? Icons.emoji_events
                      : percentage >= 50
                          ? Icons.thumb_up
                          : Icons.refresh,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 16),
                Text(
                  '$score / $totalQuestions',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$percentage% Correct',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  percentage >= 70
                      ? 'Excellent!'
                      : percentage >= 50
                          ? 'Good job!'
                          : 'Keep practicing!',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Questions List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return QuestionResultCard(
                  result: result,
                  questionNumber: index + 1,
                );
              },
            ),
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: AppButton.outline(
                    text: 'Review Bookmarks',
                    onPressed: () => context.router.pushNamed('/bookmarks'),
                    isFullWidth: true,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton.primary(
                    text: 'Try Again',
                    onPressed: () => context.router.pop(),
                    isFullWidth: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionResultCard extends ConsumerStatefulWidget {
  const QuestionResultCard({
    required this.result,
    required this.questionNumber,
    super.key,
  });
  final QuestionResult result;
  final int questionNumber;

  @override
  ConsumerState<QuestionResultCard> createState() => _QuestionResultCardState();
}

class _QuestionResultCardState extends ConsumerState<QuestionResultCard> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    // Load bookmark status from provider/storage
    // isBookmarked = ref.read(bookmarkProvider).isBookmarked(widget.result.questionId);
  }

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });

    // Save to provider/storage
    // if (isBookmarked) {
    //   ref.read(bookmarkProvider.notifier).addBookmark(widget.result);
    // } else {
    //   ref.read(bookmarkProvider.notifier).removeBookmark(widget.result.questionId);
    // }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isBookmarked ? 'Question bookmarked!' : 'Bookmark removed!',
        ),
        backgroundColor:
            isBookmarked ? Colors.green.shade400 : Colors.grey.shade600,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCorrect = widget.result.isCorrect;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCorrect
              ? const Color(0xFF10B981).withOpacity(0.3)
              : const Color(0xFFEF4444).withOpacity(0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isCorrect
                        ? const Color(0xFF10B981)
                        : const Color(0xFFEF4444),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isCorrect ? Icons.check : Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Q${widget.questionNumber}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: _toggleBookmark,
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked
                        ? const Color(0xFFF59E0B)
                        : const Color(0xFF6B7280),
                  ),
                  tooltip: isBookmarked ? 'Remove bookmark' : 'Add bookmark',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Question Text
            Text(
              widget.result.question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),

            // Answer Options
            ...widget.result.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isUserAnswer = index == widget.result.userAnswerIndex;
              final isCorrectAnswer = index == widget.result.correctAnswerIndex;

              Color backgroundColor;
              Color textColor;
              Color borderColor;

              if (isCorrectAnswer) {
                backgroundColor = const Color(0xFF10B981).withOpacity(0.1);
                textColor = const Color(0xFF065F46);
                borderColor = const Color(0xFF10B981);
              } else if (isUserAnswer && !isCorrect) {
                backgroundColor = const Color(0xFFEF4444).withOpacity(0.1);
                textColor = const Color(0xFF991B1B);
                borderColor = const Color(0xFFEF4444);
              } else {
                backgroundColor = const Color(0xFFF9FAFB);
                textColor = const Color(0xFF374151);
                borderColor = const Color(0xFFE5E7EB);
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isCorrectAnswer
                            ? const Color(0xFF10B981)
                            : isUserAnswer && !isCorrect
                                ? const Color(0xFFEF4444)
                                : Colors.transparent,
                        border: Border.all(
                          color: borderColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: isCorrectAnswer
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : isUserAnswer && !isCorrect
                              ? const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 16,
                                )
                              : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        option,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: (isCorrectAnswer || isUserAnswer)
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (isUserAnswer)
                      Icon(
                        Icons.person,
                        color: textColor,
                        size: 16,
                      ),
                  ],
                ),
              );
            }),

            // Explanation (if available)
            if (widget.result.explanation != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF3B82F6).withOpacity(0.2),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.result.explanation!,
                        style: const TextStyle(
                          color: Color(0xFF1E40AF),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Data Models
class QuestionResult {
  QuestionResult({
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

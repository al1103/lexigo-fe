import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/quiz/presentation/pages/quiz_result_page.dart';
import 'package:lexigo/review/presentation/controllers/bookmark_controller.dart';

@RoutePage()
class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarksAsync = ref.watch(bookmarkControllerProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF1E293B),
        actions: [
          bookmarksAsync.when(
            data: (bookmarks) => bookmarks.isNotEmpty
                ? IconButton(
                    onPressed: () => _showClearAllDialog(context, ref),
                    icon: const Icon(Icons.clear_all),
                    tooltip: 'Clear all bookmarks',
                  )
                : const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
      body: bookmarksAsync.when(
        data: (bookmarks) => bookmarks.isEmpty
            ? _buildEmptyState(context)
            : _buildBookmarksList(context, ref, bookmarks),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading bookmarks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.shade600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: bookmarksAsync.whenOrNull(
        data: (bookmarks) => bookmarks.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () => _showPracticeDialog(context, ref, bookmarks),
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                icon: const Icon(Icons.quiz),
                label: const Text(
                  'Practice Mode',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6).withOpacity(0.1),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Icon(
                Icons.bookmark_border,
                size: 80,
                color: const Color(0xFF3B82F6).withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No bookmarks yet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Bookmark questions during quizzes\nto review them later',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.router.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.quiz),
              label: const Text(
                'Take a Quiz',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarksList(
    BuildContext context,
    WidgetRef ref,
    List<BookmarkedQuestion> bookmarks,
  ) {
    return Column(
      children: [
        // Stats Header
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${bookmarks.length} Bookmarked Questions',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getStatsText(bookmarks),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Filter Tabs
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildFilterChip('All', bookmarks.length, true),
              const SizedBox(width: 8),
              _buildFilterChip(
                'Correct',
                bookmarks.where((b) => b.wasCorrect).length,
                false,
              ),
              const SizedBox(width: 8),
              _buildFilterChip(
                'Incorrect',
                bookmarks.where((b) => !b.wasCorrect).length,
                false,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Bookmarks List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              return BookmarkCard(
                bookmark: bookmarks[index],
                onRemove: () {
                  ref
                      .read(bookmarkControllerProvider.notifier)
                      .removeBookmark(bookmarks[index].id);
                },
                onToggleNote: (note) {
                  ref
                      .read(bookmarkControllerProvider.notifier)
                      .updateNote(bookmarks[index].id, note);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, int count, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3B82F6) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF3B82F6) : const Color(0xFFE5E7EB),
        ),
      ),
      child: Text(
        '$label ($count)',
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF6B7280),
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }

  String _getStatsText(List<BookmarkedQuestion> bookmarks) {
    final correct = bookmarks.where((b) => b.wasCorrect).length;
    final incorrect = bookmarks.length - correct;
    return '$correct correct • $incorrect to review';
  }

  void _showClearAllDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Clear All Bookmarks'),
        content: const Text(
          'Are you sure you want to remove all bookmarked questions? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(bookmarkControllerProvider.notifier).clearAll();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All bookmarks cleared'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  void _showPracticeDialog(
    BuildContext context,
    WidgetRef ref,
    List<BookmarkedQuestion> bookmarks,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Practice Mode'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Choose which questions to practice:'),
            const SizedBox(height: 16),
            _buildPracticeOption(
              'All Bookmarks',
              '${bookmarks.length} questions',
              Icons.bookmark,
              () => _startPractice(context, bookmarks),
            ),
            const SizedBox(height: 8),
            _buildPracticeOption(
              'Incorrect Only',
              '${bookmarks.where((b) => !b.wasCorrect).length} questions',
              Icons.error_outline,
              () => _startPractice(
                context,
                bookmarks.where((b) => !b.wasCorrect).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeOption(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF3B82F6)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF6B7280),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF6B7280),
            ),
          ],
        ),
      ),
    );
  }

  void _startPractice(
    BuildContext context,
    List<BookmarkedQuestion> questions,
  ) {
    Navigator.of(context).pop();

    if (questions.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No questions available for practice'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Convert to QuestionResult format and navigate to practice quiz
    final practiceQuestions = questions
        .map(
          (bookmark) => QuestionResult(
            questionId: bookmark.id,
            question: bookmark.question,
            options: bookmark.options,
            correctAnswerIndex: bookmark.correctAnswerIndex,
            userAnswerIndex: bookmark.userAnswerIndex,
            isCorrect: bookmark.wasCorrect,
            explanation: bookmark.explanation,
          ),
        )
        .toList();

    // Navigate to practice mode (reuse quiz result page or create new practice page)
    context.router.pushNamed('/practice-quiz'); // You'll need to implement this
  }
}

class BookmarkCard extends StatefulWidget {
  const BookmarkCard({
    required this.bookmark,
    required this.onRemove,
    required this.onToggleNote,
    super.key,
  });
  final BookmarkedQuestion bookmark;
  final VoidCallback onRemove;
  final Function(String) onToggleNote;

  @override
  State<BookmarkCard> createState() => _BookmarkCardState();
}

class _BookmarkCardState extends State<BookmarkCard> {
  bool _showNote = false;
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noteController.text = widget.bookmark.note ?? '';
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.bookmark.wasCorrect
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
            // Header
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.bookmark.wasCorrect
                        ? const Color(0xFF10B981).withOpacity(0.1)
                        : const Color(0xFFEF4444).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.bookmark.wasCorrect ? Icons.check : Icons.close,
                        size: 14,
                        color: widget.bookmark.wasCorrect
                            ? const Color(0xFF065F46)
                            : const Color(0xFF991B1B),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.bookmark.wasCorrect ? 'Correct' : 'Incorrect',
                        style: TextStyle(
                          color: widget.bookmark.wasCorrect
                              ? const Color(0xFF065F46)
                              : const Color(0xFF991B1B),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _showNote = !_showNote;
                    });
                  },
                  icon: Icon(
                    _showNote ? Icons.note : Icons.note_add,
                    color: const Color(0xFF6B7280),
                    size: 20,
                  ),
                  tooltip: 'Add note',
                ),
                IconButton(
                  onPressed: widget.onRemove,
                  icon: const Icon(
                    Icons.bookmark_remove,
                    color: Color(0xFF6B7280),
                    size: 20,
                  ),
                  tooltip: 'Remove bookmark',
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Question
            Text(
              widget.bookmark.question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),

            // Options
            ...widget.bookmark.options.asMap().entries.map((entry) {
              final index = entry.key;
              final option = entry.value;
              final isUserAnswer = index == widget.bookmark.userAnswerIndex;
              final isCorrectAnswer =
                  index == widget.bookmark.correctAnswerIndex;

              Color backgroundColor;
              Color textColor;
              Color borderColor;
              IconData? icon;

              if (isCorrectAnswer) {
                backgroundColor = const Color(0xFF10B981).withOpacity(0.1);
                textColor = const Color(0xFF065F46);
                borderColor = const Color(0xFF10B981);
                icon = Icons.check_circle;
              } else if (isUserAnswer && !widget.bookmark.wasCorrect) {
                backgroundColor = const Color(0xFFEF4444).withOpacity(0.1);
                textColor = const Color(0xFF991B1B);
                borderColor = const Color(0xFFEF4444);
                icon = Icons.cancel;
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
                    if (icon != null)
                      Icon(icon, color: borderColor, size: 20)
                    else
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: borderColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Your answer',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),

            // Explanation
            if (widget.bookmark.explanation != null) ...[
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
                      Icons.lightbulb_outline,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.bookmark.explanation!,
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

            // Note section
            if (_showNote) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFF59E0B).withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.edit_note,
                          color: Color(0xFFD97706),
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Personal Note',
                          style: TextStyle(
                            color: Color(0xFFD97706),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _noteController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Add your personal note here...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(
                          color: Color(0xFFD97706),
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Color(0xFFD97706),
                        fontSize: 14,
                      ),
                      onChanged: (value) {
                        widget.onToggleNote(value);
                      },
                    ),
                  ],
                ),
              ),
            ],

            // Bookmark date
            const SizedBox(height: 8),
            Text(
              'Bookmarked on ${_formatDate(widget.bookmark.createdAt)}',
              style: const TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

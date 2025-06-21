import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';
import 'package:lexigo/common/constants/text_styles.dart';
import 'package:lexigo/core/presentation/widgets/brutalist_button.dart';
import 'package:lexigo/product/domain/lesson_model.dart';

@RoutePage()
class LessonDetailScreen extends StatefulWidget {
  const LessonDetailScreen({
    required this.lessonId,
    super.key,
  });
  final int lessonId;

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  Lesson? _lesson;
  int _currentSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchLessonDetail();
  }

  Future<void> _fetchLessonDetail() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // In a real app, this would be an API call
      // For now, let's create mock data
      await Future<void>.delayed(const Duration(seconds: 1));

      final mockSections = [
        LessonSection(
          id: 1,
          lessonId: widget.lessonId,
          title: 'Introduction',
          content:
              'Welcome to this lesson! In this lesson, you will learn the basics of English grammar and vocabulary.',
          contentType: 'text',
          orderIndex: 0,
        ),
        LessonSection(
          id: 2,
          lessonId: widget.lessonId,
          title: 'Key Vocabulary',
          content:
              "Let's learn some important words:\n\n• Hello - Xin chào\n• Goodbye - Tạm biệt\n• Thank you - Cảm ơn\n• Please - Làm ơn\n• Yes - Có\n• No - Không",
          contentType: 'text',
          orderIndex: 1,
        ),
        LessonSection(
          id: 3,
          lessonId: widget.lessonId,
          title: 'Listening Exercise',
          content:
              'Listen to the following conversations and answer questions.',
          contentType: 'audio',
          orderIndex: 2,
          mediaUrl: 'https://example.com/audio/conversation1.mp3',
        ),
        LessonSection(
          id: 4,
          lessonId: widget.lessonId,
          title: 'Practice',
          content:
              "Now let's practice what you've learned with some exercises.",
          contentType: 'quiz',
          orderIndex: 3,
        ),
      ];

      setState(() {
        _lesson = Lesson(
          id: widget.lessonId,
          title: 'Introduction to English',
          description: 'Learn the basics of English language',
          level: 'Beginner',
          durationMinutes: 20,
          sections: mockSections,
          coverImage: 'https://via.placeholder.com/150',
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

  void _goToNextSection() {
    if (_lesson?.sections != null &&
        _currentSectionIndex < (_lesson!.sections!.length - 1)) {
      setState(() {
        _currentSectionIndex++;
      });
    } else {
      // Lesson completed - show completion dialog
      _showCompletionDialog();
    }
  }

  void _goToPreviousSection() {
    if (_currentSectionIndex > 0) {
      setState(() {
        _currentSectionIndex--;
      });
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.background,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
          ),
        ),
        title: const Text(
          'LESSON COMPLETED!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.brutalistYellow,
                border: Border.all(
                  width: 3,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "You've completed this lesson. Great job!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '+50 POINTS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.brutalistRed,
              ),
            ),
          ],
        ),
        actions: [
          BrutalistButton(
            text: 'CONTINUE',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContent(LessonSection section) {
    switch (section.contentType) {
      case 'text':
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            section.content,
            style: AppTextStyles.bodyMedium,
          ),
        );
      case 'audio':
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                section.content,
                style: AppTextStyles.bodyMedium,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.play_circle_filled),
                    iconSize: 40,
                    onPressed: () {
                      // Play audio logic would go here
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(),
                      ),
                      child: const LinearProgressIndicator(
                        value: 0,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 'quiz':
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                section.content,
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 24),
              BrutalistButton(
                text: 'Start Quiz',
                onPressed: () {
                  // Navigate to quiz screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(quizId: 1),
                    ),
                  );
                },
                backgroundColor: AppColors.brutalistRed,
              ),
            ],
          ),
        );
      default:
        return const Center(
          child: Text('Unsupported content type'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          _lesson?.title.toUpperCase() ?? 'LESSON',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_errorMessage',
                        style: const TextStyle(color: AppColors.error),
                      ),
                      const SizedBox(height: 16),
                      BrutalistButton(
                        text: 'Try Again',
                        onPressed: _fetchLessonDetail,
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
                        vertical: 8,
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Text(
                            'PROGRESS: ${_currentSectionIndex + 1}/${_lesson!.sections!.length}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              height: 16,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                ),
                              ),
                              child: LinearProgressIndicator(
                                value: (_currentSectionIndex + 1) /
                                    _lesson!.sections!.length,
                                backgroundColor: Colors.white,
                                color: AppColors.brutalistRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Section Title
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: AppColors.brutalistYellow,
                      child: Text(
                        _lesson!.sections![_currentSectionIndex].title
                            .toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Section Content
                    Expanded(
                      child: SingleChildScrollView(
                        child: _buildSectionContent(
                          _lesson!.sections![_currentSectionIndex],
                        ),
                      ),
                    ),

                    // Navigation Buttons
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_currentSectionIndex > 0)
                            BrutalistButton(
                              text: 'Previous',
                              onPressed: _goToPreviousSection,
                              width: 120,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                            )
                          else
                            const SizedBox(width: 120),
                          BrutalistButton(
                            text: _currentSectionIndex <
                                    (_lesson!.sections!.length - 1)
                                ? 'Next'
                                : 'Finish',
                            onPressed: _goToNextSection,
                            width: 120,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    // This is a placeholder. The full implementation of the quiz screen
    // will be in a separate file.
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ'),
      ),
      body: const Center(
        child: Text('Quiz content will go here'),
      ),
    );
  }
}

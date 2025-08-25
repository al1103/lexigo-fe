import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/screen/level_selection/controller/level_lesson_controller.dart';
import 'package:lexigo/screen/level_selection/model/lessons_model.dart';

@RoutePage()
class LevelSelectionScreen extends ConsumerStatefulWidget {
  const LevelSelectionScreen({super.key});

  @override
  ConsumerState<LevelSelectionScreen> createState() =>
      _LevelSelectionScreenState();
}

class _LevelSelectionScreenState extends ConsumerState<LevelSelectionScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    // Refresh level lessons data
    ref.invalidate(levelLessonControllerProvider);

    // Wait for levels data to reload
    await ref.read(levelLessonControllerProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    final lessonsAsync = ref.watch(levelLessonControllerProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            stops: [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              _buildHeader(),

              // Content
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
                  child: lessonsAsync.when(
                    data: _buildLessonsContent,
                    loading: _buildLoadingState,
                    error: (error, stack) => _buildErrorState(error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
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
          const Expanded(
            child: Text(
              'Choose Your Level',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
                size: 18,
              ),
              onPressed: () => ref.refresh(levelLessonControllerProvider),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsContent(List<LessonsModel>? lessonsModel) {
    if (lessonsModel == null || lessonsModel.isEmpty) {
      return _buildEmptyState();
    }

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // Title với count
                  Text(
                    'Available Levels (${lessonsModel.length})',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select a level to start learning new vocabulary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Levels List
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        itemCount: lessonsModel.length,
                        itemBuilder: (context, index) {
                          return _buildLevelCard(lessonsModel[index], index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLevelCard(LessonsModel level, int index) {
    final levelColor = _getLevelColor(level.color);
    final isActive = level.isActive ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: isActive
            ? () => _navigateToWordLearning(level)
            : () => _showNotAvailableDialog(level),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 100)),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.grey[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isActive
                    ? levelColor.withValues(alpha: 0.15)
                    : Colors.grey.withValues(alpha: 0.5),
                blurRadius: isActive ? 15 : 5,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: isActive
                  ? levelColor.withValues(alpha: 0.3)
                  : Colors.grey[300]!,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              // Level Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isActive
                      ? levelColor.withValues(alpha: 0.1)
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: isActive
                      ? Text(
                          level.icon ?? '📚',
                          style: const TextStyle(fontSize: 28),
                        )
                      : Icon(
                          Icons.lock,
                          color: Colors.grey[400],
                          size: 28,
                        ),
                ),
              ),
              const SizedBox(width: 16),

              // Level Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            level.levelName ??
                                level.levelNameVi ??
                                'Unnamed Level',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: isActive
                                  ? const Color(0xFF1F2937)
                                  : Colors.grey[500],
                            ),
                          ),
                        ),
                        if (isActive && level.levelCode != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: levelColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              level.levelCode!.toUpperCase(),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: levelColor,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      level.description ??
                          level.descriptionVi ??
                          'No description available',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (level.minScore != null &&
                            level.maxScore != null) ...[
                          Icon(
                            Icons.emoji_events_outlined,
                            size: 16,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Score: ${level.minScore} - ${level.maxScore}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                        const Spacer(),
                        if (level.sortOrder != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '#${level.sortOrder}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // Arrow Icon
              Icon(
                isActive ? Icons.arrow_forward_ios : Icons.lock_outline,
                color: isActive ? levelColor : Colors.grey[400],
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6366F1)),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading Levels...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(dynamic error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red[400],
            ),
            const SizedBox(height: 16),
            const Text(
              'Oops! Something went wrong',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Unable to load levels. Please check your connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => ref.refresh(levelLessonControllerProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '📚',
              style: TextStyle(fontSize: 64),
            ),
            const SizedBox(height: 16),
            const Text(
              'No Levels Available',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'There are no levels available at the moment. Please check back later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getLevelColor(String? colorHex) {
    if (colorHex == null || colorHex.isEmpty) {
      return const Color(0xFF6366F1);
    }

    try {
      // Remove # if present and ensure it's 6 characters
      final cleanHex = colorHex.replaceAll('#', '');
      if (cleanHex.length == 6) {
        return Color(int.parse('FF$cleanHex', radix: 16));
      }
    } catch (e) {
      // If parsing fails, return default color
    }

    return const Color(0xFF6366F1);
  }

  void _navigateToWordLearning(LessonsModel level) {
    context.pushRoute(
      WordLearningRoute(levelId: level.id ?? 0),
    );
  }

  void _showNotAvailableDialog(LessonsModel level) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.lock, color: Colors.grey[600]),
            const SizedBox(width: 8),
            const Text('Level Not Available'),
          ],
        ),
        content: const Text(
          'This level is not active yet. Please check back later or contact support.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

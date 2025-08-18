import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/theme/theme_helper.dart';
import 'package:lexigo/common/widgets/app_toast.dart';
import 'package:lexigo/common/widgets/common_tab_bar.dart';
import 'package:lexigo/screen/home/controller/quotes_controller.dart';
import 'package:lexigo/screen/profile/controller/profile_controller.dart';
import 'package:lexigo/screen/speaking/speaking_level_selection_screen.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Khởi tạo toast cho màn hình này
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppToast.init(context);
    });

    return Scaffold(
      bottomNavigationBar: const CommonTabBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [
                    ThemeHelper.getBackgroundColor(context),
                    ThemeHelper.getPrimaryColor(context).withValues(alpha: 0.3),
                    ThemeHelper.getPrimaryColor(context).withValues(alpha: 0.1),
                  ]
                : [
                    const Color(0xFF667EEA),
                    const Color(0xFF764BA2),
                    const Color(0xFF8B5CF6),
                  ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header nâng cao
              _buildEnhancedHeader(context),

              // Nội dung chính
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: ThemeHelper.getBackgroundColor(context),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),

                        // Quote động viên - Phần hero
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: _buildHeroQuote(),
                        ),
                        const SizedBox(height: 32),

                        // Tổng quan thống kê
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: _buildStatsOverview(),
                        ),
                        const SizedBox(height: 32),

                        // Lộ trình học tập
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildModernSectionTitle(
                                'Lộ trình học tập',
                                '🚀',
                              ),
                              const SizedBox(height: 16),
                              _buildLearningPaths(context),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Today's Challenge
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20),
                        //   child: _buildTodayChallenge(),
                        // ),
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedHeader(BuildContext context) {
    final profileAsync = ref.watch(profileControllerProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Row(
        children: [
          // User avatar and greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white..withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '👋',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreeting(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: 2),
                          profileAsync.when(
                            data: (userInfo) => Text(
                              userInfo?.fullName ?? 'Chào mừng trở lại!',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            loading: () => Container(
                              width: 120,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.white..withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            error: (_, __) => const Text(
                              'Chào mừng trở lại!',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Notification and settings
          Row(
            children: [
              InkWell(
                onTap: () => context.router.pushNamed('/ranking'),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.emoji_events,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Chào buổi sáng! 🌅';
    } else if (hour < 17) {
      return 'Chào buổi chiều! ☀️';
    } else {
      return 'Chào buổi tối! 🌙';
    }
  }

  Widget _buildHeroQuote() {
    final quotesAsync = ref.watch(quotesControllerProvider).value;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ThemeHelper.getPrimaryColor(context),
            ThemeHelper.getPrimaryColor(context).withValues(alpha: 0.8),
            ThemeHelper.getPrimaryColor(context).withValues(alpha: 0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.getPrimaryColor(context).withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: quotesAsync == null
          ? const Center(
              child: SizedBox(
                height: 60,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Cảm hứng hàng ngày',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  quotesAsync.content ??
                      '"The only way to do great work is to love what you do."',
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '— ${quotesAsync.author ?? 'Không rõ'}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildStatsOverview() {
    final profileAsync = ref.watch(profileControllerProvider);

    return profileAsync.when(
      data: (userInfo) => Row(
        children: [
          Expanded(
            child: _buildStatCard(
              '📚',
              '${userInfo?.wordsMastered ?? 0}',
              'Từ đã thành thạo',
              ThemeHelper.getSuccessColor(context),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              '🔥',
              '${userInfo?.streakDays ?? 0}',
              'Chuỗi ngày',
              const Color(0xFFEF4444),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              '⭐',
              _formatPoints(userInfo?.totalPoints ?? 0),
              'Điểm XP',
              const Color(0xFFF59E0B),
            ),
          ),
        ],
      ),
      loading: () => Row(
        children: [
          Expanded(child: _buildLoadingStatCard()),
          const SizedBox(width: 16),
          Expanded(child: _buildLoadingStatCard()),
          const SizedBox(width: 16),
          Expanded(child: _buildLoadingStatCard()),
        ],
      ),
      error: (_, __) => Row(
        children: [
          Expanded(
            child: _buildStatCard(
              '📚',
              '0',
              'Từ đã thành thạo',
              ThemeHelper.getSuccessColor(context),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              '🔥',
              '0',
              'Chuỗi ngày',
              const Color(0xFFEF4444),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildStatCard('⭐', '0', 'Điểm XP', const Color(0xFFF59E0B)),
          ),
        ],
      ),
    );
  }

  String _formatPoints(int points) {
    if (points >= 1000000) {
      return '${(points / 1000000).toStringAsFixed(1)}M';
    } else if (points >= 1000) {
      return '${(points / 1000).toStringAsFixed(1)}k';
    }
    return points.toString();
  }

  Widget _buildLoadingStatCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey..withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.grey..withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 40,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey..withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 60,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.grey..withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String emoji, String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color..withValues(alpha: 0.05), // lighter shadow
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border:
            Border.all(color: color..withValues(alpha: 0.05)), // lighter border
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildModernQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildModernSectionTitle('Bắt đầu nhanh', '⚡'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildModernActionCard(
                '🎯',
                'Quiz hàng ngày',
                'Kiểm tra kỹ năng',
                const Color(0xFF6366F1),
                () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildModernActionCard(
                '💬',
                'Gia sư AI',
                'Trò chuyện & học',
                const Color(0xFF8B5CF6),
                () => AutoRouter.of(context).pushNamed('/chat'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildModernActionCard(
    String emoji,
    String title,
    String subtitle,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withValues(alpha: 0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color..withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(emoji, style: const TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernSectionTitle(String title, String emoji) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }

  Widget _buildLearningPaths(BuildContext context) {
    final profileAsync = ref.watch(profileControllerProvider);

    return profileAsync.when(
      data: (userInfo) => Column(
        children: [
          _buildLearningPathCard(
            '📝',
            'Thành thạo từ vựng',
            'Xây dựng vốn từ vựng',
            '${userInfo?.wordsMastered ?? 0} từ đã thành thạo',
            const Color(0xFF3B82F6),
            _calculateVocabularyProgress(userInfo?.wordsMastered ?? 0),
            () => AutoRouter.of(context).pushNamed('/levelSelection'),
          ),
          const SizedBox(height: 16),
          _buildLearningPathCard(
            '🗣️',
            'Luyện phát âm',
            'Hoàn thiện cách phát âm',
            '${userInfo?.speakingTotalSessions ?? 0} phiên • TB: ${userInfo?.speakingAverageScore ?? "0"}%',
            const Color(0xFFEF4444),
            _calculateSpeakingProgress(userInfo?.speakingTotalSessions ?? 0),
            () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const SpeakingLevelSelectionScreen(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLearningPathCard(
            '📖',
            'Bậc thầy Quiz',
            'Kiểm tra kiến thức',
            '${userInfo?.quizTotalQuestions ?? 0} câu hỏi • ${userInfo?.quizCorrectAnswers ?? 0} đúng',
            const Color(0xFF10B981),
            _calculateQuizProgress(
              userInfo?.quizCorrectAnswers ?? 0,
              userInfo?.quizTotalQuestions ?? 0,
            ),
            () => AutoRouter.of(context).pushNamed('/chat'),
          ),
          const SizedBox(height: 16),
          _buildLearningPathCard(
            '📷',
            'Quét đối tượng',
            'Học từ vựng từ camera',
            'Nhận diện và học từ vựng',
            const Color(0xFF3B82F6),
            _calculateVocabularyProgress(userInfo?.wordsMastered ?? 0),
            () => AutoRouter.of(context).pushNamed('/camera'),
          ),
        ],
      ),
      loading: () => Column(
        children: [
          _buildLoadingLearningCard(),
          const SizedBox(height: 16),
          _buildLoadingLearningCard(),
          const SizedBox(height: 16),
          _buildLoadingLearningCard(),
        ],
      ),
      error: (_, __) => Column(
        children: [
          _buildLearningPathCard(
            '📝',
            'Thành thạo từ vựng',
            'Xây dựng vốn từ vựng',
            '0 từ đã thành thạo',
            const Color(0xFF3B82F6),
            0,
            () => AutoRouter.of(context).pushNamed('/levelSelection'),
          ),
          const SizedBox(height: 16),
          _buildLearningPathCard(
            '🗣️',
            'Luyện phát âm',
            'Hoàn thiện cách phát âm',
            '0 phiên đã hoàn thành',
            const Color(0xFFEF4444),
            0,
            () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const SpeakingLevelSelectionScreen(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLearningPathCard(
            '📖',
            'Bậc thầy Quiz',
            'Kiểm tra kiến thức',
            '0 câu hỏi đã trả lời',
            const Color(0xFF10B981),
            0,
            () => AutoRouter.of(context).pushNamed('/chat'),
          ),
        ],
      ),
    );
  }

  double _calculateVocabularyProgress(int wordsMastered) {
    // Calculate progress based on words mastered (target: 100 words = 100%)
    const targetWords = 100;
    final progress = wordsMastered / targetWords;
    return progress > 1.0 ? 1.0 : progress;
  }

  double _calculateSpeakingProgress(int sessions) {
    // Calculate progress based on sessions (target: 20 sessions = 100%)
    const targetSessions = 20;
    final progress = sessions / targetSessions;
    return progress > 1.0 ? 1.0 : progress;
  }

  double _calculateQuizProgress(int correctAnswers, int totalQuestions) {
    // Calculate progress based on accuracy (target: 80% accuracy = 100%)
    if (totalQuestions == 0) return 0;
    final accuracy = correctAnswers / totalQuestions;
    final progress = accuracy / 0.8; // 80% target
    return progress > 1.0 ? 1.0 : progress;
  }

  Widget _buildLoadingLearningCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey..withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey..withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 160,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.grey..withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.grey..withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.grey..withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningPathCard(
    String emoji,
    String title,
    String description,
    String progress,
    Color color,
    double progressValue,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color..withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    progress,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: color..withValues(alpha: 0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayChallenge() {
    final profileAsync = ref.watch(profileControllerProvider);

    return profileAsync.when(
      data: (userInfo) {
        // Calculate daily progress based on study time and points
        const dailyTargetPoints = 50; // Target points per day
        const dailyTargetTime = 1800; // Target: 30 minutes (1800 seconds)

        final currentPoints = userInfo?.totalPoints ?? 0;
        final studyTime = userInfo?.totalStudyTime ?? 0;

        // Calculate progress based on both points and study time
        final pointsProgress =
            (currentPoints % dailyTargetPoints) / dailyTargetPoints;
        final timeProgress = (studyTime % dailyTargetTime) / dailyTargetTime;
        final overallProgress = (pointsProgress + timeProgress) / 2;

        final studyMinutes = (studyTime / 60).round();

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF059669),
                ThemeHelper.getSuccessColor(context),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color:
                    ThemeHelper.getSuccessColor(context).withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text('🏆', style: TextStyle(fontSize: 24)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tiến độ học tập',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cấp độ: ${userInfo?.currentLevel?.toUpperCase() ?? "CƠ BẢN"} • $studyMinutes phút đã học',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Stats Row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng điểm: $currentPoints',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Độ chính xác Quiz: ${userInfo?.quizAverageScore ?? "0"}%',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value:
                                overallProgress > 1.0 ? 1.0 : overallProgress,
                            backgroundColor:
                                Colors.white.withValues(alpha: 0.4),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            minHeight: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () =>
                        AutoRouter.of(context).pushNamed('/levelSelection'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'Tiếp tục',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF059669),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      loading: () => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey..withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
      error: (_, __) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF059669),
              Color(0xFF10B981),
            ],
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF10B981)..withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text('🏆', style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tiến độ học tập',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Bắt đầu hành trình học tập',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sẵn sàng bắt đầu?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: LinearProgressIndicator(
                          value: 0,
                          backgroundColor: Colors.white24,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () =>
                      AutoRouter.of(context).pushNamed('/levelSelection'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Bắt đầu',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF059669),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

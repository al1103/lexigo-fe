import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/common/widgets/loading_widget.dart';
import 'package:lexigo/screen/ranking/controller/ranking_controller.dart';
import 'package:lexigo/screen/ranking/models/leaderboard_user.dart';

@RoutePage()
class RankingScreen extends ConsumerStatefulWidget {
  const RankingScreen({super.key});

  @override
  ConsumerState<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends ConsumerState<RankingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen to tab changes
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

            // Tab Bar
            _buildTabBar(),

            // Content
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFBBF24).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.maybePop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Leaderboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.white,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: const Color(0xFF6366F1),
          borderRadius: BorderRadius.circular(10),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'Global'),
          Tab(text: 'Weekly'),
          Tab(text: 'Monthly'),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        // Global Tab
        Consumer(
          builder: (context, ref, child) {
            final globalState = ref.watch(rankingControllerProvider);
            return globalState.when(
              data: (List<LeaderboardUser> data) =>
                  _buildRankingContent(data, 'global'),
              loading: () => const Center(
                child: AppLoading(message: 'Loading global rankings...'),
              ),
              error: (Object error, StackTrace stack) =>
                  _buildErrorState('global', error),
            );
          },
        ),

        // Weekly Tab
        Consumer(
          builder: (context, ref, child) {
            final weeklyState = ref.watch(rankingControllerProvider);
            return weeklyState.when(
              data: (List<LeaderboardUser> data) =>
                  _buildRankingContent(data, 'weekly'),
              loading: () => const Center(
                child: AppLoading(message: 'Loading weekly rankings...'),
              ),
              error: (Object error, StackTrace stack) =>
                  _buildErrorState('weekly', error),
            );
          },
        ),

        // Monthly Tab
        Consumer(
          builder: (context, ref, child) {
            final monthlyState = ref.watch(rankingControllerProvider);
            return monthlyState.when(
              data: (List<LeaderboardUser> data) =>
                  _buildRankingContent(data, 'monthly'),
              loading: () => const Center(
                child: AppLoading(message: 'Loading monthly rankings...'),
              ),
              error: (Object error, StackTrace stack) =>
                  _buildErrorState('monthly', error),
            );
          },
        ),
      ],
    );
  }

  Widget _buildErrorState(String period, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading $period rankings',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Refresh the appropriate provider based on period
              if (period == 'weekly') {
                ref.invalidate(rankingControllerProvider);
              } else if (period == 'monthly') {
                ref.invalidate(rankingControllerProvider);
              } else {
                ref.invalidate(rankingControllerProvider);
              }
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingContent(
    List<LeaderboardUser> leaderboard,
    String period,
  ) {
    print('Building123 $leaderboard');
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Top 3 Podium
          _buildPodium(leaderboard),

          const SizedBox(height: 24),

          // Your Position (without userRank data for now)
          _buildYourPosition(null, period),

          const SizedBox(height: 24),

          // Full Ranking List
          _buildRankingList(leaderboard),
        ],
      ),
    );
  }

  Widget _buildPodium(List<LeaderboardUser> leaderboard) {
    // Lấy top 3 users
    final top3 = leaderboard.take(3).toList();
    if (top3.length < 3) {
      // Nếu không đủ 3 users, hiển thị placeholder
      return _buildEmptyPodium();
    }

    return Container(
      constraints: const BoxConstraints(
        minHeight: 200,
        maxHeight: 250,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 2nd Place
          _buildPodiumPlace(
            rank: '2',
            name: top3[1].fullName ?? top3[1].username ?? 'User',
            points: '${top3[1].totalPoints ?? top3[1].periodPoints ?? 0} XP',
            height: 80,
            color: const Color(0xFFC0C0C0),
          ),
          // 1st Place
          _buildPodiumPlace(
            rank: '1',
            name: top3[0].fullName ?? top3[0].username ?? 'User',
            points: '${top3[0].totalPoints ?? top3[0].periodPoints ?? 0} XP',
            height: 120,
            color: const Color(0xFFFFD700),
            isFirst: true,
          ),
          // 3rd Place
          _buildPodiumPlace(
            rank: '3',
            name: top3[2].fullName ?? top3[2].username ?? 'User',
            points: '${top3[2].totalPoints ?? top3[2].periodPoints ?? 0} XP',
            height: 60,
            color: const Color(0xFFCD7F32),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPodium() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'No ranking data available',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPodiumPlace({
    required String rank,
    required String name,
    required String points,
    required double height,
    required Color color,
    bool isFirst = false,
  }) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar with Crown for 1st place
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: color,
                    width: 3,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              if (isFirst)
                Positioned(
                  top: -8,
                  left: 15,
                  child: Icon(
                    Icons.emoji_events,
                    color: color,
                    size: 30,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            points,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.8),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          // Podium Base
          Container(
            width: 80,
            height: height,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.3),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
            child: Center(
              child: Text(
                rank,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourPosition(String? userRank, String period) {
    final rank = userRank ?? '--';
    final hasRankData = userRank != null;

    // Xác định title dựa trên period
    String title;
    Color periodColor;
    switch (period) {
      case 'weekly':
        title = 'Your Weekly Position';
        periodColor = const Color(0xFFF59E0B);
      case 'monthly':
        title = 'Your Monthly Position';
        periodColor = const Color(0xFF8B5CF6);
      default:
        title = 'Your Global Position';
        periodColor = const Color(0xFF6366F1);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: periodColor..withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: periodColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: periodColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                rank,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: periodColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              Icons.person,
              color: periodColor,
              size: 24,
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
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${period.replaceFirst(period[0], period[0].toUpperCase())} Leaderboard',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: hasRankData
                  ? const Color(0xFF10B981)
                  : const Color(0xFF6B7280),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.emoji_events,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingList(List<LeaderboardUser> leaderboard) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey..withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: leaderboard.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.grey[200],
        ),
        itemBuilder: (context, index) {
          final user = leaderboard[index];
          final isTop3 = index < 3;

          return Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Rank
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isTop3
                        ? _getRankColor(index).withValues(alpha: 0.2)
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: isTop3
                        ? Icon(
                            Icons.emoji_events,
                            color: _getRankColor(index),
                            size: 20,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[600],
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 16),

                // Avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1)..withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF6366F1),
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),

                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName ?? user.username ?? 'User',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user.level ?? 'Beginner',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                // Points and Rank Change
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${user.totalPoints ?? user.periodPoints ?? 0} XP',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF6366F1),
                      ),
                    ),
                    if (user.rank != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: user.rank!.contains('↑')
                              ? const Color(0xFF10B981)
                              : user.rank!.contains('↓')
                                  ? const Color(0xFFEF4444)
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          user.rank!,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getRankColor(int index) {
    switch (index) {
      case 0:
        return const Color(0xFFFFD700); // Gold
      case 1:
        return const Color(0xFFC0C0C0); // Silver
      case 2:
        return const Color(0xFFCD7F32); // Bronze
      default:
        return Colors.grey;
    }
  }
}

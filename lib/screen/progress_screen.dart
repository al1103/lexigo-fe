import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';
import 'package:lexigo/common/constants/text_styles.dart';
import 'package:lexigo/core/presentation/widgets/cute_card.dart';
import 'package:lexigo/core/presentation/widgets/cute_header.dart';
import 'package:lexigo/l10n/generated/l10n.dart';

@RoutePage()
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header with coins/gems
            const CuteHeader(
              coins: 1000,
              accessory: 'frog_hat',
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User level card
                    CuteCard(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white.withOpacity(0.4),
                                child: const CircleAvatar(
                                  radius: 28,
                                  backgroundColor: AppColors.primaryDark,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.progressYourLevel,
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      l10n.progressIntermediateLearner,
                                      style: AppTextStyles.heading3.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            l10n.progressNextLevel(250),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  l10n.progressPoints(750),
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Statistics Grid
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.5,
                      children: [
                        _buildStatCard(
                          icon: Icons.school,
                          title: l10n.progressLessons,
                          value: '7',
                          color: AppColors.yellow,
                        ),
                        _buildStatCard(
                          icon: Icons.menu_book,
                          title: l10n.progressVocabulary,
                          value: '120',
                          color: AppColors.green,
                        ),
                        _buildStatCard(
                          icon: Icons.local_fire_department,
                          title: l10n.progressStreak,
                          value: '5 days',
                          color: AppColors.pink,
                        ),
                        _buildStatCard(
                          icon: Icons.timer,
                          title: l10n.progressStudyTime,
                          value: '3.5 hrs',
                          color: AppColors.purple,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return CuteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.heading3.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}

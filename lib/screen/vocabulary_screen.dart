import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';
import 'package:lexigo/common/constants/text_styles.dart';
import 'package:lexigo/core/presentation/widgets/cute_avatar.dart';
import 'package:lexigo/core/presentation/widgets/cute_button.dart';
import 'package:lexigo/core/presentation/widgets/cute_card.dart';
import 'package:lexigo/core/presentation/widgets/cute_header.dart';

@RoutePage()
class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    // Quiz section header
                    const Text(
                      'Quizzes',
                      style: AppTextStyles.heading3,
                    ),
                    const SizedBox(height: 16),

                    // User selection area
                    CuteCard(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Guest user
                              Expanded(
                                child: Column(
                                  children: [
                                    const CuteAvatar(
                                      size: 70,
                                      accessory: 'frog_hat',
                                      backgroundColor: AppColors.primaryLight,
                                      icon: Icons.person,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '#Guest',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.public,
                                          size: 14,
                                          color: AppColors.textSecondary,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'EN',
                                          style: AppTextStyles.caption,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // Second user (Bi)
                              Expanded(
                                child: Column(
                                  children: [
                                    const Stack(
                                      children: [
                                        CuteAvatar(
                                          size: 70,
                                          accessory: 'cloud_hat',
                                          backgroundColor:
                                              AppColors.primaryLight,
                                          icon: Icons.person,
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CountryBadge(
                                            countryCode: 'vn',
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Bi',
                                      style: AppTextStyles.bodyMedium.copyWith(
                                        fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 24),

                    // Quiz numbers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(10, (index) {
                        return Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color:
                                index == 0 ? AppColors.primary : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.3),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: index == 0
                                    ? Colors.white
                                    : AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 24),

                    // Japanese quiz question
                    Text(
                      '彼は社内の情報___から得た情報をわざと漏洩した。',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Progress indicator
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.error,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Text(
                        '1',
                        style: AppTextStyles.caption,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Answer options
                    _buildAnswerOption('視', false),
                    const SizedBox(height: 12),
                    _buildAnswerOption('網', true),
                    const SizedBox(height: 12),
                    _buildAnswerOption('派', false),
                    const SizedBox(height: 12),
                    _buildAnswerOption('圏', false),

                    const SizedBox(height: 24),

                    // Audio controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CuteIconButton(
                          icon: Icons.volume_up,
                          onPressed: () {},
                          backgroundColor: AppColors.primaryLight,
                          size: 50,
                        ),
                        CuteIconButton(
                          icon: Icons.mic,
                          onPressed: () {},
                          backgroundColor: AppColors.primaryLight,
                          size: 50,
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                        CuteIconButton(
                          icon: Icons.star,
                          onPressed: () {},
                          backgroundColor: AppColors.primaryLight,
                          size: 50,
                        ),
                        CuteIconButton(
                          icon: Icons.settings,
                          onPressed: () {},
                          backgroundColor: AppColors.primaryLight,
                          size: 50,
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

  Widget _buildAnswerOption(String text, bool isSelected) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.green : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? AppColors.green : Colors.grey.shade300,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.bodyLarge.copyWith(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

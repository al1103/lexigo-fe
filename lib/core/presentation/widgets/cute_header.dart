import 'package:flutter/material.dart';
import 'package:lexigo/common/constants/colors.dart';
import 'package:lexigo/common/constants/text_styles.dart';
import 'package:lexigo/core/presentation/widgets/cute_avatar.dart';
import 'package:lexigo/gen/assets.gen.dart';

class CuteHeader extends StatelessWidget {
  const CuteHeader({
    this.coins = 0,
    this.gems = 0,
    this.avatarUrl,
    this.onAvatarTap,
    this.onAddCoins,
    this.onAddGems,
    this.accessory,
    super.key,
  });
  final int coins;
  final int gems;
  final String? avatarUrl;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onAddCoins;
  final VoidCallback? onAddGems;
  final String? accessory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // User Avatar
          CuteAvatar(
            imageUrl: avatarUrl,
            accessory: accessory,
            onTap: onAvatarTap,
            icon: Icons.person,
          ),

          const Spacer(),

          // Coins
          _buildCurrency(
            icon: Assets.icons.icMoney.path,
            value: coins,
            color: Colors.transparent,
            onAdd: onAddCoins,
          ),

          const SizedBox(width: 10),

          // Gems
          _buildCurrency(
            icon: Icons.diamond,
            value: gems,
            color: AppColors.purple,
            onAdd: onAddGems,
          ),
        ],
      ),
    );
  }

  Widget _buildCurrency({
    required int value,
    required Color color,
    dynamic icon,
    VoidCallback? onAdd,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color..withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: icon is IconData
                ? Icon(icon, color: Colors.white, size: 18)
                : Image.asset(
                    icon as String,
                    width: 18,
                    height: 18,
                  ),
          ),
          const SizedBox(width: 8),
          Text(
            value.toString(),
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (onAdd != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onAdd,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CuteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CuteAppBar({
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.onBackPressed,
    super.key,
  });
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onBackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white..withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.heading3.copyWith(
          color: textColor,
        ),
      ),
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/gen/assets.gen.dart';

class CommonTabBar extends StatelessWidget {
  const CommonTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTabItem(
              context,
              'Trang chủ',
              Assets.icons.icLearn,
              const HomeRoute(),
            ),
            _buildTabItem(
              context,
              'Ngữ pháp',
              Assets.icons.icStories,
              const GrammarListRoute(),
            ),
            _buildTabItem(
              context,
              'Đánh dấu',
              Assets.icons.icStories,
              const BookmarksRoute(),
            ),
            _buildTabItem(
              context,
              'Hồ sơ',
              Assets.icons.icProfile,
              const ProfileRoute(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context,
    String label,
    SvgGenImage icon,
    PageRouteInfo route,
  ) {
    final isActive = context.router.current.name == route.routeName;

    return GestureDetector(
      onTap: () => context.router.replace(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF6366F1).withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF6366F1).withValues(alpha: 0.15)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: icon.svg(
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isActive ? const Color(0xFF6366F1) : Colors.grey.shade600,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color:
                    isActive ? const Color(0xFF6366F1) : Colors.grey.shade600,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

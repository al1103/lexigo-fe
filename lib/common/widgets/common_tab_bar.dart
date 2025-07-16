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
              'Home',
              Assets.icons.icLearn,
              const HomeRoute(),
            ),
            _buildTabItem(
              context,
              'History',
              Assets.icons.icStories,
              const HistoryRoute(),
            ),
            _buildTabItem(
              context,
              'Bookmark',
              Assets.icons.icNotifications,
              const BookmarksRoute(),
            ),
            _buildTabItem(
              context,
              'Profile',
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
          color: isActive ? Colors.blue.shade50 : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive ? Colors.blue.shade100 : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: icon.svg(
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 12,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? Colors.blue.shade700 : Colors.grey.shade600,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

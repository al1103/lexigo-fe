import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/routes/app_route.dart';
import 'package:lexigo/gen/assets.gen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.4),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            context,
            'Learn',
            Assets.icons.icLearn,
            const HomeRoute(),
          ),
          _buildNavItem(
            context,
            'Practice',
            Assets.icons.icPractice,
            const ProfileRoute(),
          ),
          _buildNavItem(
            context,
            'Stories',
            Assets.icons.icStories,
            const ProfileRoute(),
          ),
          _buildNavItem(
            context,
            'Profile',
            Assets.icons.icProfile,
            const ProfileRoute(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String label,
    SvgGenImage icon,
    PageRouteInfo route,
  ) {
    return GestureDetector(
      onTap: () => context.router.replace(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon.svg(
            width: 24,
            height: 24,
            color: context.router.current.name == route.routeName
                ? Colors.blue
                : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.router.current.name == route.routeName
                  ? Colors.blue
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

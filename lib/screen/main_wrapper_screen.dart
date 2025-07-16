import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/bookmarks/presentation/pages/bookmarks_page.dart';
import 'package:lexigo/common/widgets/common_tab_bar.dart';
import 'package:lexigo/screen/history/history_screen.dart';
import 'package:lexigo/screen/home/home_screen.dart';
import 'package:lexigo/screen/profile/profile_screen.dart';

@RoutePage()
class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  final int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const HistoryScreen(),
    const BookmarksPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: const CommonTabBar(),
    );
  }
}

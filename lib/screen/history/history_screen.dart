import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lexigo/common/widgets/common_tab_bar.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<void> _handleRefresh() async {
    // Simulate refresh delay
    await Future<void>.delayed(const Duration(seconds: 1));

    // In a real app, you would refresh history data here
    // e.g., call an API or update from a data source
    if (mounted) {
      setState(() {
        // Trigger rebuild to show refreshed data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CommonTabBar(),
      appBar: AppBar(
        title: const Text(
          'Lịch sử học tập',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
      ),
      body: ColoredBox(
        color: Colors.blue.shade50,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildHistoryItem(
                'Bài học số 1: Từ vựng cơ bản',
                'Hoàn thành: 15 từ',
                '2 giờ trước',
                Colors.green,
              ),
              const SizedBox(height: 12),
              _buildHistoryItem(
                'Bài học số 2: Ngữ pháp',
                'Điểm số: 85/100',
                '5 giờ trước',
                Colors.orange,
              ),
              const SizedBox(height: 12),
              _buildHistoryItem(
                'Bài học số 3: Luyện nghe',
                'Hoàn thành: 10 câu hỏi',
                'Hôm qua',
                Colors.blue,
              ),
              const SizedBox(height: 12),
              _buildHistoryItem(
                'Bài học số 4: Từ vựng nâng cao',
                'Hoàn thành: 20 từ',
                '2 ngày trước',
                Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(
    String title,
    String subtitle,
    String time,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey..withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

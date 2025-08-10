import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/presentation/view_status.dart';
import 'package:lexigo/screen/grammar/controller/grammar_controller.dart';

@RoutePage()
class GrammarDetailScreen extends ConsumerStatefulWidget {
  const GrammarDetailScreen({required this.id, super.key});
  final int id;

  @override
  ConsumerState<GrammarDetailScreen> createState() =>
      _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends ConsumerState<GrammarDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Load article details when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(grammarNotifierProvider.notifier).getArticleDetails(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(grammarNotifierProvider);
    final controller = ref.read(grammarNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết ngữ pháp'),
      ),
      body: state.status is ViewLoading
          ? const Center(child: CircularProgressIndicator())
          : state.status is ViewError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Có lỗi xảy ra: ${state.error ?? 'Lỗi không xác định'}',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            controller.getArticleDetails(widget.id),
                        child: const Text('Thử lại'),
                      ),
                    ],
                  ),
                )
              : state.selectedArticle == null
                  ? const Center(
                      child: Text('Không tìm thấy bài viết'),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.selectedArticle?.title ?? 'Không có tiêu đề',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              if (state.selectedArticle?.difficultyLevel !=
                                  null)
                                _buildDifficultyChip(
                                  state.selectedArticle!.difficultyLevel,
                                ),
                              if (state.selectedArticle?.category?.isNotEmpty ==
                                  true)
                                _buildCategoryChip(
                                  state.selectedArticle!.category!,
                                ),
                              if (state.selectedArticle?.readingTime != null)
                                _buildReadingTimeChip(
                                  state.selectedArticle!.readingTime!,
                                ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            state.selectedArticle?.content ??
                                'Không có nội dung',
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                          if (state.selectedArticle?.tags?.isNotEmpty ==
                              true) ...[
                            const SizedBox(height: 32),
                            Text(
                              'Thẻ:',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: state.selectedArticle!.tags!
                                  .where((tag) => tag.isNotEmpty)
                                  .map(
                                    (tag) => Chip(
                                      label: Text(tag),
                                      backgroundColor: Colors.grey[100],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
    );
  }

  Widget _buildDifficultyChip(String difficulty) {
    Color color;
    final difficultyLower = difficulty.toLowerCase();

    if (difficultyLower.contains('cơ bản') ||
        difficultyLower.contains('basic') ||
        difficultyLower.contains('beginner')) {
      color = Colors.green;
    } else if (difficultyLower.contains('trung bình') ||
        difficultyLower.contains('intermediate')) {
      color = Colors.orange;
    } else if (difficultyLower.contains('nâng cao') ||
        difficultyLower.contains('advanced')) {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }

    return Chip(
      label: Text(
        'Độ khó: $difficulty',
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color.withOpacity(0.3)),
    );
  }

  Widget _buildCategoryChip(String category) {
    return Chip(
      label: Text(
        'Danh mục: $category',
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.blue.withOpacity(0.1),
      side: BorderSide(color: Colors.blue.withOpacity(0.3)),
    );
  }

  Widget _buildReadingTimeChip(int readingTime) {
    return Chip(
      label: Text(
        '⏱️ $readingTime phút',
        style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.grey[100],
      side: BorderSide(color: Colors.grey.withOpacity(0.3)),
    );
  }
}

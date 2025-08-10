import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/core/presentation/view_status.dart';
import 'package:lexigo/screen/grammar/controller/grammar_controller.dart';
import 'package:lexigo/screen/grammar/pages/grammar_detail_screen.dart';

@RoutePage()
class GrammarListScreen extends ConsumerStatefulWidget {
  const GrammarListScreen({super.key});

  @override
  ConsumerState<GrammarListScreen> createState() => _GrammarListScreenState();
}

class _GrammarListScreenState extends ConsumerState<GrammarListScreen> {
  late TextEditingController searchController;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        final state = ref.read(grammarNotifierProvider);
        if (state.hasMore && state.status is! ViewLoading) {
          ref.read(grammarNotifierProvider.notifier).loadMoreArticles();
        }
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(grammarNotifierProvider);
    final controller = ref.read(grammarNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ngữ pháp'),
        actions: [
          if (state.isFiltering)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () {
                searchController.clear();
                controller.resetFilters();
              },
              tooltip: 'Xóa bộ lọc',
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm bài học...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          controller.searchArticles('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
              onSubmitted: controller.searchArticles,
            ),
          ),
        ),
      ),
      body: state.status is ViewLoading && state.articles.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : state.status is ViewError && state.articles.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Có lỗi xảy ra: ${state.error}',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: controller.resetFilters,
                        child: const Text('Thử lại'),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    _buildFilters(state, controller),
                    if (state.popularArticles.isNotEmpty && !state.isFiltering)
                      _buildPopularArticles(state),
                    Expanded(
                      child: _buildArticlesList(state),
                    ),
                  ],
                ),
    );
  }

  Widget _buildFilters(GrammarState state, GrammarNotifier controller) {
    return Column(
      children: [
        // Categories filter
        if (state.categories.isNotEmpty) ...[
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: state.categories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: const Text('Tất cả'),
                      selected: state.selectedCategory == null,
                      onSelected: (selected) {
                        if (selected) {
                          controller.filterByCategory(null);
                        }
                      },
                    ),
                  );
                }

                final category = state.categories[index - 1];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text('${category.name} (${category.count})'),
                    selected: state.selectedCategory == category.name,
                    onSelected: (selected) {
                      controller.filterByCategory(
                        selected ? category.name : null,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
        // Difficulty filter
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildDifficultyChip('Tất cả', null, state, controller),
              _buildDifficultyChip('Cơ bản', 'Cơ bản', state, controller),
              _buildDifficultyChip(
                'Trung bình',
                'Trung bình',
                state,
                controller,
              ),
              _buildDifficultyChip('Nâng cao', 'Nâng cao', state, controller),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDifficultyChip(
    String label,
    String? difficulty,
    GrammarState state,
    GrammarNotifier controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: state.selectedDifficulty == difficulty,
        onSelected: (selected) {
          controller.filterByDifficulty(selected ? difficulty : null);
        },
      ),
    );
  }

  Widget _buildPopularArticles(GrammarState state) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.popularArticles.length,
        itemBuilder: (context, index) {
          final article = state.popularArticles[index];
          return SizedBox(
            width: 160,
            child: Card(
              child: InkWell(
                onTap: () => _navigateToDetail(context, article.id),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      color: Colors.grey[200],
                      child: Center(
                        child: Icon(
                          Icons.article,
                          size: 40,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            article.difficultyLevel,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildArticlesList(GrammarState state) {
    if (state.articles.isEmpty && state.status is! ViewLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Không tìm thấy bài viết nào',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(grammarNotifierProvider.notifier).resetFilters();
      },
      child: ListView.builder(
        controller: scrollController,
        itemCount: state.articles.length + (state.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.articles.length) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            );
          }

          final article = state.articles[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(
                article.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildDifficultyBadge(article.difficultyLevel),
                      if (article.category != null) ...[
                        const SizedBox(width: 8),
                        _buildCategoryBadge(article.category!),
                      ],
                    ],
                  ),
                  if (article.readingTime != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '⏱️ ${article.readingTime} phút',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _navigateToDetail(context, article.id),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDifficultyBadge(String difficulty) {
    Color color;
    switch (difficulty.toLowerCase()) {
      case 'cơ bản':
        color = Colors.green;
      case 'trung bình':
        color = Colors.orange;
      case 'nâng cao':
        color = Colors.red;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        difficulty,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(String category) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Text(
        category,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => GrammarDetailScreen(id: id),
      ),
    );
  }
}

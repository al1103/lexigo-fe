import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/screen/chat/controller/chat_controller.dart';
import 'package:lexigo/screen/chat/model/topic_model.dart';

class TopicSelectionDialog extends ConsumerStatefulWidget {
  const TopicSelectionDialog({
    required this.onTopicSelected,
    super.key,
  });

  final void Function(ChatTopic topic, String? aiResponse) onTopicSelected;

  @override
  ConsumerState<TopicSelectionDialog> createState() =>
      _TopicSelectionDialogState();
}

class _TopicSelectionDialogState extends ConsumerState<TopicSelectionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  ChatTopic? _selectedTopic;
  final TextEditingController _customTopicController = TextEditingController();
  bool _isCustomTopicMode = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _customTopicController.dispose();
    super.dispose();
  }

  ChatTopic? get _effectiveSelectedTopic {
    if (_isCustomTopicMode && _customTopicController.text.trim().isNotEmpty) {
      return ChatTopic(
        id: 'custom',
        title: _customTopicController.text.trim(),
        description: 'Chủ đề học tùy chọn',
        emoji: '🎯',
        welcomeMessage:
            // ignore: leading_newlines_in_multiline_strings
            '''🎯 Chào mừng đến với chủ đề học tùy chọn: ${_customTopicController.text.trim()}!

Tôi rất hào hứng được giúp bạn học về chủ đề này. Tôi có thể hỗ trợ bản với:
• 📚 Từ vựng liên quan đến ${_customTopicController.text.trim()}
• 🗣️ Luyện phát âm và nói
• ✍️ Ngữ pháp trong ngữ cảnh
• 💬 Hội thoại về ${_customTopicController.text.trim()}
• 🎯 Câu hỏi và giải thích cụ thể

Bạn muốn biết gì về ${_customTopicController.text.trim()}?''',
      );
    }
    return _selectedTopic;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final maxHeight = screenSize.height * 0.8; // Giảm xuống 80%

    return Dialog(
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: 700,
            minHeight: 300, // Giảm minHeight
          ),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header with gradient background
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF667EEA),
                      Color(0xFF764BA2),
                      Color(0xFF8B5CF6),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Chọn lộ trình học của bạn',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Cá nhân hóa trải nghiệm học tiếng Anh',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Content area with scrolling support
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20), // Giảm padding
                    child: Column(
                      children: [
                        // Modern toggle buttons
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFE2E8F0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isCustomTopicMode = false;
                                      _customTopicController.clear();
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: !_isCustomTopicMode
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: !_isCustomTopicMode
                                          ? [
                                              BoxShadow(
                                                color: Colors.black
                                                  ..withValues(alpha: 0.1),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.auto_awesome,
                                          size: 18,
                                          color: !_isCustomTopicMode
                                              ? const Color(0xFF6366F1)
                                              : const Color(0xFF64748B),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'phổ biến',
                                          style: TextStyle(
                                            color: !_isCustomTopicMode
                                                ? const Color(0xFF6366F1)
                                                : const Color(0xFF64748B),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isCustomTopicMode = true;
                                      _selectedTopic = null;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _isCustomTopicMode
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: _isCustomTopicMode
                                          ? [
                                              BoxShadow(
                                                color: Colors.black
                                                  ..withValues(alpha: 0.1),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ]
                                          : null,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.edit_outlined,
                                          size: 18,
                                          color: _isCustomTopicMode
                                              ? const Color(0xFF6366F1)
                                              : const Color(0xFF64748B),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'tùy chọn',
                                          style: TextStyle(
                                            color: _isCustomTopicMode
                                                ? const Color(0xFF6366F1)
                                                : const Color(0xFF64748B),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Content area that adapts to available space
                        SizedBox(
                          height: 300, // Đặt chiều cao cố định
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: _isCustomTopicMode
                                ? _buildCustomTopicInput()
                                : _buildPresetTopics(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Action buttons with modern design
              Container(
                padding:
                    const EdgeInsets.fromLTRB(20, 8, 20, 20), // Giảm padding
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Hủy',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: _effectiveSelectedTopic != null
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF6366F1),
                                    Color(0xFF8B5CF6),
                                  ],
                                )
                              : null,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton(
                          onPressed: _effectiveSelectedTopic != null
                              ? () async {
                                  await _handleTopicSelection();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _effectiveSelectedTopic != null
                                ? Colors.transparent
                                : const Color(0xFFE2E8F0),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.rocket_launch, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                'Bắt đầu học',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: _effectiveSelectedTopic != null
                                      ? Colors.white
                                      : const Color(0xFF94A3B8),
                                ),
                              ),
                            ],
                          ),
                        ),
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
  }

  Widget _buildPresetTopics() {
    return GridView.builder(
      key: const ValueKey('preset'),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.95,
      ),
      itemCount: ChatTopic.topics.length,
      itemBuilder: (context, index) {
        final topic = ChatTopic.topics[index];
        final isSelected = _selectedTopic?.id == topic.id;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTopic = topic;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF6366F1),
                        Color(0xFF8B5CF6),
                      ],
                    )
                  : null,
              color: isSelected ? null : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    isSelected ? Colors.transparent : const Color(0xFFE2E8F0),
                width: 2,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   width: 50,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     color: isSelected
                //         ? Colors.white.withValues(alpha: 0.2)
                //         : const Color(0xFF6366F1)
                //       ..withValues(alpha: 0.1),
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: Center(
                //     child: Text(
                //       topic.emoji,
                //       style: const TextStyle(fontSize: 24),
                //     ),
                //   ),
                // ),
                Text(
                  topic.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : const Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 6),
                // Text(
                //   topic.description,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: isSelected
                //         ? Colors.white.withValues(alpha: 0.9)
                //         : const Color(0xFF64748B),
                //     height: 1.3,
                //   ),
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                if (isSelected) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Đã chọn',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCustomTopicInput() {
    return Container(
      key: const ValueKey('custom'),
      child: Column(
        children: [
          // Hero section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF8FAFC),
                  Color(0xFFE2E8F0),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFE2E8F0),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.lightbulb_outline,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Hành trình học độc đáo của bạn',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Hãy cho chúng tôi biết bạn đam mê gì',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Input field
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _customTopicController,
              onChanged: (value) => setState(() {}),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E293B),
              ),
              decoration: InputDecoration(
                hintText: 'Ví dụ: Khám phá vũ trụ, Nấu ăn, Kinh doanh...',
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                ),
                prefixIcon: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.edit_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color(0xFF6366F1),
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Confirmation message
          // if (_customTopicController.text.trim().isNotEmpty)
          //   Container(
          //     padding: const EdgeInsets.all(16),
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [
          //           Colors.green[50]!,
          //           Colors.green[100]!,
          //         ],
          //       ),
          //       borderRadius: BorderRadius.circular(14),
          //       border: Border.all(
          //         color: Colors.green[200]!,
          //         width: 2,
          //       ),
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.all(6),
          //           decoration: BoxDecoration(
          //             color: Colors.green[500],
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Icon(
          //             Icons.check,
          //             color: Colors.white,
          //             size: 16,
          //           ),
          //         ),
          //         const SizedBox(width: 12),
          //         Expanded(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'Lựa chọn hoàn hảo!',
          //                 style: TextStyle(
          //                   color: Colors.green[700],
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 14,
          //                 ),
          //               ),
          //               const SizedBox(height: 2),
          //               Text(
          //                 'Sẵn sàng khám phá "${_customTopicController.text.trim()}"',
          //                 style: TextStyle(
          //                   color: Colors.green[600],
          //                   fontSize: 12,
          //                 ),
          //                 overflow: TextOverflow.ellipsis,
          //                 maxLines: 2,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }

  Future<void> _handleTopicSelection() async {
    final selectedTopic = _effectiveSelectedTopic!;

    // Show loading
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black..withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.psychology_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Color(0xFF6366F1),
                  strokeWidth: 3,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Đang chuẩn bị hành trình ${selectedTopic.title} của bạn...',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Đang tạo nội dung cá nhân hóa dành riêng cho bạn',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );

    try {
      // Prepare context message for AI
      final contextMessage = _isCustomTopicMode
          ? '''
Tôi muốn học về: ${selectedTopic.title}

Vui lòng cung cấp thông điệp chào mừng toàn diện và hướng dẫn học tập ban đầu cho chủ đề tùy chọn này.
Hãy làm cho nó hấp dẫn, phù hợp và hữu ích cho ai đó muốn học về ${selectedTopic.title}.
Bao gồm từ vựng cụ thể, cụm từ và cách bắt đầu cuộc trò chuyện liên quan đến chủ đề này.
'''
          : selectedTopic.welcomeMessage;

      // Get AI response with timeout
      String? aiResponse;
      try {
        print('🚀 Starting API call for topic: ${selectedTopic.title}');

        aiResponse = await ref
            .read(chatControllerProvider.notifier)
            .chatAI(
              contextMessage,
              isReset: true,
            )
            .timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            print('⏰ API call timeout after 30 seconds');
            throw TimeoutException(
              'API call timed out',
              const Duration(seconds: 30),
            );
          },
        );

        print('✅ API Response received successfully');
      } catch (apiError) {
        print('❌ API Error: $apiError');
        aiResponse = null;
      }

      // Close loading dialog first
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Then close topic dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Pass topic and AI response (hoặc fallback message nếu API lỗi)
      final fallbackResponse = aiResponse ?? selectedTopic.welcomeMessage;
      widget.onTopicSelected(selectedTopic, fallbackResponse);
    } catch (e) {
      print('❌ General Error: $e');

      // Close loading dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Close topic dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Pass topic with fallback
      widget.onTopicSelected(selectedTopic, selectedTopic.welcomeMessage);
    }
  }
}

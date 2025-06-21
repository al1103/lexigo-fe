import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/screen/chat/controller/chat_controller.dart';
import 'package:lexigo/screen/chat/model/topic_model.dart';

class TopicSelectionDialog extends ConsumerStatefulWidget {
  const TopicSelectionDialog({
    required this.onTopicSelected,
    super.key,
  });

  final Function(ChatTopic topic, String? aiResponse) onTopicSelected;

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
        description: 'Custom learning topic',
        emoji: '🎯',
        welcomeMessage:
            '''🎯 Welcome to your custom learning topic: ${_customTopicController.text.trim()}!

I'm excited to help you learn about this specific topic. I can assist you with:
• 📚 Vocabulary related to ${_customTopicController.text.trim()}
• 🗣️ Pronunciation and speaking practice
• ✍️ Grammar in context
• 💬 Conversations about ${_customTopicController.text.trim()}
• 🎯 Specific questions and explanations

What would you like to know about ${_customTopicController.text.trim()}?''',
      );
    }
    return _selectedTopic;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          constraints: const BoxConstraints(maxHeight: 700),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
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
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Choose Your Learning Focus',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select a topic or create your own',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              // Toggle between preset topics and custom input
              Container(
                margin: const EdgeInsets.only(bottom: 16),
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: !_isCustomTopicMode
                                ? const Color(0xFF6366F1)
                                : Colors.grey[100],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Preset Topics',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: !_isCustomTopicMode
                                  ? Colors.white
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
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
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _isCustomTopicMode
                                ? const Color(0xFF6366F1)
                                : Colors.grey[100],
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Custom Topic',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _isCustomTopicMode
                                  ? Colors.white
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content area
              Flexible(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isCustomTopicMode
                      ? _buildCustomTopicInput()
                      : _buildPresetTopics(),
                ),
              ),

              const SizedBox(height: 24),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _effectiveSelectedTopic != null
                          ? () async {
                              await _handleTopicSelection();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Start Learning',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
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
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF6366F1).withOpacity(0.1)
                  : Colors.grey[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? const Color(0xFF6366F1) : Colors.grey[200]!,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  topic.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(height: 8),
                Text(
                  topic.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? const Color(0xFF6366F1)
                        : const Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  topic.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  '🎯',
                  style: TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Create Your Own Topic',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter what you want to learn about',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _customTopicController,
            onChanged: (value) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'e.g., Cooking, Sports, Technology...',
              prefixIcon: const Icon(
                Icons.edit,
                color: Color(0xFF6366F1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Color(0xFF6366F1),
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: Colors.grey[50],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          if (_customTopicController.text.trim().isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green[600], size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Ready to learn about "${_customTopicController.text.trim()}"',
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleTopicSelection() async {
    final selectedTopic = _effectiveSelectedTopic!;

    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Color(0xFF6366F1),
              ),
              const SizedBox(height: 16),
              Text(
                'Preparing your ${selectedTopic.title} lesson...',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
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
I want to learn about: ${selectedTopic.title}

Please provide a comprehensive welcome message and initial learning guidance for this custom topic.
Make it engaging, relevant, and helpful for someone wanting to learn about ${selectedTopic.title}.
Include specific vocabulary, phrases, and conversation starters related to this topic.
'''
          : selectedTopic.welcomeMessage;

      // Get AI response
      final aiResponse = await ref.read(chatControllerProvider.notifier).chatAI(
            contextMessage,
            isReset: true,
          );

      // Close loading dialog
      Navigator.of(context).pop();

      // Close topic dialog
      Navigator.of(context).pop();

      // Pass topic and AI response
      widget.onTopicSelected(selectedTopic, aiResponse);
    } catch (e) {
      // Close loading dialog
      Navigator.of(context).pop();

      // Close topic dialog
      Navigator.of(context).pop();

      // Pass topic with fallback
      widget.onTopicSelected(selectedTopic, null);
    }
  }
}

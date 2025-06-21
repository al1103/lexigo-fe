import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexigo/screen/chat/components/topic_dialog.dart';
import 'package:lexigo/screen/chat/controller/chat_controller.dart';
import 'package:lexigo/screen/chat/model/topic_model.dart';
import 'package:translator/translator.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final List<types.Message> _messages = [];
  late final types.User _user;
  late final types.User _aiBot;
  final _uuid = const Uuid();
  bool _isTyping = false;
  ChatTopic? _selectedTopic;

  // Translator instance
  final GoogleTranslator _translator = GoogleTranslator();

  // Maps để theo dõi trạng thái translation
  final Map<String, bool> _translationVisible = {};
  final Map<String, String> _translatedMessages = {};
  final Map<String, String> _originalTexts = {};
  final Map<String, bool> _isTranslating = {}; // Theo dõi trạng thái đang dịch

  @override
  void initState() {
    super.initState();
    _initializeUsers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTopicSelection();
    });
  }

  void _initializeUsers() {
    _user = types.User(
      id: _uuid.v4(),
      firstName: 'You',
      lastName: '',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
    );

    _aiBot = types.User(
      id: _uuid.v4(),
      firstName: 'Lexigo',
      lastName: 'AI',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0bjpsU06UDMa07UU1MfYmYgKFwhgBNStWig&s',
    );
  }

  // Sử dụng Google Translator package
  Future<String?> translateText(String text) async {
    try {
      // Phát hiện ngôn ngữ nguồn và dịch sang tiếng Việt
      final translation = await _translator.translate(text, to: 'vi');

      print('Dịch từ "$text" sang "${translation.text}"');
      return translation.text;
    } catch (e) {
      print('Lỗi khi dịch: $e');
      return null;
    }
  }

  // Dịch sang nhiều ngôn ngữ khác nhau
  Future<Map<String, String?>> translateToMultipleLanguages(String text) async {
    final results = <String, String?>{};
    final languages = ['vi', 'en', 'ko', 'ja', 'zh', 'fr', 'es', 'de'];
    final languageNames = {
      'vi': 'Tiếng Việt',
      'en': 'English',
      'ko': '한국어',
      'ja': '日本語',
      'zh': '中文',
      'fr': 'Français',
      'es': 'Español',
      'de': 'Deutsch',
    };

    try {
      // Phát hiện ngôn ngữ nguồn
      final detected = await _translator.translate(text);
      final sourceLanguage = detected.sourceLanguage.code;

      print('Ngôn ngữ được phát hiện: $sourceLanguage');

      for (final langCode in languages) {
        // Bỏ qua nếu là ngôn ngữ nguồn
        if (langCode == sourceLanguage) continue;

        try {
          final translation = await _translator.translate(text, to: langCode);
          results[languageNames[langCode]!] = translation.text;
        } catch (e) {
          print('Lỗi khi dịch sang $langCode: $e');
          results[languageNames[langCode]!] = 'Không thể dịch';
        }
      }
    } catch (e) {
      print('Lỗi khi phát hiện ngôn ngữ: $e');
    }

    return results;
  }

  void _showTopicSelection() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TopicSelectionDialog(
        onTopicSelected: (topic, aiResponse) {
          setState(() {
            _selectedTopic = topic;
          });
          _loadWelcomeMessage(topic, aiResponse);
        },
      ),
    );
  }

  void _loadWelcomeMessage(ChatTopic topic, String? aiResponse) {
    final messageText = aiResponse ?? topic.welcomeMessage;

    final welcomeMessage = types.TextMessage(
      author: _aiBot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _uuid.v4(),
      text: messageText,
    );

    setState(() {
      _messages.insert(0, welcomeMessage);
    });
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  Future<void> _simulateAIResponse(String userMessage) async {
    setState(() {
      _isTyping = true;
    });

    try {
      final response = await ref.read(chatControllerProvider.notifier).chatAI(
            userMessage,
            isReset: false,
          );

      final responseText = response ??
          "I'm having trouble understanding. Could you please rephrase your question?";

      final aiMessage = types.TextMessage(
        author: _aiBot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _uuid.v4(),
        text: responseText,
      );

      setState(() {
        _isTyping = false;
      });

      _addMessage(aiMessage);
    } catch (e) {
      const fallbackResponse =
          "I'm sorry, I'm having trouble responding right now. Please try again or ask a different question.";

      final aiMessage = types.TextMessage(
        author: _aiBot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _uuid.v4(),
        text: fallbackResponse,
      );

      setState(() {
        _isTyping = false;
      });

      _addMessage(aiMessage);
    }
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: _uuid.v4(),
      text: message.text,
    );

    _addMessage(textMessage);
    _simulateAIResponse(message.text);
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => _buildAttachmentBottomSheet(),
    );
  }

  Widget _buildAttachmentBottomSheet() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Learning Tools',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(
                  icon: Icons.attach_file,
                  label: 'File',
                  color: const Color(0xFFF59E0B),
                  onTap: _handleFileSelection,
                ),
                _buildAttachmentOption(
                  icon: Icons.mic,
                  label: 'Voice',
                  color: const Color(0xFFEF4444),
                  onTap: _handleVoiceRecording,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(
                  icon: Icons.translate,
                  label: 'Multi Translate',
                  color: const Color(0xFF06B6D4),
                  onTap: _showMultiTranslateDialog,
                ),
                _buildAttachmentOption(
                  icon: Icons.lightbulb_outline,
                  label: 'Tips',
                  color: const Color(0xFF8B5CF6),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Dialog dịch nhiều ngôn ngữ
  void _showMultiTranslateDialog() {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.translate, color: Color(0xFF06B6D4)),
            SizedBox(width: 8),
            Text('Dịch đa ngôn ngữ'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Nhập văn bản cần dịch',
                border: OutlineInputBorder(),
                hintText: 'Hello, how are you?',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (textController.text.trim().isNotEmpty) {
                Navigator.pop(context);
                _showTranslationResults(textController.text.trim());
              }
            },
            child: const Text('Dịch'),
          ),
        ],
      ),
    );
  }

  // Hiển thị kết quả dịch nhiều ngôn ngữ
  Future<void> _showTranslationResults(String text) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        title: Row(
          children: [
            CircularProgressIndicator(strokeWidth: 2),
            SizedBox(width: 12),
            Text('Đang dịch...'),
          ],
        ),
        content: Text('Vui lòng đợi trong giây lát'),
      ),
    );

    try {
      final translations = await translateToMultipleLanguages(text);

      if (mounted) {
        Navigator.pop(context); // Đóng loading dialog

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Row(
              children: [
                Icon(Icons.translate, color: Color(0xFF06B6D4)),
                SizedBox(width: 8),
                Text('Kết quả dịch'),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Văn bản gốc:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(text),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...translations.entries.map(
                    (entry) => _buildTranslationItem(
                      entry.key,
                      entry.value ?? 'Lỗi dịch',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Đóng'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _copyTranslationsToClipboard(text, translations);
                },
                child: const Text('Sao chép tất cả'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Đóng loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi khi dịch: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildTranslationItem(String language, String translation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF06B6D4).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF06B6D4).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.language,
                size: 16,
                color: Color(0xFF06B6D4),
              ),
              const SizedBox(width: 8),
              Text(
                language,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF06B6D4),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.copy, size: 16),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: translation));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đã sao chép bản dịch $language'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                tooltip: 'Sao chép',
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            translation,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  void _copyTranslationsToClipboard(
    String originalText,
    Map<String, String?> translations,
  ) {
    final buffer = StringBuffer();
    buffer.writeln('📝 Văn bản gốc: $originalText\n');
    buffer.writeln('🌍 Bản dịch đa ngôn ngữ:');

    translations.forEach((language, translation) {
      buffer.writeln('• $language: ${translation ?? "Lỗi dịch"}');
    });

    Clipboard.setData(ClipboardData(text: buffer.toString()));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('✅ Đã sao chép tất cả bản dịch'),
          ],
        ),
        backgroundColor: Color(0xFF059669),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildAttachmentOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _uuid.v4(),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
      _simulateFileAIResponse(result.files.single.name);
    }
  }

  void _handleVoiceRecording() {
    // Implement voice recording functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            Icon(Icons.mic, color: Colors.white),
            SizedBox(width: 8),
            Text('🎤 Tính năng ghi âm đang phát triển'),
          ],
        ),
        backgroundColor: Color(0xFFEF4444),
      ),
    );
  }

  void _simulateFileAIResponse(String fileName) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      final aiMessage = types.TextMessage(
        author: _aiBot,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: _uuid.v4(),
        text: '''📄 I received your file: "$fileName"

While I can't open files directly, I can help you with:
• **Document vocabulary** - business, academic terms
• **Writing tips** - structure and grammar
• **File-related expressions**:
  - "I'm attaching a file"
  - "Please find the document attached"
  - "The file contains..."

Is there specific content you'd like help with? 📝''',
      );
      _addMessage(aiMessage);
    });
  }

  Widget _customTypingIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(_aiBot.imageUrl ?? ''),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTypingDot(0),
                const SizedBox(width: 4),
                _buildTypingDot(1),
                const SizedBox(width: 4),
                _buildTypingDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        final delay = index * 0.2;
        final animValue = (value - delay).clamp(0.0, 1.0);
        final opacity = sin(animValue * pi * 2) * 0.5 + 0.5;

        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: const Color(0xFF6366F1).withOpacity(opacity),
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF6366F1).withOpacity(0.1),
              Colors.white,
            ],
            stops: const [0.0, 0.3],
          ),
        ),
        child: Column(
          children: [
            if (_selectedTopic != null) _buildTopicIndicator(),
            Expanded(child: _buildChat()),
            if (_isTyping) _customTypingIndicator(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF6366F1),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(_aiBot.imageUrl ?? ''),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedTopic != null
                      ? '${_selectedTopic!.emoji} ${_selectedTopic!.title}'
                      : 'Lexigo AI Assistant',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'Online • Ready to help',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.topic, color: Colors.white),
          onPressed: _showTopicSelection,
          tooltip: 'Change Topic',
        ),
        IconButton(
          icon: const Icon(Icons.translate, color: Colors.white),
          onPressed: _showMultiTranslateDialog,
          tooltip: 'Multi Translate',
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildTopicIndicator() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _selectedTopic!.emoji,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 8),
          Text(
            'Learning: ${_selectedTopic!.title}',
            style: const TextStyle(
              color: Color(0xFF6366F1),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChat() {
    return Chat(
      messages: _messages,
      onSendPressed: _handleSendPressed,
      onAttachmentPressed: _handleAttachmentPressed,
      user: _user,
      theme: DefaultChatTheme(
        primaryColor: const Color(0xFF6366F1),
        secondaryColor: const Color(0xFFF3F4F6),
        backgroundColor: Colors.transparent,
        inputBackgroundColor: Colors.white,
        inputTextColor: const Color(0xFF1F2937),
        inputBorderRadius: BorderRadius.circular(24),
        messageBorderRadius: 16,
        dateDividerTextStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        sentMessageBodyTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        receivedMessageBodyTextStyle: const TextStyle(
          color: Color(0xFF1F2937),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      showUserAvatars: true,
      inputOptions: const InputOptions(
        sendButtonVisibilityMode: SendButtonVisibilityMode.always,
      ),
      bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
        final isSentByUser = message.author.id == _user.id;

        if (message is types.TextMessage) {
          return _buildTextMessageBubble(message, isSentByUser);
        } else if (message is types.FileMessage) {
          return _buildFileMessageBubble(message, isSentByUser);
        }

        return child;
      },
    );
  }

  Widget _buildTextMessageBubble(types.TextMessage message, bool isSentByUser) {
    // Lưu text gốc khi chưa có
    if (!_originalTexts.containsKey(message.id)) {
      _originalTexts[message.id] = message.text;
      _translationVisible[message.id] = false;
      _isTranslating[message.id] = false;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        crossAxisAlignment:
            isSentByUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSentByUser ? const Color(0xFF6366F1) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: isSentByUser
                    ? const Radius.circular(20)
                    : const Radius.circular(4),
                bottomRight: isSentByUser
                    ? const Radius.circular(4)
                    : const Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text gốc
                Text(
                  _originalTexts[message.id] ?? message.text,
                  style: TextStyle(
                    color:
                        isSentByUser ? Colors.white : const Color(0xFF1F2937),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
                // Hiển thị bản dịch nếu được bật
                if (_translationVisible[message.id] == true) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSentByUser
                          ? Colors.white.withOpacity(0.2)
                          : const Color(0xFF06B6D4).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSentByUser
                            ? Colors.white.withOpacity(0.3)
                            : const Color(0xFF06B6D4).withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.translate,
                              size: 14,
                              color: isSentByUser
                                  ? Colors.white.withOpacity(0.8)
                                  : const Color(0xFF06B6D4),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Tiếng Việt',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSentByUser
                                    ? Colors.white.withOpacity(0.8)
                                    : const Color(0xFF06B6D4),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Hiển thị loading hoặc bản dịch
                        if (_isTranslating[message.id] == true)
                          Row(
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isSentByUser
                                        ? Colors.white.withOpacity(0.8)
                                        : const Color(0xFF06B6D4),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Đang dịch...',
                                style: TextStyle(
                                  color: isSentByUser
                                      ? Colors.white.withOpacity(0.7)
                                      : Colors.grey[600],
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          )
                        else
                          Text(
                            _translatedMessages[message.id] ?? 'Không thể dịch',
                            style: TextStyle(
                              color: isSentByUser
                                  ? Colors.white.withOpacity(0.9)
                                  : const Color(0xFF1F2937),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Action buttons cho tin nhắn từ AI bot
          if (!isSentByUser && message.author.id == _aiBot.id)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isTranslating[message.id] == true
                              ? Icons.hourglass_empty
                              : Icons.translate,
                          size: 18,
                          color: _translationVisible[message.id] == true
                              ? const Color(0xFF059669) // Màu xanh khi đã dịch
                              : const Color(0xFF06B6D4),
                        ),
                        onPressed: _isTranslating[message.id] == true
                            ? null
                            : () => _toggleTranslation(message),
                        tooltip: _translationVisible[message.id] == true
                            ? 'Ẩn bản dịch'
                            : 'Hiển thị bản dịch',
                      ),
                      _buildDivider(),
                      IconButton(
                        icon: const Icon(
                          Icons.volume_up,
                          size: 18,
                          color: Color(0xFF10B981),
                        ),
                        onPressed: () => _speakMessage(
                          _originalTexts[message.id] ?? message.text,
                        ),
                        tooltip: 'Nghe',
                      ),
                      _buildDivider(),
                      IconButton(
                        icon: const Icon(
                          Icons.copy,
                          size: 18,
                          color: Color(0xFFF59E0B),
                        ),
                        onPressed: () => _copyMessageToClipboard(
                          _originalTexts[message.id] ?? message.text,
                        ),
                        tooltip: 'Sao chép',
                      ),
                      _buildDivider(),
                      IconButton(
                        icon: const Icon(
                          Icons.lightbulb_outline,
                          size: 18,
                          color: Color(0xFF8B5CF6),
                        ),
                        onPressed: () => _explainMessage(message),
                        tooltip: 'Giải thích',
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // Function toggle translation với Google Translator package
  Future<void> _toggleTranslation(types.TextMessage message) async {
    setState(() {
      final isCurrentlyVisible = _translationVisible[message.id] ?? false;

      if (!isCurrentlyVisible) {
        // Hiển thị bản dịch
        _translationVisible[message.id] = true;

        // Nếu chưa có bản dịch, gọi API
        if (!_translatedMessages.containsKey(message.id)) {
          _isTranslating[message.id] = true;
        }
      } else {
        // Ẩn bản dịch
        _translationVisible[message.id] = false;
        _showHideTranslationFeedback();
        return;
      }
    });

    // Gọi API dịch nếu chưa có bản dịch
    if (!_translatedMessages.containsKey(message.id)) {
      try {
        final originalText = _originalTexts[message.id] ?? message.text;
        // SỬA LỖI: Dịch originalText thay vì 'hello'
        final translatedText = await translateText(originalText);

        setState(() {
          _isTranslating[message.id] = false;
          if (translatedText != null && translatedText.isNotEmpty) {
            _translatedMessages[message.id] = translatedText;
            _showTranslationSuccessFeedback();
          } else {
            _translatedMessages[message.id] = 'Không thể dịch văn bản này';
            _showTranslationErrorFeedback();
          }
        });
      } catch (e) {
        setState(() {
          _isTranslating[message.id] = false;
          _translatedMessages[message.id] = 'Lỗi khi dịch: $e';
        });
        _showTranslationErrorFeedback();
      }
    } else {
      // Đã có bản dịch, chỉ hiển thị
      _showTranslationSuccessFeedback();
    }
  }

  void _showTranslationSuccessFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.translate, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text('✨ Bản dịch đã hiển thị'),
          ],
        ),
        backgroundColor: const Color(0xFF06B6D4),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showHideTranslationFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.visibility_off, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text('👁️ Đã ẩn bản dịch'),
          ],
        ),
        backgroundColor: Colors.grey[600],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showTranslationErrorFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text('❌ Không thể dịch văn bản'),
          ],
        ),
        backgroundColor: Colors.red[600],
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildFileMessageBubble(types.FileMessage message, bool isSentByUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSentByUser ? const Color(0xFF6366F1) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isSentByUser
                ? const Radius.circular(20)
                : const Radius.circular(4),
            bottomRight: isSentByUser
                ? const Radius.circular(4)
                : const Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSentByUser
                    ? Colors.white.withOpacity(0.2)
                    : const Color(0xFF6366F1).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.attach_file,
                color: isSentByUser ? Colors.white : const Color(0xFF6366F1),
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.name,
                    style: TextStyle(
                      color:
                          isSentByUser ? Colors.white : const Color(0xFF1F2937),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatFileSize(message.size.toInt()),
                    style: TextStyle(
                      color: isSentByUser
                          ? Colors.white.withOpacity(0.8)
                          : Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 20,
      color: Colors.grey.shade300,
    );
  }

  // Helper methods for bubble actions

  void _speakMessage(String text) {
    // Mock TTS với feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.volume_up, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '🔊 Đang phát: "${text.length > 30 ? '${text.substring(0, 30)}...' : text}"',
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF10B981),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    // Simulate speaking delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8),
                Text('✅ Hoàn thành phát âm'),
              ],
            ),
            backgroundColor: const Color(0xFF059669),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 1),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    });
  }

  void _copyMessageToClipboard(String text) {
    // Sao chép vào clipboard
    Clipboard.setData(ClipboardData(text: text));

    const snippetLength = 40;
    final displayText = text.length > snippetLength
        ? '${text.substring(0, snippetLength)}...'
        : text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.content_copy, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text('📋 Đã sao chép: "$displayText"'),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFF59E0B),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        action: SnackBarAction(
          label: 'HOÀN TÁC',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Đã hoàn tác sao chép'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }

  void _explainMessage(types.TextMessage message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.lightbulb_outline, color: Color(0xFF8B5CF6)),
            SizedBox(width: 8),
            Text('Giải thích tin nhắn'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tin nhắn gốc:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(message.text),
              ),
              const SizedBox(height: 16),
              const Text(
                'Phân tích:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B5CF6),
                ),
              ),
              const SizedBox(height: 8),
              _buildExplanationItem(
                '🎯',
                'Mục đích',
                _getMockPurpose(message.text),
              ),
              _buildExplanationItem(
                '📝',
                'Ngữ pháp',
                _getMockGrammar(message.text),
              ),
              _buildExplanationItem(
                '💡',
                'Từ vựng',
                _getMockVocabulary(message.text),
              ),
              _buildExplanationItem('🌟', 'Mẹo', _getMockTips(message.text)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hiểu rồi!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _copyMessageToClipboard(
                'Giải thích: ${_getMockPurpose(message.text)}',
              );
            },
            child: const Text('Sao chép phân tích'),
          ),
        ],
      ),
    );
  }

  Widget _buildExplanationItem(String emoji, String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF8B5CF6).withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF8B5CF6).withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8B5CF6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(content, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }

  String _getMockPurpose(String text) {
    if (text.contains('?'))
      return 'Đây là câu hỏi tìm kiếm thông tin hoặc làm rõ vấn đề.';
    if (text.contains('Hello') || text.contains('Hi'))
      return 'Đây là lời chào để bắt đầu cuộc trò chuyện.';
    if (text.contains('Thank'))
      return 'Đây là cách thể hiện lòng biết ơn và sự cảm kích.';
    return 'Tin nhắn này cung cấp thông tin hoặc tiếp tục luồng hội thoại.';
  }

  String _getMockGrammar(String text) {
    if (text.contains('?'))
      return 'Sử dụng cấu trúc nghi vấn với từ hỏi + động từ phụ + chủ ngữ.';
    if (text.contains('can'))
      return 'Động từ khuyết thiếu "can" thể hiện khả năng hoặc sự cho phép.';
    if (text.contains('Hello'))
      return 'Thì hiện tại đơn với cấu trúc chào hỏi cơ bản.';
    return 'Sử dụng cấu trúc câu tiếng Anh chuẩn: Chủ ngữ + Động từ + Tân ngữ.';
  }

  String _getMockVocabulary(String text) {
    final words = text.toLowerCase().split(' ');
    final highlights = <String>[];

    if (words.contains('hello'))
      highlights.add('"Hello" - lời chào thông dụng');
    if (words.contains('help')) highlights.add('"Help" - giúp đỡ, hỗ trợ');
    if (words.contains('thank'))
      highlights.add('"Thank" - cảm ơn, bày tỏ lòng biết ơn');
    if (words.contains('question'))
      highlights.add('"Question" - câu hỏi tìm kiếm câu trả lời');

    return highlights.isEmpty
        ? 'Từ vựng hàng ngày thông dụng trong hội thoại thường.'
        : highlights.join('\n');
  }

  String _getMockTips(String text) {
    if (text.contains('?'))
      return 'Thực hành ngữ điệu câu hỏi - giọng nên lên cao ở cuối câu.';
    if (text.contains('Hello'))
      return 'Hãy nhớ giao tiếp bằng mắt khi chào hỏi ai đó.';
    if (text.contains('Thank'))
      return 'Luôn kèm theo nụ cười khi nói "thank you" trong giao tiếp trực tiếp.';
    return 'Chú ý đến ngữ cảnh và giọng điệu để phù hợp với tình huống.';
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

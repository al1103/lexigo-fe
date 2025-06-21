class ChatTopic {
  const ChatTopic({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.welcomeMessage,
  });
  final String id;
  final String title;
  final String description;
  final String emoji;
  final String welcomeMessage;

  static const List<ChatTopic> topics = [
    ChatTopic(
      id: 'general',
      title: 'General English',
      description: 'Basic conversation and everyday English',
      emoji: '💬',
      welcomeMessage: '''
 General English!''',
    ),
    ChatTopic(
      id: 'business',
      title: 'Business English',
      description: 'Professional communication and workplace vocabulary',
      emoji: '💼',
      welcomeMessage: '''
Business
''',
    ),
    ChatTopic(
      id: 'academic',
      title: 'Academic English',
      description: 'Essay writing, research, and academic vocabulary',
      emoji: '🎓',
      welcomeMessage: '''
🎓 Academic
''',
    ),
    ChatTopic(
      id: 'travel',
      title: 'Travel English',
      description: 'Essential phrases for traveling and tourism',
      emoji: '✈️',
      welcomeMessage: '''
 Travel''',
    ),
    ChatTopic(
      id: 'conversation',
      title: 'Daily Conversation',
      description: 'Casual chats and social interactions',
      emoji: '🗣️',
      welcomeMessage: '''
Practice Daily Conversation!
''',
    ),
    ChatTopic(
      id: 'grammar',
      title: 'Grammar Focus',
      description: 'Detailed grammar rules and practice',
      emoji: '📝',
      welcomeMessage: '''
📝 Grammar Mastery Session!
''',
    ),
  ];
}

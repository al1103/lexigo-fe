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
      title: 'Tiếng Anh Tổng quát',
      description: 'Hội thoại cơ bản và tiếng Anh hàng ngày',
      emoji: '💬',
      welcomeMessage: '''
 General English!''',
    ),
    ChatTopic(
      id: 'business',
      title: 'Tiếng Anh Kinh doanh',
      description: 'Giao tiếp chuyên nghiệp và từ vựng nơi làm việc',
      emoji: '💼',
      welcomeMessage: '''
Business
''',
    ),
    ChatTopic(
      id: 'academic',
      title: 'Tiếng Anh Học thuật',
      description: 'Viết luận, nghiên cứu và từ vựng học thuật',
      emoji: '🎓',
      welcomeMessage: '''
🎓 Academic
''',
    ),
    ChatTopic(
      id: 'travel',
      title: 'Tiếng Anh Du lịch',
      description: 'Cụm từ thiết yếu cho du lịch và khách sạn',
      emoji: '✈️',
      welcomeMessage: '''
 Travel''',
    ),
    ChatTopic(
      id: 'conversation',
      title: 'Hội thoại Hàng ngày',
      description: 'Trò chuyện thông thường và tương tác xã hội',
      emoji: '🗣️',
      welcomeMessage: '''
Practice Daily Conversation!
''',
    ),
    ChatTopic(
      id: 'grammar',
      title: 'Tập trung Ngữ pháp',
      description: 'Quy tắc ngữ pháp chi tiết và luyện tập',
      emoji: '📝',
      welcomeMessage: '''
📝 Grammar Mastery Session!
''',
    ),
  ];
}

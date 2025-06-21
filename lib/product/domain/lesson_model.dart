class Lesson {
  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.durationMinutes,
    this.sections,
    this.coverImage,
    this.completionCount,
    this.createdAt,
    this.updatedAt,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    List<LessonSection>? sections;
    if (json['sections'] != null) {
      sections = List<LessonSection>.from(
        (json['sections'] as List<dynamic>).map(
          (section) => LessonSection.fromJson(section as Map<String, dynamic>),
        ),
      );
    }

    return Lesson(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      level: json['level'] as String,
      durationMinutes: json['duration_minutes'] as int,
      sections: sections,
      coverImage: json['cover_image'] as String,
      completionCount: json['completion_count'] as int,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }
  final int id;
  final String title;
  final String description;
  final String level;
  final int durationMinutes;
  final List<LessonSection>? sections;
  final String? coverImage;
  final int? completionCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'level': level,
      'duration_minutes': durationMinutes,
      'sections': sections?.map((section) => section.toJson()).toList(),
      'cover_image': coverImage,
      'completion_count': completionCount,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class LessonSection {
  LessonSection({
    required this.id,
    required this.lessonId,
    required this.title,
    required this.content,
    required this.contentType,
    required this.orderIndex,
    this.mediaUrl,
  });

  factory LessonSection.fromJson(Map<String, dynamic> json) {
    return LessonSection(
      id: json['id'] as int,
      lessonId: json['lesson_id'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      contentType: json['content_type'] as String,
      orderIndex: json['order_index'] as int,
      mediaUrl: json['media_url'] as String?,
    );
  }
  final int id;
  final int lessonId;
  final String title;
  final String content;
  final String contentType; // text, audio, video, quiz
  final int orderIndex;
  final String? mediaUrl;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lesson_id': lessonId,
      'title': title,
      'content': content,
      'content_type': contentType,
      'order_index': orderIndex,
      'media_url': mediaUrl,
    };
  }
}

class Quiz {
  // in seconds

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.lessonId,
    required this.questions,
    required this.passingScore,
    this.timeLimit,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      lessonId: json['lesson_id'] as int,
      questions: (json['questions'] as List<dynamic>)
          .map((q) => QuizQuestion.fromJson(q as Map<String, dynamic>))
          .toList(),
      passingScore: json['passing_score'] as int,
      timeLimit: json['time_limit'] as int?,
    );
  }
  final int id;
  final String title;
  final String description;
  final int lessonId;
  final List<QuizQuestion> questions;
  final int passingScore;
  final int? timeLimit;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'lesson_id': lessonId,
      'questions': questions.map((q) => q.toJson()).toList(),
      'passing_score': passingScore,
      'time_limit': timeLimit,
    };
  }
}

class QuizQuestion {
  QuizQuestion({
    required this.id,
    required this.quizId,
    required this.questionText,
    required this.questionType,
    required this.options,
    this.correctAnswer,
    this.explanation,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['id'] as int,
      quizId: json['quiz_id'] as int,
      questionText: json['question_text'] as String,
      questionType: json['question_type'] as String,
      options: json['options'] != null
          ? (json['options'] as List<dynamic>)
              .map((o) => QuizOption.fromJson(o as Map<String, dynamic>))
              .toList()
          : [],
      correctAnswer: json['correct_answer'] as String?,
      explanation: json['explanation'] as String?,
    );
  }
  final int id;
  final int quizId;
  final String questionText;
  final String questionType; // multiple-choice, true-false, fill-in
  final List<QuizOption> options;
  final String? correctAnswer; // For fill-in questions
  final String? explanation;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quiz_id': quizId,
      'question_text': questionText,
      'question_type': questionType,
      'options': options.map((o) => o.toJson()).toList(),
      'correct_answer': correctAnswer,
      'explanation': explanation,
    };
  }
}

class QuizOption {
  QuizOption({
    required this.id,
    required this.questionId,
    required this.optionText,
    required this.isCorrect,
  });

  factory QuizOption.fromJson(Map<String, dynamic> json) {
    return QuizOption(
      id: json['id'] as int,
      questionId: json['question_id'] as int,
      optionText: json['option_text'] as String,
      isCorrect: json['is_correct'] as bool,
    );
  }
  final int id;
  final int questionId;
  final String optionText;
  final bool isCorrect;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_id': questionId,
      'option_text': optionText,
      'is_correct': isCorrect,
    };
  }
}

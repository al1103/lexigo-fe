class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    this.avatar,
    this.stats,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      stats: json['stats'] as Map<String, dynamic>?,
      token: json['token'] as String?,
    );
  }
  final int id;
  final String username;
  final String email;
  final String? avatar;
  final Map<String, dynamic>? stats;
  final String? token;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'avatar': avatar,
      'stats': stats,
      'token': token,
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? avatar,
    Map<String, dynamic>? stats,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      stats: stats ?? this.stats,
      token: token ?? this.token,
    );
  }
}

import 'dart:convert';

class UserModel {
  final String name;
  final String photoURL;
  final int score;

  UserModel({
    this.name,
    this.photoURL,
    this.score = 0,
  });

  UserModel copyWith({
    String name,
    String photoURL,
    int score,
  }) {
    return UserModel(
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoURL': photoURL,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photoURL: map['photoURL'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(name: $name, photoURL: $photoURL, score: $score)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.photoURL == photoURL &&
        other.score == score;
  }

  @override
  int get hashCode => name.hashCode ^ photoURL.hashCode ^ score.hashCode;
}

class JokesModel {
  String? jokes;
  String? createdAt;
  JokesModel({required this.jokes, required this.createdAt});
  JokesModel.temp();
  factory JokesModel.fromJson(Map json) {
    return JokesModel(jokes: json['value'], createdAt: json['created_at']);
  }
}

class Movie {
  final String name;
  final String backdropPath;

  const Movie({required this.name, required this.backdropPath});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        backdropPath: (json["backdrop_path"] ?? ""),
        name: json["original_name"] ?? json["original_title"]);
  }
}


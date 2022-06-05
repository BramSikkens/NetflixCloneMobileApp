class UpcomingMovie {
  final String name;
  final String backdropPath;
  final String description;
  final String releaseDate;

  const UpcomingMovie(
      {required this.name,
      required this.backdropPath,
      required this.description,
      required this.releaseDate});
  factory UpcomingMovie.fromJson(Map<String, dynamic> json) {
    return UpcomingMovie(
        backdropPath: (json["backdrop_path"] ?? ""),
        name: json["original_name"] ?? json["original_title"],
        releaseDate: json["release_date"] ?? "",
        description: json["overview"] ?? "");
  }
}

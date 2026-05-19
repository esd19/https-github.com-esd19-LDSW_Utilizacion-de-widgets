class Movie {
  final String title;
  final String year;
  final String director;
  final String genre;
  final String synopsis;
  final String image;

  Movie({
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'director': director,
      'genre': genre,
      'synopsis': synopsis,
      'image': image,
    };
  }
}
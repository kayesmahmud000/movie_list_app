class MovieModel {
  final int? slNo;
  final String movieTitle;
  final String? duration;

  MovieModel({required this.movieTitle, this.duration, this.slNo});

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      slNo: map['sl_no'],
      movieTitle: map['title'],
      duration: map['duration'],
    );
  }

 Map<String, dynamic> toMap() {
    return {
      if (slNo != null) 'sl_no': slNo, 
      'title': movieTitle,
      'duration': duration,
    };
  }
}
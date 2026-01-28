class WishlistModel {
  final String movieTile;
  final int? slNo;

  WishlistModel({this.slNo, required this.movieTile});

  factory WishlistModel.fromMap(Map<String, dynamic> map) {
    return WishlistModel(
      slNo: map['sl_no'],
      movieTile: map['movie_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sl_no': slNo,
      'movie_name': movieTile,
    };
  }
}
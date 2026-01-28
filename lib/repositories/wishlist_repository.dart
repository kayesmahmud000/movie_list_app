import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/model/wishlist_model.dart';
import 'package:movie_list_app/repositories/main_repository.dart';

class WishlistRepository extends BaseRepository<WishlistModel> {
  @override
  String get tableName => DbHelper.TABLE_WISHLIST;

  @override
  WishlistModel fromMap(Map<String, dynamic> map) => WishlistModel.fromMap(map);

  @override
  Map<String, dynamic> toMap(WishlistModel model) => model.toMap();


  Future<bool> deleteFromWishlist(int sl) => delete(DbHelper.SL_NO_COL, sl);
}
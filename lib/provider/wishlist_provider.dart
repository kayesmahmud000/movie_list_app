import 'package:flutter/material.dart';
import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/model/wishlist_model.dart';

class WishlistProvider extends ChangeNotifier{
  DbHelper dbHelper;
  WishlistProvider({required this.dbHelper});
  List<Map<String, dynamic>> _wishlist =[];

  List<Map<String, dynamic>>getWishlist()=> _wishlist ;

  bool isMovieWishlisted(String title) {
  return _wishlist.any(
    (w) => w[DbHelper.MOVIE_NAME_COL] == title,
  );
}

  void addWishList(WishlistModel wishlistModel) async{
    bool check = await dbHelper.addWishList(wishlistModel);

    if(check){
      _wishlist = await dbHelper.getWishlist();
      notifyListeners();
    }
  }
  
void deleteByMovieTitle(String title) async {
  final item = _wishlist.firstWhere(
    (w) => w[DbHelper.MOVIE_NAME_COL] == title,
  );

  bool check = await dbHelper.deleteWishlist(item[DbHelper.SL_NO_COL]);

  if (check) {
    _wishlist = await dbHelper.getWishlist();
    notifyListeners();
  }
}

  void getInitialWishlist () async{
    _wishlist = await dbHelper.getWishlist();
    notifyListeners();
  }

  void deleteWishlist(int sl) async{
    bool check = await dbHelper.deleteWishlist(sl);

    if(check){
      _wishlist = await dbHelper.getWishlist();
      notifyListeners();
    }
  }
}
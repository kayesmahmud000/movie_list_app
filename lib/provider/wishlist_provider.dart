import 'package:flutter/material.dart';
import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/model/wishlist_model.dart';
import 'package:movie_list_app/repositories/wishlist_repository.dart';


class WishlistProvider extends ChangeNotifier {
  final WishlistRepository wishlistRepo;

  WishlistProvider({required this.wishlistRepo});

  List<WishlistModel> _wishList = [];
  List<WishlistModel> get wishList => _wishList;

  void getInitialWishlist() async {
    _wishList = await wishlistRepo.getAll();
    notifyListeners();
  }

  void addToWishlist(WishlistModel item) async {
    bool check = await wishlistRepo.insert(item);
    if (check) {
      _wishList = await wishlistRepo.getAll();
      notifyListeners();
    }
  }

  void removeFromWishlist(int sl) async {
    // Using the generic delete from BaseRepository
    bool check = await wishlistRepo.delete(DbHelper.SL_NO_COL, sl);
    if (check) {
      _wishList = await wishlistRepo.getAll();
      notifyListeners();
    }
  }
}

// class WishlistProvider extends ChangeNotifier{
//   DbHelper dbHelper;
//   WishlistProvider({required this.dbHelper});
//   List<Map<String, dynamic>> _wishlist =[];

//   List<Map<String, dynamic>>getWishlist()=> _wishlist ;

//   bool isMovieWishlisted(String title) {
//   return _wishlist.any(
//     (w) => w[DbHelper.MOVIE_NAME_COL] == title,
//   );
// }

//   void addWishList(WishlistModel wishlistModel) async{
//     bool check = await dbHelper.addWishList(wishlistModel);

//     if(check){
//       _wishlist = await dbHelper.getWishlist();
//       notifyListeners();
//     }
//   }
  
// void deleteByMovieTitle(String title) async {
//   final item = _wishlist.firstWhere(
//     (w) => w[DbHelper.MOVIE_NAME_COL] == title,
//   );

//   bool check = await dbHelper.deleteWishlist(item[DbHelper.SL_NO_COL]);

//   if (check) {
//     _wishlist = await dbHelper.getWishlist();
//     notifyListeners();
//   }
// }

//   void getInitialWishlist () async{
//     _wishlist = await dbHelper.getWishlist();
//     notifyListeners();
//   }

//   void deleteWishlist(int sl) async{
//     bool check = await dbHelper.deleteWishlist(sl);

//     if(check){
//       _wishlist = await dbHelper.getWishlist();
//       notifyListeners();
//     }
//   }
// }
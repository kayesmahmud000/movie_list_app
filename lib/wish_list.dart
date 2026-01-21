import 'package:flutter/material.dart';
import 'package:movie_list_app/db/db_helper.dart';
import 'package:movie_list_app/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text("My Wish List",  style: TextStyle(fontSize: 30, fontWeight: .w700 ,color: Colors.white)),),
        body: Consumer<WishlistProvider>(builder:(ctx, value, child) {
                     List<Map<String, dynamic>> wishlists =ctx.watch<WishlistProvider>().getWishlist();
        return ListView.builder(
          itemCount: wishlists.length,
          itemBuilder:(context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: BeveledRectangleBorder(borderRadius: .circular(2)),
              tileColor: Colors.red.shade100,
              leading: Text('${index+1}' ,style: TextStyle(fontSize: 23, fontWeight: .w700),),
              title: Text(wishlists[index][DbHelper.MOVIE_NAME_COL], style: TextStyle(fontSize: 23, fontWeight: .w700),),
              trailing: InkWell(
                onTap: () => value.deleteWishlist(wishlists[index][DbHelper.SL_NO_COL]),
                child: Icon(Icons.delete ,color: Colors.red,),
              ),
            ),
          ),); },
        ),
    );
  }
}


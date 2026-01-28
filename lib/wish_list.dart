import 'package:flutter/material.dart';
import 'package:movie_list_app/model/wishlist_model.dart';
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
        title: Text(
          "My Wish List",
          style: TextStyle(
            fontSize: 30,
            fontWeight: .w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<WishlistProvider>(
        builder: (ctx, value, child) {
         
          final List<WishlistModel> wishlists = value.wishList;

          if (wishlists.isEmpty) {
            return const Center(
              child: Text(
                "Your wishlist is empty!",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: wishlists.length,
            itemBuilder: (context, index) {
              final item = wishlists[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  tileColor: Colors.red.shade100,
                  leading: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                 
                  title: Text(
                    item.movieTile,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      if (item.slNo != null) {
                        // FIXED: Called the updated method name from your provider
                        value.removeFromWishlist(item.slNo!);
                      }
                    },
                    child: const Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

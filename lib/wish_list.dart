import 'package:flutter/material.dart';

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
        body: Container(
          child: Text('Wish List'),
        ),
    );
  }
}


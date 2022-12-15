// ignore_for_file: file_names

import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_app/models/CatalogModel.dart';

class AddToCart extends StatelessWidget {
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    bool isIncart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isIncart) {
          isIncart = isIncart.toggle();
          AddMutation(catalog);
        }
      },
      child: isIncart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary),
          shape: MaterialStateProperty.all(const StadiumBorder())),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore: file_names
// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_null_comparison

import 'dart:convert';

import 'package:first_app/Pages/ItemDetail.dart';
import 'package:first_app/Widgets/Add_To_Cart.dart';
import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:first_app/utils/MyRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:first_app/models/CatalogModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    await Future.delayed(Duration(seconds: 3));
    final data = await rootBundle.loadString("assets/files/catalog.json");
    final data1 = jsonDecode(data);
    final data2 = data1["products"];
    CatalogModel.item =
        List.from(data2).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    var title = "Home Page";
    // final dummyList = List.generate(4, (index) => CatalogModel.item[0]);
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: VxConsumer(
            builder: ((context, store, status) {
              return _cart.items.isEmpty
                  ? FloatingActionButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, MyRoutes.cartRoute),
                      child: const Icon(
                        CupertinoIcons.cart,
                        color: Colors.white,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    )
                  : VxBadge(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                      color: Colors.red,
                      count: _cart.items.length,
                      size: 25,
                      child: FloatingActionButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, MyRoutes.cartRoute),
                        child: const Icon(
                          CupertinoIcons.cart,
                          color: Colors.white,
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    );
            }),
            mutations: const {AddMutation, RemoveMutation},
            notifications: const {}),
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
                  CatalogList()
                      .pOnly(top: 20, bottom: 0, left: 0, right: 0)
                      .expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .color(Theme.of(context).colorScheme.onSecondary)
            .bold
            .xl5
            .make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.item.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.item[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => ItemDetail(catalog: catalog)))),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogItemImage(img: catalog.image),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.xl
                .color(Theme.of(context).colorScheme.secondary)
                .bold
                .make(),
            catalog.desc.text.sm.gray500.make(),
            10.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(Theme.of(context).cardColor).rounded.square(150).make().py16();
  }
}

class CatalogItemImage extends StatelessWidget {
  const CatalogItemImage({Key? key, required this.img})
      : assert(img != null),
        super(key: key);
  final String img;
  @override
  Widget build(BuildContext context) {
    return Image.network(img)
        .box
        .roundedLg
        .p8
        .color(Theme.of(context).canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}

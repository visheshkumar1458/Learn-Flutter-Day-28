import 'package:first_app/core/store.dart';
import 'package:first_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          title: const Text("Cart"),
          centerTitle: true,
        ),
        body: Column(
          children: [Expanded(child: _CartList()), const _CartTotal()],
        ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: ((context, store, status) {
                return "\$${_cart.totalPrice}".text.xl5.make();
              }),
              mutations: const {RemoveMutation},
              notifications: const {}),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("This function is not supported yet!!")));
            },
            child: "Buy".text.xl2.make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
              shape: MaterialStateProperty.all(const StadiumBorder()),
            ),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return Padding(
      padding: EdgeInsets.zero,
      child: _cart.items.isEmpty
          ? "Cart is Empty".text.xl3.makeCentered()
          : ListView.builder(
              itemCount: _cart.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.done),
                title: Text(_cart.items[index].name),
                trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                    icon: const Icon(Icons.remove_circle_outline)),
              ),
            ),
    );
  }
}

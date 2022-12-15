import 'package:first_app/models/CatalogModel.dart';
import 'package:flutter/material.dart';

class Item_Wid extends StatelessWidget {
  final Item item;

  const Item_Wid({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.9,
      child: ListTile(
        onTap: () {
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toString()}",
          style: const TextStyle(
              color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

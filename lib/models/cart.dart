// ignore_for_file: unnecessary_null_comparison
import 'package:first_app/core/store.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //Catalog Field
  late CatalogModel _catalog;

  //Collection of IDs - stores id of each item
  List<int> _catalogIds = [];

  //Get catalog
  CatalogModel get catalog => _catalog;

  //Set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items =>
      _catalogIds.map((id) => _catalog.getByID(id)).toList();

  //Get total price
  num get totalPrice => items.fold(0, (total, cur) => total + cur.price);

  //Add Item
  void add(Item item) => _catalogIds.add(item.id);

  //Remove Item
  void remove(Item item) => _catalogIds.remove(item.id);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart.add(item);
  }
}

class RemoveMutation extends VxMutation {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    (VxState.store as MyStore).cart.remove(item);
  }
}

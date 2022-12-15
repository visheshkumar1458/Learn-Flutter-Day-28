// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:first_app/Widgets/Add_To_Cart.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key, required this.catalog}) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: catalog.name.text
            .color(Theme.of(context).colorScheme.onBackground)
            .make(),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.red800.bold.xl3.make(),
            AddToCart(catalog: catalog),
          ],
        ).px32().py8(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VxArc(
              arcType: VxArcType.CONVEX,
              height: 25,
              child: Hero(
                  tag: Key(catalog.id.toString()),
                  child:
                      Image.network(catalog.image).h40(context).w64(context)),
            ),
            VxArc(
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              height: 25,
              child: Container(
                width: context.screenWidth,
                color: Theme.of(context).cardColor,
                child: Column(
                  children: [
                    catalog.name.text.xl5
                        .color(Theme.of(context).colorScheme.secondary)
                        .bold
                        .make(),
                    catalog.desc.text.xl.gray300.make(),
                    const Text(
                            "Erat justo amet dolor vero clita lorem, aliquyam et eirmod kasd sit. Amet diam diam voluptua rebum diam rebum sea aliquyam ipsum, labore ipsum dolores ea ut ipsum tempor kasd. Kasd et aliquyam eirmod et ipsum vero nonumy sed et, sanctus sadipscing amet duo et sea sit gubergren. Nonumy dolor sed ipsum gubergren dolor ea. Ut et rebum ea eirmod consetetur, lorem sit takimata diam takimata lorem at sit no. Rebum accusam accusam amet ut ut elitr justo dolore sea. At sanctus sed et consetetur erat eirmod diam ut rebum. Ipsum dolores nonumy kasd diam. Sit voluptua diam eos et.",
                            style: TextStyle(
                                fontSize: 12,
                                wordSpacing: 0.4,
                                color: Vx.gray400))
                        .px12()
                  ],
                ).py64(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

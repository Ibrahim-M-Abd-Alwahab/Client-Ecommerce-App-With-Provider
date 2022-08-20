import 'package:e_commerce_app/Views/screens/products/widgets/product_widget.dart';
import 'package:e_commerce_app/providers/firestore_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  String catId;
  AllProductsScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(builder: (context, provider, x) {
      return Scaffold(
        appBar: AppBar(
          title: Text("All Products").tr(),
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: Color(0xff1572A1),
          foregroundColor: Colors.white,
        ),
        body: provider.products.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: provider.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: ProductWidget(provider.products[index], catId),
                  );
                }),
      );
    });
  }
}

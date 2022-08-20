import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Router/router.dart';
import 'package:e_commerce_app/Views/screens/products/widgets/proDetails_widget.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductWidget extends StatelessWidget {
  Product product;
  String catId;
  ProductWidget(this.product, this.catId);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  AppRouter.NavigateToWidget(productDetailsWidgett(product));
                },
                child: SizedBox(
                    height: 120,
                    width: 130,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(height: 10),
              Text(
                product.name.tr(),
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 16,
                  color: const Color(0xff2a2a2a),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        margin: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}

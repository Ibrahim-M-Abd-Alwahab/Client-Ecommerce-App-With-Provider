import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  Category category;
  CategoryWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              height: 150,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: category.imageUrl,
                fit: BoxFit.cover,
              )),
          SizedBox(height: 10),
          Text(category.name.tr()),
        ],
      ),
    );
  }
}

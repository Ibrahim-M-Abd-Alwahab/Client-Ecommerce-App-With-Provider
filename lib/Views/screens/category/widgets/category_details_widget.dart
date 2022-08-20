import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryDetailsWidget extends StatelessWidget {
  Category category;
  CategoryDetailsWidget(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
              height: 175,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: category.imageUrl,
                fit: BoxFit.cover,
              )),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Category : '.tr(),
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 20,
                    color: const Color(0xff2a2a2a),
                    height: 1.2000000476837158,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: category.name.tr(),
                        style: TextStyle(
                            fontFamily: 'Varela',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff656565),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

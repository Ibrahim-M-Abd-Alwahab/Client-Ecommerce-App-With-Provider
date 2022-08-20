import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/Ads.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class advertisementDetailsWidget extends StatelessWidget {
  Advertisement advertisement;
  advertisementDetailsWidget(this.advertisement);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 175,
          width: MediaQuery.of(context).size.width,
          child: CachedNetworkImage(
            imageUrl: advertisement.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 15),
        Text(
          advertisement.name.tr(),
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: const Color(0xff2a2a2a),
            height: 1.2000000476837158,
          ),
        ),
      ]),
    );
  }
}

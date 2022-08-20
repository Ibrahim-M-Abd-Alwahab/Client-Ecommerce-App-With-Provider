import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/offers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OfferWidget extends StatelessWidget {
  Offer offer;
  OfferWidget(this.offer);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Color(0xffEEEEEE),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.name.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xff1572A1),
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: offer.discount.tr() + "%",
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff1572A1),
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                          text: " Off in our \nAll products ".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff434343),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 175,
              width: 260,
              child: CachedNetworkImage(
                imageUrl: offer.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

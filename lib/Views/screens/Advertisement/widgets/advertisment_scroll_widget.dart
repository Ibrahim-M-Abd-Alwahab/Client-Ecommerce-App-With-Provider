import 'package:e_commerce_app/models/Ads.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdvertisementWidget extends StatelessWidget {
  Advertisement advertisement;
  AdvertisementWidget(this.advertisement);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SizedBox(
            height: 175,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              advertisement.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

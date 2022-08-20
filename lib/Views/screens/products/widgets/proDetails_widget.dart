import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class productDetailsWidgett extends StatelessWidget {
  Product product;
  productDetailsWidgett(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details").tr(),
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: Color(0xff1572A1),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: product.image,
                    fit: BoxFit.cover,
                  )),
              Container(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Product Name :  '.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff2a2a2a),
                          height: 1.2000000476837158,
                        ),
                        children: [
                          TextSpan(
                            text: product.name.tr(),
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff656565),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        text: 'Rate :  '.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff2a2a2a),
                          height: 1.2000000476837158,
                        ),
                        children: [
                          TextSpan(
                            text: product.rate.toString().tr() + "/ 10".tr(),
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFB4B8B9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        text: 'Description : \n'.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff2a2a2a),
                          height: 1.2000000476837158,
                        ),
                        children: [
                          TextSpan(
                            text: product.description.tr(),
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              color: const Color(0xFFB4B8B9),
                              height: 1.6428571428571428,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    RichText(
                      text: TextSpan(
                        text: 'Quintity :  '.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff2a2a2a),
                          height: 1.2000000476837158,
                        ),
                        children: [
                          TextSpan(
                            text: product.quantity.toString().tr(),
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFB4B8B9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "Price :  ".tr(),
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: const Color(0xff2a2a2a),
                            height: 1.2000000476837158,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff1572A1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            product.price.toString().tr() + "\$".tr(),
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        )
                      ],
                    ),
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

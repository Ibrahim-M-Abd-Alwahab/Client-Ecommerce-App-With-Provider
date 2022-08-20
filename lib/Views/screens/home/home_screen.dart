import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Router/router.dart';
import 'package:e_commerce_app/Views/screens/Advertisement/advertisement_screen.dart';
import 'package:e_commerce_app/Views/screens/Offers/offer_screen.dart';
import 'package:e_commerce_app/Views/screens/Offers/widgets/offer_scroll_widget.dart';
import 'package:e_commerce_app/Views/screens/category/categories_screen.dart';
import 'package:e_commerce_app/Views/screens/products/allProduct.dart';
import 'package:e_commerce_app/Views/screens/category/widgets/category_scroll_widget.dart';
import 'package:e_commerce_app/providers/firestore_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String? catId;
  HomeScreen({this.catId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home").tr(),
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: const Color(0xffffffff),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Color(0xff1572A1),
          foregroundColor: const Color(0xffC5CCD6),
          actions: [
            IconButton(
                onPressed: () {
                  if (context.locale.toString() == "ar") {
                    context.setLocale(Locale('en'));
                  } else {
                    context.setLocale(Locale('ar'));
                  }
                },
                icon: Icon(Icons.language)),
          ],
        ),
        body: Consumer<FirestoreProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Ads'.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 22,
                          color: const Color(0xff434343),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.getAllAdvertisement();
                          AppRouter.NavigateToWidget(AdvertisementScreen());
                        },
                        child: Text(
                          'See all'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff656565),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  provider.advertisements.isEmpty
                      ? Container(
                          color: Color(0xffEEEEEE),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        )
                      : Container(
                          child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              height: 180),
                          items: provider.advertisements
                              .map((item) => Container(
                                    child: CachedNetworkImage(
                                        imageUrl: item.imageUrl,
                                        fit: BoxFit.cover,
                                        width: 1000),
                                  ))
                              .toList(),
                        )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Offers'.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 22,
                          color: const Color(0xff434343),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.getAllOffers();
                          AppRouter.NavigateToWidget(OfferScreen());
                        },
                        child: Text(
                          'See all'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff656565),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  provider.offers.isEmpty
                      ? Container(
                          color: Color(0xffEEEEEE),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        )
                      : Container(
                          height: 210,
                          child: SizedBox(
                            height: 210,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return SizedBox(width: 20);
                              },
                              itemCount: provider.offers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    OfferWidget(provider.offers[index]),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories'.tr(),
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 22,
                          color: const Color(0xff434343),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          provider.getAllCategories();
                          AppRouter.NavigateToWidget(CategoriesScreen());
                        },
                        child: Text(
                          'See all'.tr(),
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xff656565),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  provider.categories.isEmpty
                      ? Container(
                          color: Color(0xffEEEEEE),
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                        )
                      : SizedBox(
                          height: 210,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 20);
                            },
                            itemCount: provider.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        provider.getAllProducts(
                                            provider.categories[index].catId);
                                        AppRouter.NavigateToWidget(
                                            AllProductsScreen(provider
                                                .categories[index].catId));
                                      },
                                      child: CategoryWidget(
                                          provider.categories[index])),
                                  SizedBox(height: 20)
                                ],
                              );
                            },
                          ),
                        ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        }));
  }
}

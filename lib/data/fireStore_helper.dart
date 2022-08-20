import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/models/Ads.dart';
import 'package:e_commerce_app/models/category.dart';
import 'package:e_commerce_app/models/offers.dart';
import 'package:e_commerce_app/models/product.dart';

class FireStoreHelper {
  static FireStoreHelper fireStoreHelperObject = FireStoreHelper();
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> categoryCollection =
      FirebaseFirestore.instance.collection("categories");
  CollectionReference<Map<String, dynamic>> adsCollection =
      FirebaseFirestore.instance.collection("Advertisement");
  CollectionReference<Map<String, dynamic>> offerCollection =
      FirebaseFirestore.instance.collection("Offers");


  Future<List<Category>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoryCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Category> categories = documents.map((e) {
      Category category = Category.fromMap(e.data());
      category.catId = e.id;
      // داخله ID الموجود عندي وخزنت ال map اضافة حقل جديد ل
      return category;
    }).toList();
    return categories;
  }


  /************************ Advertisement ************************ */


  Future<List<Advertisement>> getAllAdvertisement() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await adsCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Advertisement> advertisements = documents.map((e) {
      Advertisement advertisement = Advertisement.fromMap(e.data());
      advertisement.id = e.id;
      log(advertisement.id);
      return advertisement;
    }).toList();
    return advertisements;
  }

/************************ Offers ************************ */


  Future<List<Offer>> getAllOffers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await offerCollection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Offer> offers = documents.map((e) {
      Offer offer = Offer.fromMap(e.data());
      offer.id = e.id;
      log(offer.id);
      return offer;
    }).toList();
    return offers;
  }

  /************************ Products ********************* */


  Future<List<Product>> getAllProducts(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("categories")
        .doc(catId)
        .collection("products")
        .get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        await querySnapshot.docs;

    List<Product> products = await documents.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Product product = Product.fromMap(data);
      return product;
    }).toList();

    return products;
  }


}

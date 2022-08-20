import 'package:e_commerce_app/data/fireStore_helper.dart';
import 'package:e_commerce_app/models/Ads.dart';
import 'package:e_commerce_app/models/category.dart';
import 'package:e_commerce_app/models/offers.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/cupertino.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreProvider() {
    getAllAdvertisement();
    getAllOffers();
    getAllCategories();
  }

  List<Category> categories = [];
  List<Product> products = [];
  List<Advertisement> advertisements = [];
  List<Offer> offers = [];

  /************************ Categories ********************* */
  getAllCategories() async {
    categories = await FireStoreHelper.fireStoreHelperObject.getAllCategories();
    notifyListeners();
  }

  /************************ Advertisement ************************ */
  getAllAdvertisement() async {
    advertisements =
        await FireStoreHelper.fireStoreHelperObject.getAllAdvertisement();
    notifyListeners();
  }

  /************************ Offer ************************ */
  getAllOffers() async {
    offers = await FireStoreHelper.fireStoreHelperObject.getAllOffers();
    notifyListeners();
  }

  /************************ Products ********************* */
  getAllProducts(String catId) async {
    products =
        await FireStoreHelper.fireStoreHelperObject.getAllProducts(catId);
    notifyListeners();
  }
}

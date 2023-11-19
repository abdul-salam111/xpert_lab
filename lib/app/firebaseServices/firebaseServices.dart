import 'package:xpert_lab/app/appConst/index.dart';


class FirestoreServices {
  static gettestCategories(String? categoryName) {
    return firestore
        .collection(testCategoriesCollection)
        .doc(categoryName)
        .collection(testSubCategoryCollection)
        .get();
  }
  static getcategoriesDetails() {
    return firestore.collection(testCategoriesCollection).get();
  }
  getOffersAndDeals() {
    return firestore.collection(offerandDeals).get();
  }
}

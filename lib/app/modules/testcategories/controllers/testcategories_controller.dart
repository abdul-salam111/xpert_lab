import 'package:get/get.dart';

import '../../../appConst/index.dart';
import '../../../data/index.dart';

class TestcategoriesController extends GetxController {
  //TODO: Implement TestcategoriesController
  TestcategoriesController();
  var searchingText="".obs;
  var testCategoryName = "".obs;
  var isSearching = false.obs;
  gettestCategories() {
    return firestore
        .collection(testCategoriesCollection)
        .doc(testCategoryName.value)
        .collection(testSubCategoryCollection)
        .snapshots();
  }

  RxList<TestModel> searchResults = <TestModel>[].obs;
  TestModel? testDetails;
  void searchFirestore(String query, String Categoryname) {
    if (query.isEmpty) {
      searchResults.value = [];
      return;
    }

    firestore
        .collection(testCategoriesCollection)
        .doc(Categoryname)
        .collection(testSubCategoryCollection)
        .where("testName", isLessThanOrEqualTo: query)
        .get()
        .then((querySnapshot) {
      searchResults.value =
          querySnapshot.docs.map((e) => TestModel.fromJson(e)).toList();
    });
  }
}

import 'package:get/get.dart';
import 'package:xpert_lab/app/appConst/index.dart';

class SearchTestsController extends GetxController {
     var searchingText="".obs;
  // RxList<TestModel> searchResult = <TestModel>[].obs;
  // var isSearching = false.obs;
  // QueryDocumentSnapshot? queryDocumentSnapshot;
  // void searchFirestore(String query) async {
  //   if (query.isEmpty) {
  //     searchResult.value = [];
  //     return;
  //   }
 

  //   await firestore
  //       .collection(allTestscollection)
  //       .where("testName", isLessThanOrEqualTo: query)
  //       .get()
  //       .then((value) {
  //     return searchResult.value =
  //         value.docs.map((e) => TestModel.fromJson(e)).toList();
  //   });
  // }

  getAlltest() {
    return firestore.collection(allTestscollection).snapshots();
  }
}

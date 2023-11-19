import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth auth = FirebaseAuth.instance;
User? currentUser = auth.currentUser;
final firestore = FirebaseFirestore.instance;
final prefs = SharedPreferences.getInstance();

//collections

const userCollection = "users";
const testCategoriesCollection="testCategories";
const testSubCategoryCollection="sub_Categories";
const testDetailsCollection="test_Details";
const testCartCollection='test_Cart';
const bookingsCollection='bookings';
const allTestscollection='allTests';
const offerandDeals="offersAndDeals";
const packageBookings="packageBookings";

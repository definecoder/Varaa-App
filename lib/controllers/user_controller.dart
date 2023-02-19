import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vaara_app/consts/consts.dart';

import '../data_classes/product.dart';
import '../data_classes/user.dart';

class UserController extends GetxController {
  UserData? currentUser;

  loadCurrentUserInfo() async {
    // productslist = [];
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collectionRef.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // access the document fields using documentSnapshot.data()
      // print(documentSnapshot['uid']);
      // print('1');
      if (documentSnapshot['id'] == FirebaseAuth.instance.currentUser!.uid) {
        currentUser = UserData(
            id: documentSnapshot['id'],
            email: documentSnapshot['Email'],
            phone_number: documentSnapshot['Phone'],
            username: documentSnapshot['Username'],
            city: documentSnapshot['City'],
            imageUrl: documentSnapshot['PhotoUrl']);
      }

      // userProducts.add(Product(location: 'location', title: 'title', frequency: 'frequency', price: 'price'));
    }
  }
}

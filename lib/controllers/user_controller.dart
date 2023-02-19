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
    if (currentUser!.email == null) currentUser!.email = "null";
    if (currentUser!.phone_number == null) currentUser!.phone_number = "null";
    if (currentUser!.username == null) currentUser!.username = "null";
    if (currentUser!.city == null) currentUser!.city = "null";
    if (currentUser!.imageUrl == null)
      currentUser!.imageUrl =
          "https://media.istockphoto.com/id/1209654046/vector/user-avatar-profile-icon-black-vector-illustration.jpg?s=612x612&w=0&k=20&c=EOYXACjtZmZQ5IsZ0UUp1iNmZ9q2xl1BD1VvN6tZ2UI=";
  }
}

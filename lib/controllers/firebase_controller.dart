import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vaara_app/consts/consts.dart';

class FirebaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  storeProductData({
    title,
    condition,
    description,
    imageUrl,
    rent,
    frequency,
    address,
    city,
    user,
    status,
    isLend,
  }) {
    DocumentReference product = firestore
        .collection('products')
        .doc(); //FirebaseAuth.instance.currentUser!.uid
    product.set({
      'id': product.id,
      'title': title,
      'condition': condition,
      'description': description,
      'imageUrl': imageUrl,
      'rent': rent,
      'frequency': frequency,
      'address': address,
      'city': city,
      'uid': user.uid,
      'status': status,
      'isLend': isLend,
    });
  }
}

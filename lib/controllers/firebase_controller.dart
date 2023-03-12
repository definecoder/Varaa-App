import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  }) async {
    DocumentReference product = firestore
        .collection('products')
        .doc(); //FirebaseAuth.instance.currentUser!.uid
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('/productPhoto/' + product.id);
    firebase_storage.UploadTask uploadTask = ref.putFile(File(imageUrl));
    await Future.value(uploadTask);
    ref.getDownloadURL().then((String genaratedUrl) {
      product.set({
        'id': product.id,
        'title': title,
        'condition': condition,
        'description': description,
        'imageUrl': genaratedUrl,
        'rent': rent,
        'frequency': frequency,
        'address': address,
        'city': city,
        'uid': user.uid,
        'status': status,
        'isLend': isLend,
      });
    });
  }
}

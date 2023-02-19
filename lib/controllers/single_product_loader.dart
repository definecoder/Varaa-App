import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaara_app/consts/consts.dart';

import '../data_classes/product.dart';

class SingleProductLoader extends GetxController {
  Product? curProduct;

  loadProductById(String product_id) async {
    // productslist = [];
    //productslist.clear();
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await collectionRef.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // access the document fields using documentSnapshot.data()
      // print(documentSnapshot['uid']);
      // print('1');
      if (documentSnapshot['id'] == product_id) {
        curProduct = Product(
            location: documentSnapshot['city'],
            title: documentSnapshot['title'],
            frequency: documentSnapshot['frequency'],
            price: documentSnapshot['rent'],
            address: documentSnapshot['address'],
            condition: documentSnapshot['condition'],
            description: documentSnapshot['description'],
            imgLocation: documentSnapshot['imageUrl'],
            isLend: documentSnapshot['isLend'],
            status: documentSnapshot['status'],
            id: documentSnapshot['id']);
      }

      // userProducts.add(Product(location: 'location', title: 'title', frequency: 'frequency', price: 'price'));
    }
  }
}

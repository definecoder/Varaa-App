import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vaara_app/consts/consts.dart';

import '../data_classes/product.dart';

class ProductController extends GetxController {
  List<Product> productslist = [];

  loadAllProducts() async {
    // productslist = [];
    productslist.clear();
    print("cleared list ${productslist.length}");
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await collectionRef.get();

    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      // access the document fields using documentSnapshot.data()
      // print(documentSnapshot['uid']);
      // print('1');
      productslist.add(
        Product(
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
            id: documentSnapshot['id'],
            productOwner: documentSnapshot['uid']),
      );

      // userProducts.add(Product(location: 'location', title: 'title', frequency: 'frequency', price: 'price'));
    }
  }
}

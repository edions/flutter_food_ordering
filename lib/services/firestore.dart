import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  Future<void> addProduct(String product, String price) {
    return products.add({
      'product': product,
      'price' : price,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getProductStream() {
    final productStream =
    products.orderBy("timestamp", descending: true).snapshots();

    return productStream;
  }
}
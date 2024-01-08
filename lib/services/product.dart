import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  Future<void> addProduct(String product, String price, String image) {
    return products.add({
      'product': product,
      'price' : price,
      'image' : image,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getProductStream() {
    final productStream =
    products.orderBy("timestamp", descending: true).snapshots();

    return productStream;
  }
}
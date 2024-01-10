import 'package:cloud_firestore/cloud_firestore.dart';

class FoodService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("foods");

  Future<void> addProduct(String food, String price, String image) {
    return products.add({
      'food': food,
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
import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  final CollectionReference products =
  FirebaseFirestore.instance.collection("users");

  Stream<QuerySnapshot> getCartStream(String userId) {
    final cartStream = products
        .doc(userId)
        .collection("cart")
        .orderBy("timestamp", descending: true)
        .snapshots();

    return cartStream;
  }
}

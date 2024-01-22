import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  //CREATE
  Future<void> addProduct(String product, String price, String image) {
    return products.add({
      'product': product,
      'price' : price,
      'image' : image,
      'timestamp': Timestamp.now(),
    });
  }

  //READ
  Stream<QuerySnapshot> getProductStream() {
    final productStream =
    products.orderBy("timestamp", descending: true).snapshots();

    return productStream;
  }

  //UPDATE
  Future<void> updateProduct(String docID, String updateProduct, String updatePrice) {
    return products.doc(docID).update({
      'product': updateProduct,
      'price' : updatePrice,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE
  Future<void> deleteProduct(String docID){
    return products.doc(docID).delete();
  }
}
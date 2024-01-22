import 'package:cloud_firestore/cloud_firestore.dart';

class FoodService {
  final CollectionReference foods =
      FirebaseFirestore.instance.collection("foods");

  //CREATE
  Future<void> addFood(String food, String price, String image) {
    return foods.add({
      'food': food,
      'price' : price,
      'image' : image,
      'timestamp': Timestamp.now(),
    });
  }

  //READ
  Stream<QuerySnapshot> getFoodStream() {
    final foodStream =
    foods.orderBy("timestamp", descending: true).snapshots();

    return foodStream;
  }

  //UPDATE
  Future<void> updateFood(String docID, String updateProduct, String updatePrice, String updateImg) {
    return foods.doc(docID).update({
      'food': updateProduct,
      'price' : updatePrice,
      'image' : updateImg,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE
  Future<void> deleteFood(String docID){
    return foods.doc(docID).delete();
  }
}

class DrinkService {
  final CollectionReference drinks =
  FirebaseFirestore.instance.collection("drinks");

  //CREATE
  Future<void> addDrink(String food, String price, String image) {
    return drinks.add({
      'drink': food,
      'price' : price,
      'image' : image,
      'timestamp': Timestamp.now(),
    });
  }

  //READ
  Stream<QuerySnapshot> getDrinkStream() {
    final drinkStream =
    drinks.orderBy("timestamp", descending: true).snapshots();

    return drinkStream;
  }

  //UPDATE
  Future<void> updateDrink(String docID, String updateProduct, String updatePrice, String updateImg) {
    return drinks.doc(docID).update({
      'drink': updateProduct,
      'price' : updatePrice,
      'image' : updateImg,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE
  Future<void> deleteDrink(String docID){
    return drinks.doc(docID).delete();
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodService {
  final CollectionReference foods =
      FirebaseFirestore.instance.collection("foods");

  Future<void> addProduct(String food, String price, String image) {
    return foods.add({
      'food': food,
      'price' : price,
      'image' : image,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getFoodStream() {
    final foodStream =
    foods.orderBy("timestamp", descending: true).snapshots();

    return foodStream;
  }
}

class DrinkService {
  final CollectionReference drinks =
  FirebaseFirestore.instance.collection("drinks");

  Future<void> addProduct(String food, String price, String image) {
    return drinks.add({
      'drink': food,
      'price' : price,
      'image' : image,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getDrinkStream() {
    final drinkStream =
    drinks.orderBy("timestamp", descending: true).snapshots();

    return drinkStream;
  }
}
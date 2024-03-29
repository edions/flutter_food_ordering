import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/services/product.dart';

class MyDrinks extends StatefulWidget {
  const MyDrinks({super.key});

  @override
  State<MyDrinks> createState() => _MyDrinksState();
}

class _MyDrinksState extends State<MyDrinks> {

  final DrinkService drinkService = DrinkService();
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  //final TextEditingController addProductText = TextEditingController();

  void addToCart(String productName, String priceText, String imageUrl) async {
    //productService.addProduct(productName, priceText, imageUrl);

    var userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    int quantity = 1;

    await userDocRef.collection('cart').add({
      'product': productName,
      'price': priceText,
      'quantity': quantity,
      'image' : imageUrl,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drinks")),
      body: StreamBuilder<QuerySnapshot>(
        stream: drinkService.getDrinkStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List productList = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = productList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                document.data() as Map<String, dynamic>;
                String productText = data['drink'];
                String priceText = data['price'];
                String imageUrl = data['image'];

                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ListTile(
                        title: Text(productText),
                        subtitle: Text("\$$priceText"),
                        trailing: IconButton(
                          onPressed: () {
                            addToCart(productText, priceText, imageUrl);
                          },
                          icon: const Icon(Icons.shopping_cart),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}

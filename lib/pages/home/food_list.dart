import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/services/product.dart';

class MyFoods extends StatefulWidget {
  const MyFoods({super.key});

  @override
  State<MyFoods> createState() => _MyFoodsState();
}

class _MyFoodsState extends State<MyFoods> {

  final ProductService productService = ProductService();
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController addProductText = TextEditingController();

  void addToCart(String productName) async {
    productService.addProduct(productName, productName);

    var userDocRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    double price = 10.0;
    int quantity = 1;

    await userDocRef.collection('cart').add({
      'product': productName,
      'price': price,
      'quantity': quantity,
      'timestamp': Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Foods")),
      body: StreamBuilder<QuerySnapshot>(
        stream: productService.getProductStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List productList = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = productList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                document.data() as Map<String, dynamic>;
                String productText = data['product'];
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
                            addToCart(productText);
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

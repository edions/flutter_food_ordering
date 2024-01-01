import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final CartService cartService = CartService();
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> removeFromCart(String productId) async {
    // Implement the logic to remove the product from the cart
    // You might use cartService.removeProduct(productId);
  }

  void openCheckoutBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Total Price"),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {

                },
                child: const Text("Confirm Order"),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: cartService.getCartStream(userId),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  List productList = snapshot.data!.docs;
            
                  return ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = productList[index];
                      String docID = document.id;
            
                      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      String productText = data['product'];
            
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage('https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/apples.jpg'),
                        ),
                        title: Text(productText),
                        subtitle: const Text("\$ 99"),
                        trailing: IconButton(
                          onPressed: () {
                            removeFromCart(docID);
                          },
                          icon: const Icon(Icons.remove_shopping_cart),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data"));
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  openCheckoutBox();
                },
                child: const Text("Checkout"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

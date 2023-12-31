import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/services/firestore.dart';

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


  // void openAddProduct() {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         content: TextField(
  //           controller: addProductText,
  //         ),
  //         actions: [
  //           ElevatedButton(
  //               onPressed: () {
  //                 productService.addProduct(addProductText.text, addProductText.text);
  //
  //                 addProductText.clear();
  //
  //                 Navigator.pop(context);
  //               },
  //               child: const Text("Add"),)
  //         ],
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Foods")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //openAddProduct();
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: productService.getProductStream(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List productList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: productList.length,
                itemBuilder: (context, index) {

                DocumentSnapshot document = productList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String productText = data['product'];

                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage('https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/apples.jpg'),
                  ),
                  title: Text(productText),
                  subtitle: const Text("\$ 99"),
                  trailing: IconButton(
                    onPressed: () {
                      addToCart(productText);
                    },
                    icon: const Icon(Icons.add),
                  ),
                );
            }
            );
          } else {
            return const Center(child: Text("No data"));}
        },
      ),
    );
  }
}

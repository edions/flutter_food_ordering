import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/services/firestore.dart';

class MyDrinks extends StatefulWidget {
  const MyDrinks({super.key});

  @override
  State<MyDrinks> createState() => _MyDrinksState();
}

class _MyDrinksState extends State<MyDrinks> {

  final DrinkService drinkService = DrinkService();
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  void openProductBox({String? docID}) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();
    TextEditingController productImageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: productNameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: productPriceController,
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            TextField(
              controller: productImageController,
              decoration: const InputDecoration(labelText: 'Image Link'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                drinkService.addDrink(
                    productNameController.text,
                    productPriceController.text,
                    productImageController.text
                );
              } else {
                drinkService.updateDrink(
                  docID,
                  productNameController.text,
                  productPriceController.text,
                  productImageController.text
                );
              }

              productNameController.clear();
              productPriceController.clear();

              Navigator.pop(context);
            },
            child: const Text("Add"),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Foods")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openProductBox();
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: drinkService.getDrinkStream(),
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
                  String productText = data['drink'];
                  String priceText = "\$"+data['price'];
                  String imageUrl = data['image'];

                  return Container(
                    decoration: BoxDecoration(color: Colors.black87,
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                      title: Text(productText),
                      subtitle: Text(priceText),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => openProductBox(docID: docID),
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => drinkService.deleteDrink(docID),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
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

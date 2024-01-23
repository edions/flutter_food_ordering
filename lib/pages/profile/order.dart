// Import necessary packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final String userId; // Use late to avoid null safety issues

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customers Orders"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection("orders")
            .where(userId)
            .orderBy("deleteTimestamp", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List orderList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = orderList[index];
                String productId = document['productId'];
                Timestamp deleteTimestamp = document['deleteTimestamp'];

                DateTime dateTime = deleteTimestamp.toDate();
                String formattedTimestamp = "${dateTime.toLocal()}";

                return ListTile(
                  title: Text("Tracking Number: $productId"),
                  subtitle: Text("Ordered Date: $formattedTimestamp"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      _showOrderDetailsDialog(context, document);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No ordered items"));
          }
        },
      ),
    );
  }

  // Function to show order details dialog
  void _showOrderDetailsDialog(BuildContext context, DocumentSnapshot document) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Order Details"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Tracking Number: ${document['productId']}"),
              Text("Ordered Date: ${document['deleteTimestamp'].toDate().toLocal()}"),
              Text("Customer Name: edions"),
              Text("Locations: paris"),
              // Add more details as needed

              SizedBox(height: 16), // Add some space
              Text("Product Name:"),
              Text("Quantity: g"),
              const Text("Price: g"),

              SizedBox(height: 16), // Add some space
              Text("Product Name:"),
              Text("Quantity: g"),
              Text("Price: g"),

              SizedBox(height: 16), // Add some space
              Text("Product Name:"),
              Text("Quantity: g"),
              Text("Price: g"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for product count
    int drinkCount = 9;
    int foodCount = 6;

    // Dummy data for the table
    var productData = [
      _ProductData('Coca Cola', 25),
      _ProductData('Pizza', 15),
      _ProductData('Coca Cola', 25),
      _ProductData('Pizza', 15),
      _ProductData('Coca Cola', 25),
      _ProductData('Pizza', 15),
      // Add more product data as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Product Count', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProductCountCard('Drinks', drinkCount),
                _buildProductCountCard('Food', foodCount),
              ],
            ),
            SizedBox(height: 30),
            Text('Most Selling Products', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            _buildProductTable(productData),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCountCard(String category, int count) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              category,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Count: $count',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductTable(List<_ProductData> productData) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Product')),
        DataColumn(label: Text('Count')),
      ],
      rows: productData
          .map((product) => DataRow(cells: [
        DataCell(Text(product.productName)),
        DataCell(Text(product.count.toString())),
      ]))
          .toList(),
    );
  }
}

// Data class for the table
class _ProductData {
  final String productName;
  final int count;

  _ProductData(this.productName, this.count);
}

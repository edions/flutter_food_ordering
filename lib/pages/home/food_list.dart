import 'package:flutter/material.dart';

class MyFoods extends StatelessWidget {
  const MyFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Food"),
        ),
      ),
      body: ListView(
        children: const <Widget>[
          CategorySection(category: 'Donuts'),
          CategorySection(category: 'Takuyaki'),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String category;

  const CategorySection({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
              subtitle: const Text('Price: \$10'),
              trailing: ElevatedButton(
                onPressed: () {
                  print('Button clicked for Item $index in $category');
                },
                child: const Icon(Icons.add),
              ),
            );
          },
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
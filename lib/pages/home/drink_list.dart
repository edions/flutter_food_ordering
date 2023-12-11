import 'package:flutter/material.dart';

class MyDrinks extends StatelessWidget {
  const MyDrinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Drinks"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          CategorySection(category: 'Cow Piss'),
          CategorySection(category: 'Coffe'),
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
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
              subtitle: Text('Price: \$10'),
              trailing: ElevatedButton(
                onPressed: () {
                  print('Button clicked for Item $index in $category');
                },
                child: Icon(Icons.add),
              ),
            );
          },
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
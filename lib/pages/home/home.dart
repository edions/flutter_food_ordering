import 'package:flutter/material.dart';
import '../../widgets/carousel.dart';
import 'drink_list.dart';
import 'food_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyFoods()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              //backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.fastfood,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "FOODS",
                              style: TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 70),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyDrinks()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              //backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.local_drink,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "DRINKS",
                              style: TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text("WHATS NEW",
                  style: TextStyle(
                      fontSize: 20, color: Colors.green
                  ),),
                const SizedBox(height: 20),
                ImageCarousel(
                  imageUrls: const [
                    'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/apples.jpg',
                    'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                    'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/spinach.jpg',
                    // Add more image URLs as needed
                  ],
                ),
                const SizedBox(height: 20),
                const Text("HOT SINGLE IN UR AREA",
                  style: TextStyle(
                      fontSize: 20, color: Colors.green
                  ),),
                const SizedBox(height: 20),
                Column(
                  children: [
                    buildContainerRow(
                        ['https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                          'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                          'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',]
                    ),
                    buildContainerRow(
                        ['https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                          'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                          'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',]
                    ),
                    buildContainerRow(
                        ['https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                          'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',
                          'https://raw.githubusercontent.com/curiouslumber/Ecostora/main/images/Categories/avacados.jpg',]
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



Widget buildContainerRow(List<String> imageUrls) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: imageUrls.map((url) => buildCustomContainer(url)).toList(),
  );
}

Widget buildCustomContainer(String imageUrl) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 94,
        width: 128,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue,
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

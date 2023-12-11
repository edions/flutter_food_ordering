import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;

  ImageCarousel({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 120,
        width: 400,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.white),
        //   borderRadius: BorderRadius.circular(16),
        //   color: Colors.blue,
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CarouselSlider.builder(
            itemCount: imageUrls.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIndex) {
              return Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
                width: 400,
                height: 120,
              );
            },
          ),
        ),
      ),
    );
  }
}

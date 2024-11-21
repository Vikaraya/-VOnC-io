import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



class CurvedAppBarWithCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Cleaners', 'icon': Icons.cleaning_services},
    {'title': 'Sweets', 'icon': Icons.cake},
    {'title': 'Dairy', 'icon': Icons.local_drink},
    {'title': 'Bakery', 'icon': Icons.bakery_dining},
    {'title': 'Meat', 'icon': Icons.restaurant},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Curved App Bar Background
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 250),
          painter: CurvedAppBarPainter(),
        ),
        // Search bar and icons
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Text(
                        "Search for 'Grocery'",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.shopping_cart, color: Colors.white, size: 30),
            ],
          ),
        ),
        // Carousel Slider for Categories
        Positioned(
          top: 120,
          left: 0,
          right: 0,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 120,
              enlargeCenterPage: true,
              viewportFraction: 0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            itemCount: categories.length,
            itemBuilder: (context, index, realIndex) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      categories[index]['icon'],
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    categories[index]['title'],
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              );
            },
          ),
        ),
        // Current location text
        const Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                Text(
                  "Current Location",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "California, USA",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CurvedAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFF004D40)
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..lineTo(0, size.height - 80)
      ..quadraticBezierTo(
        size.width / 2, size.height,
        size.width, size.height - 80,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

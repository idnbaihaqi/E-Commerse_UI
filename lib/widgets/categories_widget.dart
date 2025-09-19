import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List kategori yang lebih banyak dan beragam
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Foods',
        'icon': Icons.restaurant,
        'color': Color(0xFFFF6B6B),
        'bgColor': Color(0xFFFFEBEE)
      },
      {
        'name': 'Fruits',
        'icon': Icons.apple,
        'color': Color(0xFF4CAF50),
        'bgColor': Color(0xFFE8F5E9)
      },
      {
        'name': 'Drinks',
        'icon': Icons.local_drink,
        'color': Color(0xFF2196F3),
        'bgColor': Color(0xFFE3F2FD)
      },
      {
        'name': 'Snacks',
        'icon': Icons.cookie,
        'color': Color(0xFFFF9800),
        'bgColor': Color(0xFFFFF3E0)
      },
      {
        'name': 'Bakery',
        'icon': Icons.breakfast_dining,
        'color': Color(0xFF795548),
        'bgColor': Color(0xFFEFEBE9)
      },
      {
        'name': 'Dairy',
        'icon': Icons.local_cafe,
        'color': Color(0xFF9C27B0),
        'bgColor': Color(0xFFF3E5F5)
      },
      {
        'name': 'Vegetables',
        'icon': Icons.eco,
        'color': Color(0xFF4CAF50),
        'bgColor': Color(0xFFE8F5E9)
      },
      {
        'name': 'Healthy',
        'icon': Icons.favorite,
        'color': Color(0xFFF44336),
        'bgColor': Color(0xFFFFEBEE)
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: categories[i]['bgColor'],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Ikon kategori dengan warna yang sesuai
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: categories[i]['color'].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: categories[i]['color'].withOpacity(0.4),
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      categories[i]['icon'],
                      color: categories[i]['color'],
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    categories[i]['name'],
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: categories[i]['color'],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
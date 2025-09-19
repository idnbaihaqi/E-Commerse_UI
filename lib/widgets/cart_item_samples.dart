import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  // Data produk dengan gambar yang berbeda-beda
    final List<Map<String, dynamic>> products = [
    {
      'name': 'Chair',
      'price': 6.8,
      'quantity': 1,
      'image': 'assets/images/kursi.jpg',
    },
    {
      'name': 'Jacket',
      'price': 14.2,
      'quantity': 1,
      'image': 'assets/images/jaket.jpg',
    },
    {
      'name': 'Fresh Salad',
      'price': 11.2,
      'quantity': 1,
      'image': 'assets/images/salad.jpg',
    },
    {
      'name': 'Cart',
      'price': 6.2,
      'quantity': 1,
      'image': 'assets/images/keranjang.jpg',
    },
    {
      'name': 'Clock',
      'price': 25.0,
      'quantity': 1,
      'image': 'assets/images/jam.jpg',
    },
  ];


  void _incrementQuantity(int index) {
    setState(() {
      products[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (products[index]['quantity'] > 1) {
        products[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildCartItem(index);
        },
      ),
    );
  }

  Widget _buildCartItem(int index) {
    final product = products[index];

    return Container(
      height: 140,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gambar Produk - Menggunakan image dari data produk
          Container(
            width: 100,
            margin: const EdgeInsets.only(left: 0, top: 0, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(product['image'] as String), // ← GANTI DENGAN IMAGE DARI DATA
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Informasi Produk
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product['name'] as String,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$${product['price'].toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 216, 139, 25),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Column untuk Tombol Quantity dan Detail Produk
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Tombol Quantity dengan desain hijau
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 139, 25).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: const Color.fromARGB(255, 216, 139, 25)),
                  ),
                  child: Row(
                    children: [
                      // Tombol Kurang (hijau)
                      IconButton(
                        icon: const Icon(Icons.remove, size: 18, color: Color.fromARGB(255, 216, 139, 25)),
                        onPressed: () => _decrementQuantity(index),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                      ),
                      
                      // Jumlah
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          product['quantity'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 216, 139, 25),
                          ),
                        ),
                      ),
                      
                      // Tombol Tambah (hijau)
                      IconButton(
                        icon: const Icon(Icons.add, size: 18, color: Color.fromARGB(255, 216, 139, 25)),
                        onPressed: () => _incrementQuantity(index),
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                
                // Tombol Detail Produk
                Container(
                  width: 110,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 216, 139, 25),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 14,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Detail",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
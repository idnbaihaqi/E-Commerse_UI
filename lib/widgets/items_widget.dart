import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {
  final VoidCallback? onAddToCart;

  const ItemsWidget({super.key, this.onAddToCart});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  final List<bool> _isFavoriteList = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.62,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        // PRODUCT 1: Chair
        _buildProductCard(
          index: 0,
          image: "images/kursi.jpg",
          name: "Chair",
          description: "Comfortable wooden chair", // ✅ 3 kata
          currentPrice: "Rp 199.000",
          originalPrice: "Rp 299.000",
          hasFreeShip: true,
        ),

        // PRODUCT 2: Jacket
        _buildProductCard(
          index: 1,
          image: "images/jaket.jpg",
          name: "Jacket",
          description: "Warm winter jacket", // ✅ 3 kata
          currentPrice: "Rp 89.000",
          originalPrice: "Rp 129.000",
          hasFreeShip: true,
        ),

        // PRODUCT 3: Fresh Salad
        _buildProductCard(
          index: 2,
          image: "images/salad.jpg",
          name: "Fresh Salad",
          description: "Healthy green salad", // ✅ 3 kata
          currentPrice: "Rp 75.000",
          originalPrice: "Rp 95.000",
          hasFreeShip: false,
        ),

        // PRODUCT 4: Cart
        _buildProductCard(
          index: 3,
          image: "images/keranjang.jpg",
          name: "Cart",
          description: "Portable small cart", // ✅ 3 kata
          currentPrice: "Rp 45.000",
          originalPrice: "Rp 65.000",
          hasFreeShip: false,
        ),

        // PRODUCT 5: Clock
        _buildProductCard(
          index: 4,
          image: "images/jam.jpg",
          name: "Clock",
          description: "Modern wall clock", // ✅ 3 kata
          currentPrice: "Rp 35.000",
          originalPrice: "Rp 50.000",
          hasFreeShip: true,
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required int index,
    required String image,
    required String name,
    required String description,
    required String currentPrice,
    required String originalPrice,
    required bool hasFreeShip,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          Stack(
            children: [
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.shopping_bag,
                          size: 40,
                          color: Color.fromARGB(255, 216, 139, 25),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // FREE SHIP Badge (hanya jika hasFreeShip = true)
              if (hasFreeShip)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 216, 139, 25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "FREE SHIP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              // Tombol Favorit
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    _isFavoriteList[index]
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: _isFavoriteList[index] ? Colors.red : Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavoriteList[index] = !_isFavoriteList[index];
                    });
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ],
          ),

          // Info Produk
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 3),

                Text(
                  description,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                // Harga
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentPrice,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 216, 139, 25),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Tombol Add to Cart
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.onAddToCart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 216, 139, 25),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(0, 36),
                    ),
                    child: const Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

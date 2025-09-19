import 'package:flutter/material.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_item_samples.dart';
import '../widgets/cart_bottom_nav_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: ListView(
        children: [
          // Daftar item cart
          const CartItemSamples(),
          
          // Total harga section - DESAIN CLEAN TANPA CARD
          Container(
            color: Colors.white, // Background putih polos
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                // Subtotal
                _buildPriceRow("Subtotal:", "\$56.68"),
                const SizedBox(height: 12),
                
                // Shipping
                _buildPriceRow("Shipping:", "\$2.00"),
                const SizedBox(height: 12),
                
                // Discount
                _buildPriceRow("Discount:", "-\$5.00", isDiscount: true),
                const SizedBox(height: 16),
                
                // Divider
                const Divider(height: 1, color: Colors.grey),
                const SizedBox(height: 16),
                
                // Total
                _buildPriceRow("Total:", "\$53.68", isTotal: true),
              ],
            ),
          ),
        ],
      ),
      
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }

  // Helper method untuk baris harga
  Widget _buildPriceRow(String label, String value, {bool isDiscount = false, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 18 : 14,
            fontWeight: FontWeight.bold,
            color: isDiscount 
              ? Colors.orange 
              : (isTotal ? const Color.fromARGB(255, 255, 160, 20) : Colors.black87),
          ),
        ),
      ],
    );
  }
}

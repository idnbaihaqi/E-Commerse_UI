import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          // Baris pertama: Logo dan Notifikasi
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo toko (bisa diganti dengan image asset nanti)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 139, 25), // Hijau tema
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              
              // Ikon Notifikasi dengan Badge
              badges.Badge(
                badgeContent: const Text(
                  "100",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.red,
                  padding: EdgeInsets.all(4),
                ),
                child: InkWell(
                  onTap: () {
                    // Aksi ketika notifikasi ditekan
                  },
                  child: const Icon(
                    Icons.notifications,
                    size: 30,
                    color: Color.fromARGB(255, 216, 139, 25), // Warna hijau tema
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 15),
          
          // Baris kedua: Search Bar full width
          Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color.fromARGB(255, 216, 139, 25)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Cari produk...",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    const Icon(Icons.filter_list, color: Color.fromARGB(255, 216, 139, 25)),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
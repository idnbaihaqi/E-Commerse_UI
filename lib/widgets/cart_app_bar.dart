import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _showPopupMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Popup
                const Text(
                  'Opsi Keranjang',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 216, 139, 25),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Menu Items
                _buildPopupItem(
                  context,
                  icon: Icons.delete_outline,
                  text: 'Hapus Semua Item',
                  onTap: () {
                    Navigator.pop(context);
                    _showClearCartDialog(context);
                  },
                ),
                
                _buildPopupItem(
                  context,
                  icon: Icons.favorite_border,
                  text: 'Simpan untuk Nanti',
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item disimpan untuk nanti'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                
                _buildPopupItem(
                  context,
                  icon: Icons.share,
                  text: 'Bagikan Keranjang',
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur berbagi keranjang'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 8),
                
                // Tombol Tutup
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Tutup',
                    style: TextStyle(color: Color.fromARGB(255, 216, 139, 25)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPopupItem(BuildContext context, {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 216, 139, 25)),
      title: Text(text),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 24,
    );
  }

  void _showClearCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Semua Item?'),
          content: const Text('Apakah Anda yakin ingin menghapus semua item dari keranjang?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Semua item dihapus dari keranjang'),
                    backgroundColor: Colors.orange,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 216, 139, 25),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 28,
        ),
        onPressed: () {
          // Tidak melakukan apa-apa atau bisa ditambah fungsionalitas lain
        },
      ),
      title: const Text(
        'Cart',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            _showPopupMenu(context);
          },
        ),
      ],
    );
  }
}
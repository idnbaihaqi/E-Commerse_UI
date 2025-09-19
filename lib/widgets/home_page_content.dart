import 'package:flutter/material.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/categories_widget.dart';
import '../widgets/items_widget.dart';

class HomePageContent extends StatelessWidget {
  final VoidCallback? onAddToCart; // ✅ Terima callback

  const HomePageContent({super.key, this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Bar
              const HomeAppBar(),
              CategoriesWidget(),
              // ... (kode lainnya tetap sama)

              // Products Grid - ✅ PASS callback ke ItemsWidget
              ItemsWidget(onAddToCart: onAddToCart),
            ],
          ),
        ),
      ),
    );
  }
}
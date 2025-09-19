import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'account_page.dart';
import 'cart_page.dart';
import 'list_chat.dart';
import '../widgets/home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const HomePageContent(), // Akan diubah
    const CartPage(),
    ChatListPage(),
    const AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    // ✅ Replace HomePageContent dengan callback
    _pages[0] = HomePageContent(
      onAddToCart: () {
        setState(() {
          _currentIndex = 1; // Switch ke cart page
          _pageController.jumpToPage(1); // Animate ke page 1
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // ← Background putih untuk seluruh scaffold
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: CurvedNavigationBar(
          index: _currentIndex,
          height: 60,
          animationCurve: Curves.easeInOut,
          color: const Color.fromARGB(255, 255, 160, 20),
          buttonBackgroundColor: const Color.fromARGB(255, 255, 160, 20),
          backgroundColor: Colors.transparent,
          items: const [
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.shopping_cart, size: 30, color: Colors.white),
            Icon(Icons.chat, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(index);
            });
          },
        ),
      ),
    );
  }
}
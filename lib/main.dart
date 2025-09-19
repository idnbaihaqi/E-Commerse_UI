import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/account_page.dart';
import 'pages/cart_page.dart';
import 'pages/change_password_page.dart';
import 'pages/home_page.dart'; 
import 'pages/chat_detail.dart'; 
import 'pages/list_chat.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'AccountPage',
      routes: {
        'LoginPage': (context) => const LoginPage(),
        'RegisterPage': (context) => const RegisterPage(),
        'HomePage': (context) => const HomePage(), 
        'AccountPage': (context) => const AccountPage(),
        'CartPage': (context) => const CartPage(),
        'ChangePasswordPage': (context) => const ChangePasswordPage(),
        'ChatDetail': (context) => ChatDetailPage(shopName: 'Shop Name', shopImage: 'assets/images/shop_image.png'),
        "ListChat": (context) => ChatListPage(),
      },
    );
  }
}
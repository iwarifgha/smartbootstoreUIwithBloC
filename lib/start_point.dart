import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 import 'package:shoe_store/views/favorites.dart';
import 'package:shoe_store/views/orders.dart';
import 'package:shoe_store/views/profile.dart';
import 'package:shoe_store/widgets/helpers/shoe_app_bottom_bar.dart';

import 'views/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  List screens = [
    HomeScreen(),
    const ProfileScreen(),
    const FavoritesScreen(),
    const OrdersScreen()
  ];


 int screenIndex = 0;


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: screens[screenIndex],
      bottomNavigationBar: ShoeAppBottomBar(
        items: const  [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled) , label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded) , label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag) , label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.discount) , label: 'Orders'),
        ],
        currentIndex: screenIndex,
        onTap: (int value) {
          setState(() {
            screenIndex = value;
          });
        },
      )
    );
  }
}

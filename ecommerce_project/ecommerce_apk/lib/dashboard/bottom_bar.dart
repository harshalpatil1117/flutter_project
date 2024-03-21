import 'package:common/common.dart';
import 'package:e_commerce/dashboard/wishlist.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';
import 'dashboard.dart';
import 'my_cart.dart';


class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => BottomBarWidgetState();
}

class BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedIndex = 0;

  List<Widget> bottomMenu = [
     Dashboard(),
    Wishlist(),
    MyCart(),
    Center(
      child: const Text(
        'Profile',
      ),
    ),
    Center(
      child: const Text(
        'Profile',
      ),
    ),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Scaffold(
      body: bottomMenu[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          items:  [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Constant.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: Constant.wishList,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: Constant.cart,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: Constant.chat,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Constant.profile,
            ),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: theme.EcommerceColorsExtensions.primary,
          onTap: _onItemTapped,
          unselectedItemColor: theme.EcommerceColorsExtensions.secondary,

        ),
      ),
    );
  }
}



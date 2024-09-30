import 'package:flutter/material.dart';
import 'package:shopping_applicaton/screens/cart_page.dart';
import 'package:shopping_applicaton/screens/product_list.dart';
class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int selectedPage = 0;

  List<Widget> pages = const [ProductsList(), CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[selectedPage],
      body: IndexedStack(
        index: selectedPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectedPage = value;
          setState(() {});
        },
        currentIndex: selectedPage,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
        ],
      ),
    );
  }
}

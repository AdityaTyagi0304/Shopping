import 'package:flutter/material.dart';
import '../widgets/custom_bottomnavigation.dart';
import '../widgets/product_item.dart';
import '../data/products.dart'; // Assuming this file contains 'Products'
import '../models/product.dart';// Assuming this file contains 'Product' class
import '../screens/cart_screen.dart';
import '../widgets/custom_searchbar.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> displayedProducts;

  @override
  void initState() {
    super.initState();
    displayedProducts = Products; // Start with all products displayed
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedProducts = Products; // Show all products if search query is empty
      });
    } else {
      setState(() {
        displayedProducts = Products
            .where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }



  int _getCrossAxisCount(BuildContext context) {
    // Adjust crossAxisCount based on screen size
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      // For mobile screens
      return 3;
    } else {
      // For tablets and larger screens
      return 4;
    }
  }

  double _getCrossAxisSpacing(BuildContext context) {
    // Adjust spacing based on screen size
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      // For mobile screens
      return 10.0;
    } else {
      // For tablets and larger screens
      return 30.0;
    }
  }

  double _getMainAxisSpacing(BuildContext context) {
    // Adjust spacing based on screen size
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      // For mobile screens
      return 10.0;
    } else {
      // For tablets and larger screens
      return 30.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: Column(
        children: [
           //custom_SearchBar(onSearch: _performSearch),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: displayedProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(context),
                childAspectRatio: 2 / 3,
                crossAxisSpacing: _getCrossAxisSpacing(context),
                mainAxisSpacing: _getMainAxisSpacing(context),
              ),
              itemBuilder: (ctx, index) {
                return ProductItem(product: displayedProducts[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }


}


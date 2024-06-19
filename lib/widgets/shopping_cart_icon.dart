import 'package:flutter/material.dart';

class ShoppingCartIcon extends StatelessWidget {
  const ShoppingCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(icon: const Icon(Icons.favorite),
    onPressed: (){
    Navigator.of(context).pushNamed('/favourite');
    },
      ),
      IconButton(icon: const Icon(Icons.shopping_cart),
      onPressed: (){
      },
      ),
    ],
    );


  }
}

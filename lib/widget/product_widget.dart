import 'package:dio_app/models/product.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Text(
            product.title,
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.network(
              product.image,
            ),
          ),
          Text(product.description),
        ],
      ),
    );
  }
}

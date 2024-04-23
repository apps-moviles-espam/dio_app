import 'package:dio_app/api/product_api.dart';
import 'package:dio_app/helpers/http_response.dart';
import 'package:dio_app/models/product.dart';
import 'package:dio_app/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productID;
  const ProductDetailScreen({super.key, required this.productID});

  Future<Product> loadSingleProduct() async {
    HttpResponse<Product> response =
        await GetIt.instance<ProductAPI>().getSingleProduct(productID);
    return response.data!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product>(
        future: loadSingleProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text("Fake Store API"),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    snapshot.data!.title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrangeAccent),
                  ),
                  Text(snapshot.data!.price.toString()),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      snapshot.data!.image,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text(snapshot.data!.description),
                  Text(snapshot.data!.category.name),
                  Text(snapshot.data!.rating.rate.toString()),
                  TextButton(
                      child: const Text("Update Screen"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdateProductScreen(
                            id: snapshot.data!.id,
                            title: snapshot.data!.title,
                            price: snapshot.data!.price.toString(),
                            description: snapshot.data!.description,
                            image: snapshot.data!.image,
                            category: snapshot.data!.category.name,
                          );
                        }));
                      })
                ],
              ),
            ),
          );
        });
  }
}

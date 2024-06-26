import 'package:dio_app/api/product_api.dart';
import 'package:dio_app/helpers/http_response.dart';
import 'package:dio_app/models/delete_product_response.dart';
import 'package:dio_app/models/product.dart';
import 'package:dio_app/models/products_response.dart';
import 'package:dio_app/screens/product_detail_screen.dart';
import 'package:dio_app/widget/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  //Agregar la inyección de dependencias con GetIt
  final ProductAPI productAPI = GetIt.instance<ProductAPI>();

  //Crear la función llamada loadProducts() para la consulta de los datos
  Future<List<Product>> loadProducts() async {
    HttpResponse<ProductsResponse> response = await productAPI.getAllProducts();
    return response.data!.products;
  }

  void showDetail(int id) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductDetailScreen(productID: id);
    }));
  }

  Future<void> deleteProduct(int id) async {
    final HttpResponse<DeleteProductResponse> httpResponse =
        await productAPI.deleteProduct(id);
    debugPrint(httpResponse.data!.title);
    debugPrint("Item deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Store API"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.orangeAccent,
      body: FutureBuilder<List<Product>>(
        future: loadProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                List<Product>? productList = snapshot.data;
                return ProductWidget(
                  product: productList![index],
                  onTap: showDetail,
                  onSwipe: deleteProduct,
                );
              });
        },
      ),
    );
  }
}
